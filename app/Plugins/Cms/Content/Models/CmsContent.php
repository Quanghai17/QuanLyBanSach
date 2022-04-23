<?php
#app/Plugins/Cms/Content/Models/CmsContent.php
namespace App\Plugins\Cms\Content\Models;

use App\Plugins\Cms\Content\Models\CmsCategory;
use App\Plugins\Cms\Content\Models\CmsImage;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Cache;
use App\Models\ModelTrait;

class CmsContent extends Model
{
    use ModelTrait;

    public $table = SC_DB_PREFIX.'cms_content';
    protected $guarded = [];
    protected $connection = SC_CONNECTION;

    protected  $category = []; // 

    public function category()
    {
        return $this->belongsTo(CmsCategory::class, 'category_id', 'id');
    }
    public function descriptions()
    {
        return $this->hasMany(CmsContentDescription::class, 'cms_content_id', 'id');
    }
    public function images()
    {
        return $this->hasMany(CmsImage::class, 'content_id', 'id');
    }

/*
Get thumb
 */
    public function getThumb()
    {
        return sc_image_get_path_thumb($this->image);
    }

/*
Get image
 */
    public function getImage()
    {
        return sc_image_get_path($this->image);

    }

/**
 * [getUrl description]
 * @return [type] [description]
 */
    public function getUrl()
    {
        return route('cms.content', ['alias' => $this->alias]);
    }

//Scort
    public function scopeSort($query, $column = null)
    {
        $column = $column ?? 'sort';
        return $query->orderBy($column, 'asc')->orderBy('id', 'desc');
    }

        /**
     * Get news detail
     *
     * @param   [string]  $key     [$key description]
     * @param   [string]  $type  [id, alias]
     *
     */
    public function getDetail($key, $type = null, $status = 1)
    {
        if(empty($key)) {
            return null;
        }
        $tableDescription = (new CmsContentDescription)->getTable();

        $news = $this
            ->leftJoin($tableDescription, $tableDescription . '.cms_content_id', $this->getTable() . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());

        if ($type == null) {
            $news = $news->where('id', (int) $key);
        } else {
            $news = $news->where($type, $key);
        }
        if ($status == 1) {
            $news = $news->where('status', 1);
        }
        return $news->first();
    }

/**
     * Get list cms content
     *
     * @param   array  $arrOpt
     * Example: ['status' => 1, 'top' => 1]
     * @param   array  $arrSort
     * Example: ['sortBy' => 'id', 'sortOrder' => 'asc']
     * @param   array  $arrLimit  [$arrLimit description]
     * Example: ['step' => 0, 'limit' => 20]
     * @return  [type]             [return description]
     */
    public function getList($arrOpt = [], $arrSort = [], $arrLimit = [])
    {
        $sortBy = $arrSort['sortBy'] ?? null;
        $sortOrder = $arrSort['sortOrder'] ?? 'asc';
        $step = $arrLimit['step'] ?? 0;
        $limit = $arrLimit['limit'] ?? 0;

        $data = $this->sort($sortBy, $sortOrder);
        if(count($arrOpt = [])) {
            foreach ($arrOpt as $key => $value) {
                $data = $data->where($key, $value);
            }
        }
        if((int)$limit) {
            $start = $step * $limit;
            $data = $data->offset((int)$start)->limit((int)$limit);
        }
        $data = $data->get()->groupBy('id');

        return $data;
    }

    /**
     * Process list full cms content
     *
     * @return  [type]  [return description]
     */
    public static function getListFull()
    {
        if(sc_config('cache_status') && sc_config('cache_content_cms')) {
            if (!Cache::has('cache_content_cms')) {
                Cache::put('cache_content_cms', self::get()->keyBy('id')->toJson(), $seconds = sc_config('cache_time', 0)?:600);
            }
            return Cache::get('cache_content_cms');
        } else {
            return  self::get()->keyBy('id')->toJson();
        }
    }


//=========================

    public function uninstall()
    {
        if (Schema::hasTable($this->table)) {
            Schema::drop($this->table);
        }
    }

    public function install()
    {
        $return = ['error' => 0, 'msg' => 'Install modules success'];
        if (!Schema::hasTable($this->table)) {
            try {
                Schema::create($this->table, function (Blueprint $table) {
                    $table->increments('id');
                    $table->integer('category_id')->default(0);
                    $table->string('image', 100)->nullable();
                    $table->string('alias', 120)->unique();
                    $table->tinyInteger('sort')->default(0);
                    $table->tinyInteger('status')->default(0);
                    $table->timestamp('created_at')->nullable();
                    $table->timestamp('updated_at')->nullable();
                });
            } catch (\Exception $e) {
                $return = ['error' => 1, 'msg' => $e->getMessage()];
            }
        } else {
            $return = ['error' => 1, 'msg' => 'Table ' . $this->table . ' exist!'];
        }
        return $return;
    }


    /**
     * Start new process get data
     *
     * @return  new model
     */
    public function start() {
        return new ShopCmsContent;
    }
    
    /**
     * Set array category 
     *
     * @param   [array|int]  $category 
     *
     */
    private function setCategory($category) {
        if (is_array($category)) {
            $this->sc_category = $category;
        } else {
            $this->sc_category = array((int)$category);
        }
        return $this;
    }

    /**
     * Get content to array Catgory
     * @param   [array|int]  $arrCategory 
     */
    public function getContentToCategory($arrCategory) {
        $this->setStatus(1);
        $this->setCategory($arrCategory);
        return $this;
    }

    /**
     * build Query
     */
    public function buildQuery() {
        $tableDescription = (new CmsContentDescription)->getTable();

        //description
        $query = $this
            ->leftJoin($tableDescription, $tableDescription . '.cms_content_id', $this->getTable() . '.id')
            ->where($tableDescription . '.lang', sc_get_locale());
        //search keyword
        if ($this->sc_keyword !='') {
            $query = $query->where(function ($sql) use($tableDescription){
                $sql->where($tableDescription . '.title', 'like', '%' . $this->sc_keyword . '%')
                ->orWhere($tableDescription . '.keyword', 'like', '%' . $this->sc_keyword . '%')
                ->orWhere($tableDescription . '.description', 'like', '%' . $this->sc_keyword . '%');
            });
        }
        if (count($this->sc_category)) {
            $query = $query->whereIn('category_id', $this->sc_category);
        }

        if ($this->sc_status !== 'all') {
            $query = $query->where('status', $this->sc_status);
        }

        if (count($this->sc_moreWhere)) {
            foreach ($this->sc_moreWhere as $key => $where) {
                if(count($where)) {
                    $query = $query->where($where[0], $where[1], $where[2]);
                }
            }
        }
        if ($this->sc_random) {
            $query = $query->inRandomOrder();
        } else {
            if (is_array($this->sc_sort) && count($this->sc_sort)) {
                foreach ($this->sc_sort as  $rowSort) {
                    if(is_array($rowSort) && count($rowSort) == 2) {
                        $query = $query->sort($rowSort[0], $rowSort[1]);
                    }
                }
            }
        }

        return $query;
    }    

}
