<?php
#app/Http/Admin/Controllers/ShopCategoryController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopCategory;
use App\Models\ShopCategoryDescription;
use App\Models\ShopLanguage;
use Illuminate\Http\Request;
use Validator;

class ShopCategoryController extends Controller
{
    public $languages;

    public function __construct()
    {
        $this->languages = ShopLanguage::getList();

    }

    public function index()
    {
        $data = [
            'title' => trans('category.admin.list'),
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => route('admin_category.delete'),
            'removeList' => 1, // 1 - Enable function delete list item
            'buttonRefresh' => 1, // 1 - Enable button refresh
            'buttonSort' => 1, // 1 - Enable button sort
            'css' => '', 
            'js' => '',
        ];
        //Process add content
        $data['menuRight'] = sc_config_group('menuRight', \Request::route()->getName());
        $data['menuLeft'] = sc_config_group('menuLeft', \Request::route()->getName());
        $data['topMenuRight'] = sc_config_group('topMenuRight', \Request::route()->getName());
        $data['topMenuLeft'] = sc_config_group('topMenuLeft', \Request::route()->getName());
        $data['blockBottom'] = sc_config_group('blockBottom', \Request::route()->getName());

        $listTh = [
            'id' => trans('category.id'),
            'image' => trans('category.image'),
            'title' => trans('category.title'),
            'parent' => trans('category.parent'),
            'top' => trans('category.top'),
            'status' => trans('category.status'),
            'sort' => trans('category.sort'),
            'action' => trans('category.admin.action'),
        ];
        $sort_order = request('sort_order') ?? 'id_desc';
        $keyword = request('keyword') ?? '';
        $arrSort = [
            'id__desc' => trans('category.admin.sort_order.id_desc'),
            'id__asc' => trans('category.admin.sort_order.id_asc'),
            'title__desc' => trans('category.admin.sort_order.title_desc'),
            'title__asc' => trans('category.admin.sort_order.title_asc'),
        ];
        $obj = new ShopCategory;

        $obj = $obj
            ->leftJoin(SC_DB_PREFIX.'shop_category_description', SC_DB_PREFIX.'shop_category_description.category_id', SC_DB_PREFIX.'shop_category.id')
            ->where(SC_DB_PREFIX.'shop_category_description.lang', sc_get_locale());
        if ($keyword) {
            $obj = $obj->whereRaw('(id = ' . (int) $keyword . ' OR '.SC_DB_PREFIX.'shop_category_description.title like "%' . $keyword . '%" )');
        }
        if ($sort_order && array_key_exists($sort_order, $arrSort)) {
            $field = explode('__', $sort_order)[0];
            $sort_field = explode('__', $sort_order)[1];
            $obj = $obj->orderBy($field, $sort_field);

        } else {
            $obj = $obj->orderBy('id', 'desc');
        }
        $dataTmp = $obj->paginate(20);

        $dataTr = [];
        foreach ($dataTmp as $key => $row) {
            $dataTr[] = [
                'id' => $row['id'],
                'image' => sc_image_render($row->getThumb(), '50px', '50px', $row['title']),
                'title' => $row['title'],
                'parent' => $row['parent'] ? ($row->getParent() ? $row->getParent()['title'] : '') : 'ROOT',
                'top' => $row['top'] ? '<span class="label label-success">ON</span>' : '<span class="label label-danger">OFF</span>',
                'status' => $row['status'] ? '<span class="label label-success">ON</span>' : '<span class="label label-danger">OFF</span>',
                'sort' => $row['sort'],
                'action' => '
                    <a href="' . route('admin_category.edit', ['id' => $row['id']]) . '"><span title="' . trans('category.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

                    <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>'
                ,
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('category.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);


//menuRight
        $data['menuRight'][] = '<a href="' . route('admin_category.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
        <i class="fa fa-plus" title="'.trans('admin.add_new').'"></i>
        </a>';
//=menuRight

//menuSort        
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('admin_category.index');
        $data['optionSort'] = $optionSort;
//=menuSort

//menuSearch        
        $data['topMenuRight'][] = '
                <form action="' . route('admin_category.index') . '" id="button_search">
                   <div onclick="$(this).submit();" class="btn-group pull-right">
                           <a class="btn btn-flat btn-primary" title="Refresh">
                              <i class="fa  fa-search"></i>
                           </a>
                   </div>
                   <div class="btn-group pull-right">
                         <div class="form-group">
                           <input type="text" name="keyword" class="form-control" placeholder="' . trans('category.admin.search_place') . '" value="' . $keyword . '">
                         </div>
                   </div>
                </form>';
//=menuSearch

        return view('admin.screen.list')
            ->with($data);
    }

/**
 * Form create new order in admin
 * @return [type] [description]
 */
    public function create()
    {
        $data = [
            'title' => trans('category.admin.add_new_title'),
            'subTitle' => '',
            'title_description' => trans('category.admin.add_new_des'),
            'icon' => 'fa fa-plus',
            'languages' => $this->languages,
            'category' => [],
            'categories' => (new ShopCategory)->getTreeCategories(),
            'url_action' => route('admin_category.create'),

        ];

        return view('admin.screen.category')
            ->with($data);
    }

/**
 * Post create new order in admin
 * @return [type] [description]
 */
    public function postCreate()
    {
        $data = request()->all();

        $langFirst = array_key_first(sc_language_all()->toArray()); //get first code language active
        $data['alias'] = !empty($data['alias'])?$data['alias']:$data['descriptions'][$langFirst]['title'];
        $data['alias'] = sc_word_format_url($data['alias']);
        $data['alias'] = sc_word_limit($data['alias'], 100);

        $validator = Validator::make($data, [
            'image' => 'required',
            'parent' => 'required',
            'sort' => 'numeric|min:0',
            'alias' => 'required|regex:/(^([0-9A-Za-z\-_]+)$)/|unique:'.SC_DB_PREFIX.'shop_category,alias|string|max:100',
            'descriptions.*.title' => 'required|string|max:200',
            'descriptions.*.keyword' => 'nullable|string|max:200',
            'descriptions.*.description' => 'nullable|string|max:300',
        ], [
            'descriptions.*.title.required' => trans('validation.required', ['attribute' => trans('category.title')]),
            'alias.regex' => trans('category.alias_validate'),
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput($data);
        }

        $dataInsert = [
            'image' => $data['image'],
            'alias' => $data['alias'],
            'parent' => (int) $data['parent'],
            'top' => !empty($data['top']) ? 1 : 0,
            'status' => !empty($data['status']) ? 1 : 0,
            'sort' => (int) $data['sort'],
        ];
        $id = ShopCategory::insertGetId($dataInsert);
        $dataDes = [];
        $languages = $this->languages;
        foreach ($languages as $code => $value) {
            $dataDes[] = [
                'category_id' => $id,
                'lang' => $code,
                'title' => $data['descriptions'][$code]['title'],
                'keyword' => $data['descriptions'][$code]['keyword'],
                'description' => $data['descriptions'][$code]['description'],
            ];
        }
        ShopCategoryDescription::insert($dataDes);

        return redirect()->route('admin_category.index')->with('success', trans('category.admin.create_success'));

    }

/**
 * Form edit
 */
    public function edit($id)
    {
        $category = ShopCategory::find($id);
        if ($category === null) {
            return 'no data';
        }
        $data = [
            'title' => trans('category.admin.edit'),
            'subTitle' => '',
            'title_description' => '',
            'icon' => 'fa fa-pencil-square-o',
            'languages' => $this->languages,
            'category' => $category,
            'categories' => (new ShopCategory)->getTreeCategories(),
            'url_action' => route('admin_category.edit', ['id' => $category['id']]),
        ];
        return view('admin.screen.category')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit($id)
    {
        $category = ShopCategory::find($id);
        $data = request()->all();

        $langFirst = array_key_first(sc_language_all()->toArray()); //get first code language active
        $data['alias'] = !empty($data['alias'])?$data['alias']:$data['descriptions'][$langFirst]['title'];
        $data['alias'] = sc_word_format_url($data['alias']);
        $data['alias'] = sc_word_limit($data['alias'], 100);

        $validator = Validator::make($data, [
            'image' => 'required',
            'parent' => 'required',
            'sort' => 'numeric|min:0',
            'alias' => 'required|regex:/(^([0-9A-Za-z\-_]+)$)/|unique:'.SC_DB_PREFIX.'shop_category,alias,' . $category->id . ',id|string|max:100',
            'descriptions.*.title' => 'required|string|max:200',
            'descriptions.*.keyword' => 'nullable|string|max:200',
            'descriptions.*.description' => 'nullable|string|max:300',
        ], [
            'descriptions.*.title.required' => trans('validation.required', ['attribute' => trans('category.title')]),
            'alias.regex' => trans('category.alias_validate'),
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput($data);
        }
//Edit

        $dataUpdate = [
            'image' => $data['image'],
            'alias' => $data['alias'],
            'parent' => $data['parent'],
            'sort' => $data['sort'],
            'top' => empty($data['top']) ? 0 : 1,
            'status' => empty($data['status']) ? 0 : 1,
        ];

        $category->update($dataUpdate);
        $category->descriptions()->delete();
        $dataDes = [];
        foreach ($data['descriptions'] as $code => $row) {
            $dataDes[] = [
                'category_id' => $id,
                'lang' => $code,
                'title' => $row['title'],
                'keyword' => $row['keyword'],
                'description' => $row['description'],
            ];
        }
        ShopCategoryDescription::insert($dataDes);

//
        return redirect()->route('admin_category.index')->with('success', trans('category.admin.edit_success'));

    }

/*
Delete list Item
Need mothod destroy to boot deleting in model
 */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => 'Method not allow!']);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            ShopCategory::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

}
