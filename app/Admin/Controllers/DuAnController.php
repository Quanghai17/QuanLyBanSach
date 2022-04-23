<?php
#app/Http/Admin/Controllers/DuAnController.php
namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\DuAn;
use Illuminate\Http\Request;
use Validator;

class DuAnController extends Controller
{
    protected $arrTarget;
    protected $dataType;

    public function __construct()
    {
        $this->arrTarget = ['_blank' => '_blank', '_self' => '_self'];
        $this->dataType = ['0' => 'Banner', '1' => 'Background'];
    }

    public function index()
    {

        $data = [
            'title' => 'Danh sách dự án',
            'subTitle' => '',
            'icon' => 'fa fa-indent',
            'urlDeleteItem' => route('admin_duan.delete'),
            'removeList' => 0, // 1 - Enable function delete list item
            'buttonRefresh' => 0, // 1 - Enable button refresh
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
            'image' => 'Hình ảnh',
            'html' => 'Tên',
            'status' => 'Trạng thái',
            'action' => trans('banner.admin.action'),
        ];

        $sort_order = request('sort_order') ?? 'id_desc';
        $keyword = request('keyword') ?? '';
        $arrSort = [
            'id__desc' => trans('banner.admin.sort_order.id_desc'),
            'id__asc' => trans('banner.admin.sort_order.id_asc'),
        ];
        $obj = new DuAn;
        if ($keyword) {
            $obj = $obj->whereRaw('(html like "%' . $keyword . '%" OR image like "%' . $keyword . '%" )');
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
                'image' => sc_image_render($row->getThumb(), '', '50px', 'Image'),
                'html' => $row['html'],
                'status' => $row['status'] ? '<span class="label label-success">ON</span>' : '<span class="label label-danger">OFF</span>',
                'action' => '
                    <a href="' . route('admin_duan.edit', ['id' => $row['id']]) . '"><span title="' . trans('banner.admin.edit') . '" type="button" class="btn btn-flat btn-primary"><i class="fa fa-edit"></i></span></a>&nbsp;

                  <span onclick="deleteItem(' . $row['id'] . ');"  title="' . trans('banner.admin.delete') . '" class="btn btn-flat btn-danger"><i class="fa fa-trash"></i></span>
                  ',
            ];
        }

        $data['listTh'] = $listTh;
        $data['dataTr'] = $dataTr;
        $data['pagination'] = $dataTmp->appends(request()->except(['_token', '_pjax']))->links('admin.component.pagination');
        $data['resultItems'] = trans('banner.admin.result_item', ['item_from' => $dataTmp->firstItem(), 'item_to' => $dataTmp->lastItem(), 'item_total' => $dataTmp->total()]);

//menuRight
        $data['menuRight'][] = '<a href="' . route('admin_duan.create') . '" class="btn  btn-success  btn-flat" title="New" id="button_create_new">
        <i class="fa fa-plus" title="'.trans('admin.add_new').'"></i>
                           </a>';
//=menuRight

//menuSearch        
        $optionSort = '';
        foreach ($arrSort as $key => $status) {
            $optionSort .= '<option  ' . (($sort_order == $key) ? "selected" : "") . ' value="' . $key . '">' . $status . '</option>';
        }

        $data['urlSort'] = route('admin_duan.index');
        $data['optionSort'] = $optionSort;
//=menuSort

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
            'title' => 'Tạo dự án',
            'subTitle' => '',
            'title_description' => 'Tạo dự án',
            'icon' => 'fa fa-plus',
            'banner' => [],
            'arrTarget' => $this->arrTarget,
            'dataType' => $this->dataType,
            'url_action' => route('admin_duan.create'),
        ];
        return view('admin.screen.duan')
            ->with($data);
    }

/**
 * Post create new order in admin
 * @return [type] [description]
 */
    public function postCreate()
    {
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'html' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        $dataInsert = [
            'image' => $data['image'],
            'html' => $data['html'],
            'status' => empty($data['status']) ? 0 : 1,
        ];
        DuAn::create($dataInsert);

        return redirect()->route('admin_duan.index')->with('success', trans('banner.admin.create_success'));

    }

/**
 * Form edit
 */
    public function edit($id)
    {
        $banner = DuAn::find($id);
        if ($banner === null) {
            return 'no data';
        }
        $data = [
            'title' => trans('banner.admin.edit'),
            'subTitle' => '',
            'title_description' => '',
            'icon' => 'fa fa-pencil-square-o',
            'arrTarget' => $this->arrTarget,
            'dataType' => $this->dataType,
            'banner' => $banner,
            'url_action' => route('admin_duan.edit', ['id' => $banner['id']]),
        ];
        return view('admin.screen.duan')
            ->with($data);
    }

/**
 * update status
 */
    public function postEdit($id)
    {
        $data = request()->all();
        $dataOrigin = request()->all();
        $validator = Validator::make($dataOrigin, [
            'html' => 'required',
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }
//Edit

        $dataUpdate = [
            'image' => $data['image'],
            'html' => $data['html'],
            'status' => empty($data['status']) ? 0 : 1,

        ];
        $obj = DuAn::find($id);
        $obj->update($dataUpdate);

//
        return redirect()->route('admin_duan.index')->with('success', trans('banner.admin.edit_success'));

    }

/*
Delete list item
Need mothod destroy to boot deleting in model
 */
    public function deleteList()
    {
        if (!request()->ajax()) {
            return response()->json(['error' => 1, 'msg' => 'Method not allow!']);
        } else {
            $ids = request('ids');
            $arrID = explode(',', $ids);
            DuAn::destroy($arrID);
            return response()->json(['error' => 0, 'msg' => '']);
        }
    }

}
