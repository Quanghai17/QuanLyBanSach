<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Http\Request;
class CreateTablesShop extends Migration
{

    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //Drop table if exist
        if(!empty(session('infoInstall')['dropdb'])) {
            $this->down();
        }

        Schema::create(SC_DB_PREFIX.'shop_banner', function (Blueprint $table) {
            $table->increments('id');
            $table->string('image', 255)->nullable();
            $table->string('url', 100)->nullable();
            $table->string('target', 50)->nullable();
            $table->text('html')->nullable();
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('sort')->default(0);
            $table->integer('click')->default(0);
            $table->tinyInteger('type')->default(0);
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'shop_email_template', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 50);
            $table->string('group', 50);
            $table->text('text');
            $table->tinyInteger('status')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_language', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('code', 50)->unique();
            $table->string('icon', 100)->nullable();
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('rtl')->nullable()->default(0)->comment('Layout RTL');
            $table->tinyInteger('sort')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_block_content', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('position', 100);
            $table->string('page', 200)->nullable();
            $table->string('type', 200);
            $table->text('text')->nullable();
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('sort')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_layout_page', function (Blueprint $table) {
            $table->increments('id');
            $table->string('key', 100)->unique();
            $table->string('name', 100);
        });

        Schema::create(SC_DB_PREFIX.'shop_layout_position', function (Blueprint $table) {
            $table->increments('id');
            $table->string('key', 100)->unique();
            $table->string('name', 100);
        });

        Schema::create(SC_DB_PREFIX.'shop_link', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('url', 100);
            $table->string('target', 100);
            $table->string('group', 100);
            $table->string('module', 100)->nullable();
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('sort')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_password_resets', function (Blueprint $table) {
            $table->string('email', 150);
            $table->string('token', 255);
            $table->dateTime('created_at');
            $table->index('email');
        });

        Schema::create(SC_DB_PREFIX.'shop_shipping_standard', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('fee');
            $table->integer('shipping_free');
        });

        Schema::create(SC_DB_PREFIX.'shop_brand', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('alias', 120)->unique();
            $table->string('image', 255)->nullable();
            $table->string('url', 100)->nullable();
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('sort')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_category', function (Blueprint $table) {
            $table->increments('id');
            $table->string('image', 255)->nullable();
            $table->string('alias', 120)->unique();
            $table->integer('parent')->default(0);
            $table->integer('top')->nullable()->default(0);
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('sort')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_category_description', function (Blueprint $table) {
            $table->integer('category_id');
            $table->string('lang', 10)->index();
            $table->string('title', 200)->nullable();
            $table->string('keyword', 200)->nullable();
            $table->string('description', 300)->nullable();
            $table->primary(['category_id', 'lang']);
        });

        Schema::create(SC_DB_PREFIX.'shop_currency', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('code', 10)->unique();
            $table->string('symbol', 10);
            $table->float('exchange_rate');
            $table->tinyInteger('precision')->default(2);
            $table->tinyInteger('symbol_first')->default(0);
            $table->string('thousands')->default(',');
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('sort')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_order', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id');
            $table->integer('subtotal')->nullable()->default(0);
            $table->integer('shipping')->nullable()->default(0);
            $table->integer('discount')->nullable()->default(0);
            $table->integer('payment_status')->default(1);
            $table->integer('shipping_status')->default(1);
            $table->integer('status')->default(0);
            $table->integer('tax')->nullable()->default(0);
            $table->integer('total')->nullable()->default(0);
            $table->string('currency', 10);
            $table->float('exchange_rate')->nullable();
            $table->integer('received')->nullable()->default(0);
            $table->integer('balance')->nullable()->default(0);
            $table->string('first_name', 100);
            $table->string('last_name', 100);
            $table->string('address1', 100);
            $table->string('address2', 100);
            $table->string('country', 10)->default('VN');
            $table->string('company', 100)->nullable();
            $table->string('postcode', 10)->nullable();
            $table->string('phone', 20);
            $table->string('email', 150);
            $table->string('comment', 300)->nullable();
            $table->string('payment_method', 100)->nullable();
            $table->string('shipping_method', 100)->nullable();
            $table->string('user_agent', 255)->nullable();
            $table->string('ip', 100)->nullable();
            $table->string('transaction', 100)->nullable();
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'shop_order_detail', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('order_id');
            $table->integer('product_id');
            $table->string('name', 100);
            $table->integer('price')->default(0);
            $table->integer('qty')->default(0);
            $table->integer('total_price')->default(0);
            $table->integer('tax')->default(0);
            $table->string('sku', 50);
            $table->string('currency', 10);
            $table->float('exchange_rate')->nullable();
            $table->string('attribute', 100)->nullable();
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'shop_order_history', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('order_id');
            $table->string('content', 300);
            $table->integer('admin_id')->default(0);
            $table->integer('user_id')->default(0);
            $table->integer('order_status_id')->default(0);
            $table->dateTime('add_date');
        });

        Schema::create(SC_DB_PREFIX.'shop_order_status', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);

        });

        Schema::create(SC_DB_PREFIX.'shop_order_total', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('order_id');
            $table->string('title', 100);
            $table->string('code', 100);
            $table->integer('value')->default(0);
            $table->string('text', 200)->nullable();
            $table->integer('sort')->default(1);
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'shop_page', function (Blueprint $table) {
            $table->increments('id');
            $table->string('image', 255)->nullable();
            $table->string('alias', 120)->unique();
            $table->integer('status')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_page_description', function (Blueprint $table) {
            $table->integer('page_id');
            $table->string('lang', 10)->index();
            $table->string('title', 200)->nullable();
            $table->string('keyword', 200)->nullable();
            $table->string('description', 300)->nullable();
            $table->text('content')->nullable();
            $table->primary(['page_id', 'lang']);
        });

        Schema::create(SC_DB_PREFIX.'shop_payment_status', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);

        });

        Schema::create(SC_DB_PREFIX.'shop_product', function (Blueprint $table) {
            $table->increments('id');
            $table->string('sku', 50)->unique();
            $table->string('upc', 20)->nullable()->comment('upc code');
            $table->string('ean', 20)->nullable()->comment('ean code');
            $table->string('jan', 20)->nullable()->comment('jan code');
            $table->string('isbn', 20)->nullable()->comment('isbn code');
            $table->string('mpn', 64)->nullable()->comment('mpn code');
            $table->string('image', 255)->nullable();
            $table->integer('brand_id')->nullable()->default(0)->index();
            $table->string('supplier_id', 50)->nullable()->index();
            $table->integer('price')->nullable()->default(0);
            $table->integer('cost')->nullable()->nullable()->default(0);
            $table->integer('stock')->nullable()->default(0);
            $table->integer('sold')->nullable()->default(0);
            $table->integer('minimum')->nullable()->default(0);
            $table->string('weight_class')->nullable();
            $table->integer('weight')->nullable()->default(0);
            $table->string('length_class')->nullable();
            $table->integer('length')->nullable()->default(0);
            $table->integer('width')->nullable()->default(0);
            $table->integer('height')->nullable()->default(0);
            $table->tinyInteger('kind')->nullable()->default(0)->comment('0:single, 1:bundle, 2:group')->index();
            $table->tinyInteger('virtual')->nullable()->default(0)->comment('0:physical, 1:download, 2:only view, 3: Service')->index();
            $table->string('tax_id', 50)->nullable()->default(0)->comment('0:No-tax, auto: Use tax default')->index();
            $table->tinyInteger('status')->default(0)->index();
            $table->tinyInteger('sort')->default(0);
            $table->integer('view')->default(0);
            $table->string('alias', 120)->unique();
            $table->dateTime('date_lastview')->nullable();
            $table->date('date_available')->nullable();
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'shop_product_description', function (Blueprint $table) {
            $table->integer('product_id');
            $table->string('lang', 10)->index();
            $table->string('name', 200)->nullable();
            $table->string('keyword', 200)->nullable();
            $table->string('description', 300)->nullable();
            $table->text('content')->nullable();
            $table->primary(['product_id', 'lang']);
        });

        Schema::create(SC_DB_PREFIX.'shop_product_image', function (Blueprint $table) {
            $table->increments('id');
            $table->string('image', 255);
            $table->integer('product_id')->default(0)->index();
        });

        Schema::create(SC_DB_PREFIX.'shop_product_build', function (Blueprint $table) {
            $table->integer('build_id');
            $table->integer('product_id');
            $table->integer('quantity');
            $table->primary(['build_id', 'product_id']);
        });

        Schema::create(SC_DB_PREFIX.'shop_product_group', function (Blueprint $table) {
            $table->integer('group_id');
            $table->integer('product_id');
            $table->primary(['group_id', 'product_id']);
        });

        Schema::create(SC_DB_PREFIX.'shop_product_category', function (Blueprint $table) {
            $table->integer('product_id');
            $table->integer('category_id');
            $table->primary(['product_id', 'category_id']);
        });

        Schema::create(SC_DB_PREFIX.'shop_attribute_group', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->tinyInteger('status')->default(0);
            $table->tinyInteger('sort')->default(0);
            $table->string('type', 50)->comment('radio,select,checkbox');
        });

        Schema::create(SC_DB_PREFIX.'shop_product_attribute', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->integer('attribute_group_id');
            $table->integer('product_id');
            $table->integer('add_price')->default(0);
            $table->tinyInteger('sort')->default(0);
            $table->tinyInteger('status')->default(1);
            $table->index(['product_id', 'attribute_group_id']);
        });


        Schema::create(SC_DB_PREFIX.'shop_shipping_status', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);

        });

        Schema::create(SC_DB_PREFIX.'shop_shoppingcart', function (Blueprint $table) {
            $table->string('identifier', 100);
            $table->string('instance', 100);
            $table->text('content');
            $table->timestamps();
            $table->index(['identifier', 'instance']);
        });

        Schema::create(SC_DB_PREFIX.'shop_product_promotion', function (Blueprint $table) {
            $table->integer('product_id')->primary();
            $table->integer('price_promotion');
            $table->dateTime('date_start')->nullable();
            $table->dateTime('date_end')->nullable();
            $table->integer('status_promotion')->default(1);
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'shop_user', function (Blueprint $table) {
            $table->increments('id');
            $table->string('first_name', 100);
            $table->string('last_name', 100)->nullable();
            $table->string('email', 150)->unique();
            $table->tinyInteger('sex')->default(0)->comment('0:women, 1:men');
            $table->date('birthday')->nullable();
            $table->string('password', 100);
            $table->integer('address_id')->default(0)->index();
            $table->string('postcode', 10)->nullable();
            $table->string('address1', 100)->nullable();
            $table->string('address2', 100)->nullable();
            $table->string('company', 100)->nullable();
            $table->string('country', 10)->default('VN');
            $table->string('phone', 20);
            $table->string('remember_token', 100)->nullable();
            $table->tinyInteger('status')->default(1);
            $table->tinyInteger('group')->default(1);
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'shop_user_address', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id');
            $table->string('first_name', 100);
            $table->string('last_name', 100)->nullable();
            $table->string('postcode', 10)->nullable();
            $table->string('address1', 100)->nullable();
            $table->string('address2', 100)->nullable();
            $table->string('country', 10)->default('VN');
            $table->string('phone', 20);
        });


        Schema::create(SC_DB_PREFIX.'shop_supplier', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->string('alias', 120)->unique();
            $table->string('email', 150)->nullable();
            $table->string('phone', 20)->nullable();
            $table->string('image', 255)->nullable();
            $table->string('address', 100)->nullable();
            $table->string('url', 100)->nullable();
            $table->tinyInteger('status')->default(1);
            $table->tinyInteger('sort')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_subscribe', function (Blueprint $table) {
            $table->increments('id');
            $table->string('email', 150)->unique();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });

        Schema::create(SC_DB_PREFIX.'shop_country', function (Blueprint $table) {
            $table->increments('id');
            $table->string('code', 10)->unique();
            $table->string('name', 100);
        });
        
        Schema::create(SC_DB_PREFIX.'shop_news', function (Blueprint $table) {
            $table->increments('id');
            $table->string('image', 200)->nullable();
            $table->string('alias', 120)->unique();
            $table->tinyInteger('sort')->default(0);
            $table->tinyInteger('status')->default(0);
            $table->timestamp('created_at')->nullable();
            $table->timestamp('updated_at')->nullable();
        });

        Schema::create(SC_DB_PREFIX.'shop_news_description', function (Blueprint $table) {
            $table->integer('shop_news_id');
            $table->string('lang', 10);
            $table->string('title', 200)->nullable();
            $table->string('keyword', 200)->nullable();
            $table->string('description', 300)->nullable();
            $table->text('content')->nullable();
            $table->primary(['shop_news_id', 'lang']);
        });

        Schema::create(SC_DB_PREFIX.'shop_sessions', function ($table) {
            $table->string('id',100)->unique();
            $table->unsignedInteger('user_id')->nullable();
            $table->string('ip_address', 45)->nullable();
            $table->text('user_agent')->nullable();
            $table->text('payload');
            $table->integer('last_activity');
        });

        //Passport
        Schema::create('oauth_auth_codes', function (Blueprint $table) {
            $table->string('id', 100)->primary();
            $table->unsignedBigInteger('user_id')->index();
            $table->unsignedBigInteger('client_id');
            $table->text('scopes')->nullable();
            $table->boolean('revoked');
            $table->dateTime('expires_at')->nullable();
        });

        Schema::create('oauth_access_tokens', function (Blueprint $table) {
            $table->string('id', 100)->primary();
            $table->unsignedBigInteger('user_id')->nullable()->index();
            $table->unsignedBigInteger('client_id');
            $table->string('name')->nullable();
            $table->text('scopes')->nullable();
            $table->boolean('revoked');
            $table->timestamps();
            $table->dateTime('expires_at')->nullable();
        });

        Schema::create('oauth_refresh_tokens', function (Blueprint $table) {
            $table->string('id', 100)->primary();
            $table->string('access_token_id', 100);
            $table->boolean('revoked');
            $table->dateTime('expires_at')->nullable();
        });

        Schema::create('oauth_clients', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('user_id')->nullable()->index();
            $table->string('name');
            $table->string('secret', 100)->nullable();
            $table->text('redirect');
            $table->boolean('personal_access_client');
            $table->boolean('password_client');
            $table->boolean('revoked');
            $table->timestamps();
        });
        
        Schema::create('oauth_personal_access_clients', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('client_id');
            $table->timestamps();
        });


        Schema::create(SC_DB_PREFIX.'api_connection', function (Blueprint $table) {
            $table->increments('id');
            $table->string('description', 255);
            $table->string('apiconnection', 50)->unique();
            $table->string('apikey', 128);
            $table->date('expire')->nullable();
            $table->datetime('last_active')->nullable();
            $table->tinyInteger('status')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_tax', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 100);
            $table->integer('value')->default(0);
        });

        Schema::create(SC_DB_PREFIX.'shop_weight', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 50)->unique();
            $table->string('description', 100);

        });

        Schema::create(SC_DB_PREFIX.'shop_length', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 50)->unique();
            $table->string('description', 100);

        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists(SC_DB_PREFIX.'shop_banner');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_email_template');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_language');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_block_content');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_layout_page');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_layout_position');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_link');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_password_resets');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_shipping_standard');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_api');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_api_process');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_brand');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_category');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_category_description');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_currency');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_order');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_order_detail');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_order_history');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_order_status');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_order_total');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_page');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_page_description');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_payment_status');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_product');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_product_description');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_product_image');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_product_build');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_product_attribute');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_attribute_group');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_product_group');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_product_category');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_shipping_status');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_shoppingcart');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_product_promotion');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_user');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_supplier');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_user_address');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_subscribe');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_country');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_news');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_news_description');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_sessions');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_tax');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_weight');
        Schema::dropIfExists(SC_DB_PREFIX.'shop_length');
        //Passport
        Schema::dropIfExists('oauth_auth_codes');
        Schema::dropIfExists('oauth_access_tokens');
        Schema::dropIfExists('oauth_refresh_tokens');
        Schema::dropIfExists('oauth_clients');
        Schema::dropIfExists('oauth_personal_access_clients');
        //Api connection
        Schema::dropIfExists(SC_DB_PREFIX.'api_connection');
    }

}
