<?php
$router->group(['prefix' => 'doi-tac'], function ($router) {
    $router->get('/', 'DuAnController@index')->name('admin_duan.index');
    $router->get('create', 'DuAnController@create')->name('admin_duan.create');
    $router->post('/create', 'DuAnController@postCreate')->name('admin_duan.create');
    $router->get('/edit/{id}', 'DuAnController@edit')->name('admin_duan.edit');
    $router->post('/edit/{id}', 'DuAnController@postEdit')->name('admin_duan.edit');
    $router->post('/delete', 'DuAnController@deleteList')->name('admin_duan.delete');
});
