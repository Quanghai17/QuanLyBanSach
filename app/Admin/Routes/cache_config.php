<?php
$router->group(['prefix' => 'cache_config'], function ($router) {
    $router->get('/', 'AdminCacheConfigController@index')->name('admin_cache_config.index');
    $router->get('create', 'AdminCacheConfigController@create')->name('admin_cache_config.create');
    $router->post('/create', 'AdminCacheConfigController@postCreate')->name('admin_cache_config.create');
    $router->post('/ ', 'AdminCacheConfigController@deleteList')->name('admin_cache_config.delete');
    $router->post('/update_info', 'AdminCacheConfigController@updateInfo')->name('admin_cache_config.update');
    $router->post('/clear_cache', 'AdminCacheConfigController@clearCache')->name('admin_cache_config.clear_cache');
});
