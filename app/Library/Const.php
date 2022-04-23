<?php

//Product kind
define('SC_PRODUCT_SINGLE', 0);
define('SC_PRODUCT_BUILD', 1);
define('SC_PRODUCT_GROUP', 2);
//Product virtual
define('SC_VIRTUAL_PHYSICAL', 0);
define('SC_VIRTUAL_DOWNLOAD', 1);
define('SC_VIRTUAL_ONLY_VIEW', 2);
define('SC_VIRTUAL_SERVICE', 3);
// list ID admin guard
define('SC_GUARD_ADMIN', ['1']); // admin
// list ID language guard
define('SC_GUARD_LANGUAGE', ['1', '2']); // vi, en
// list ID currency guard
define('SC_GUARD_CURRENCY', ['1', '2']); // vndong , usd
// list ID ROLES guard
define('SC_GUARD_ROLES', ['1', '2']); // admin, only view
// list ID Page guard
define('SC_GUARD_PAGES', ['1']); // about

/**
 * Admin define
 */
define('SC_ADMIN_MIDDLEWARE', ['web', 'admin', 'localization']);
define('SC_CONNECTION', 'mysql');
define('SC_CONNECTION_LOG', 'mysql');
//Prefix url admin
define('SC_ADMIN_PREFIX', config('const.ADMIN_PREFIX'));
//Prefix database
define('SC_DB_PREFIX', config('const.DB_PREFIX'));
