<?php

namespace App\Admin\Controllers;

use App\Http\Controllers\Controller;
use App\Models\ShopNews;
use App\Models\ShopOrder;
use App\Models\ShopProduct;
use App\Models\ShopCountry;
use App\Models\ShopUser;
use DB;
use Illuminate\Http\Request;

class HomeController extends Controller
{

    public function index(Request $request)
    {
        $data = [];
        $data['title'] = trans('admin.dashboard');
        $data['users'] = new ShopUser;
        $data['orders'] = new ShopOrder;
        $data['mapStyleStatus'] = ShopOrder::$mapStyleStatus;
        $data['products'] = new ShopProduct;
        $data['blogs'] = new ShopNews;

        //Country statistics
        $dataCountries = (new ShopOrder)->getCountryInYear();
        $arrCountry = ShopCountry::getArray();
        $arrCountryMap   = [];
        $ctTotal = 0;
        $ctTop = 0;
        foreach ($dataCountries as $key => $country) {
            $ctTotal +=$country->count;
            if($key <= 3) {
                $ctTop +=$country->count;
                if($key == 0) {
                    $arrCountryMap[] =  [
                        'name' => $country->province,
                        'y' => $country->count,
                        'sliced' => true,
                        'selected' => true,
                    ];
                } else {
                    $arrCountryMap[] =  [$country->province, $country->count];
                }
            }
        }
        $arrCountryMap[] = ['Other', ($ctTotal - $ctTop)];
        $data['dataPie'] = json_encode($arrCountryMap);
        //End country statistics


        //Order in 30 days
        $totalsInMonth = (new ShopOrder)->getSumOrderTotalInMonth()->keyBy('md')->toArray();
        $rangDays = new \DatePeriod(
            new \DateTime('-1 month'),
            new \DateInterval('P1D'),
            new \DateTime('+1 day')
        );
        $orderInMonth  = [];
        $amountInMonth  = [];
        foreach ($rangDays as $i => $day) {
            $date = $day->format('m-d');
            $orderInMonth[$date] = $totalsInMonth[$date]['total_order'] ?? '';
            $amountInMonth[$date] = ($totalsInMonth[$date]['total_amount'] ?? 0);
        }
        $data['orderInMonth'] = $orderInMonth;
        $data['amountInMonth'] = $amountInMonth;

        //End order in 30 days
        
        //Order in 12 months
        $totalsMonth = (new ShopOrder)->getSumOrderTotalInYear()
            ->pluck('total_amount', 'ym')->toArray();
        $dataInYear = [];
        for ($i = 12; $i >= 0; $i--) {
            $date = date("Y-m", strtotime(date('Y-m-01') . " -$i months"));
            $dataInYear[$date] = $totalsMonth[$date] ?? 0;
        }
        $data['dataInYear'] = $dataInYear;
        //End order in 12 months

        return view('admin.home', $data);
    }

    public function deny()
    {
        $data = [
            'title' => trans('admin.deny'),
            'icon' => '',
            'method' => session('method'),
            'url' => session('url'),
        ];
        return view('admin.deny', $data);
    }
}
