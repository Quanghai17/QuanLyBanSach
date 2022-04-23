<?php
#app/Plugins/Cms/Content/AppConfig.php
namespace App\Plugins\Cms\Content;

use App\Admin\Models\AdminMenu;
use App\Models\AdminConfig;
use App\Plugins\Cms\Content\Models\CmsCategory;
use App\Plugins\Cms\Content\Models\CmsCategoryDescription;
use App\Plugins\Cms\Content\Models\CmsContent;
use App\Plugins\Cms\Content\Models\CmsContentDescription;
use App\Plugins\Cms\Content\Models\CmsImage;
use App\Plugins\ConfigDefault;
class AppConfig extends ConfigDefault
{
    public function __construct()
    {
        $config = file_get_contents(__DIR__.'/config.json');
    	$config = json_decode($config, true);
    	$this->configGroup = $config['configGroup'];
    	$this->configCode = $config['configCode'];
    	$this->configKey = $config['configKey'];
        $this->pathPlugin = $this->configGroup . '/' . $this->configCode . '/' . $this->configKey;
        $this->title = trans($this->pathPlugin.'::'. $this->configKey . '.title_module');
        $this->image = $this->pathPlugin.'/'.$config['image'];
        $this->version = $config['version'];
        $this->auth = $config['auth'];
        $this->link = $config['link'];
    }


    public function install()
    {
        $return = ['error' => 0, 'msg' => ''];
        $check = AdminConfig::where('key', $this->configKey)->first();
        if ($check) {
            $return = ['error' => 1, 'msg' => 'Module exist'];
        } else {
            $process = AdminConfig::insert(
                [
                    'code' => $this->configCode,
                    'key' => $this->configKey,
                    'group' => $this->configGroup,
                    'value' => self::ON, //1- Enable extension; 0 - Disable
                    'detail' => $this->pathPlugin.'::'. $this->configKey . '.title',
                ]
            );
            if (!$process) {
                $return = ['error' => 1, 'msg' => 'Error when install'];
            } else {
                
                $checkMenu = AdminMenu::where('key',$this->configKey)->first();
                
                if ($checkMenu) { 
                    $position = $checkMenu->id;
                } else {
                    $position = AdminMenu::insertGetId([
                        'sort' => 102,
                        'parent_id' => 7,
                        'title' => $this->pathPlugin.'::'.$this->configKey . '.cms_manager',
                        'icon' => 'fa-coffee',
                        'key' => $this->configKey,
                    ]);
                }
                (new CmsCategory)->install();
                (new CmsCategoryDescription)->install();
                (new CmsContent)->install();
                (new CmsContentDescription)->install();
                (new CmsImage)->install();
                AdminMenu::insert(
                    [
                        'parent_id' => $position,
                        'title' => $this->pathPlugin.'::'.$this->configKey . '.cms_category',
                        'icon' => 'fa-folder-open-o',
                        'uri' => 'route::admin_cms_category.index',
                    ]);
                AdminMenu::insert(
                    [
                        'parent_id' => $position,
                        'title' => $this->pathPlugin.'::'.$this->configKey . '.cms_content',
                        'icon' => 'fa-copy',
                        'uri' => 'route::admin_cms_content.index',
                    ]
                );
            }
        }
        return $return;
    }

    public function uninstall()
    {
        $return = ['error' => 0, 'msg' => ''];
        $process = (new AdminConfig)->where('key', $this->configKey)->delete();
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error when uninstall'];
        }
        (new CmsCategory)->uninstall();
        (new CmsCategoryDescription)->uninstall();
        (new CmsContent)->uninstall();
        (new CmsContentDescription)->uninstall();
        (new CmsImage)->uninstall();

        //Remove menu
        (new AdminMenu)->where('uri', 'route::admin_cms_category.index')->delete();
        (new AdminMenu)->where('uri', 'route::admin_cms_content.index')->delete();
        $checkMenu = (new AdminMenu)->where('key', $this->configKey)->first();
        if($checkMenu) {
            if (!(new AdminMenu)->where('parent_id', $checkMenu->id)->count()) {
                (new AdminMenu)->where('key', $this->configKey)->delete();
            }
        }


        return $return;
    }

    public function enable()
    {
        $return = ['error' => 0, 'msg' => ''];
        $process = (new AdminConfig)->where('key', $this->configKey)->update(['value' => self::ON]);
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error enable'];
        }
        return $return;
    }

    public function disable()
    {
        $return = ['error' => 0, 'msg' => ''];
        $process = (new AdminConfig)->where('key', $this->configKey)->update(['value' => self::OFF]);
        if (!$process) {
            $return = ['error' => 1, 'msg' => 'Error disable'];
        }
        return $return;
    }

    public function getData()
    {
        $arrData = [
            'title' => $this->title,
            'code' => $this->configCode,
            'key' => $this->configKey,
            'version' => $this->version,
            'auth' => $this->auth,
            'link' => $this->link,
            'pathPlugin' => $this->pathPlugin,
        ];
        return $arrData;
    }

}
