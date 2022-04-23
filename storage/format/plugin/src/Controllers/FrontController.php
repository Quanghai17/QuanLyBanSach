<?php
#App\Plugins\Plugin_Code\Plugin_Key\Controllers\FrontController.php
namespace App\Plugins\Plugin_Code\Plugin_Key\Controllers;

use App\Plugins\Plugin_Code\Plugin_Key\AppConfig;
use App\Http\Controllers\GeneralController;
class FrontController extends GeneralController
{
    public $plugin;

    public function __construct()
    {
        parent::__construct();
        $this->plugin = new AppConfig;
    }

    public function index() {
        return view($this->plugin->pathPlugin.'::Front',
            [
                //
            ]
        );
    }
}
