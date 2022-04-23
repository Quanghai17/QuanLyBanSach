<?php
#app/Plugins/Cms/Content/Models/CmsContentDescription.php
namespace App\Plugins\Cms\Content\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CmsContentDescription extends Model
{
    protected $primaryKey = ['lang', 'cms_content_id'];
    public $incrementing  = false;
    protected $guarded    = [];
    public $timestamps    = false;
    public $table = SC_DB_PREFIX.'cms_content_description';
    protected $connection = SC_CONNECTION;


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
                    $table->integer('cms_content_id');
                    $table->string('lang', 10);
                    $table->string('title', 200)->nullable();
                    $table->string('keyword', 200)->nullable();
                    $table->string('description', 300)->nullable();
                    $table->text('content')->nullable();
                    $table->primary(['cms_content_id', 'lang']);
                });
            } catch (\Exception $e) {
                $return = ['error' => 1, 'msg' => $e->getMessage()];
            }
        } else {
            $return = ['error' => 1, 'msg' => 'Table ' . $this->table . ' exist!'];
        }
        return $return;
    }

}
