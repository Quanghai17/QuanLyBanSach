<div class="site-header d-none d-lg-block">
    <div class="header-middle pt--10 pb--10">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3 ">
                    <a href="{{ asset('/') }}" class="site-brand">

                        <img src="{{ asset($templateFile . '/image/logo--footer.png') }}">
                    </a>
                </div>
                <div class="col-lg-3">
                    <div class="header-phone ">
                        <div class="icon">
                            <i class="fas fa-headphones-alt"></i>
                        </div>
                        <div class="text">
                            <p>Hỗ Trợ 24/7</p>
                            <p class="font-weight-bold number">{{ sc_store('long_phone') }}</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="main-navigation flex-lg-right">
                        <ul class="main-menu menu-right ">
                            <li class="menu-item ">
                                <a href="{{ asset('/') }}">Trang Chủ <i></i></a>

                            </li>
                            <!-- Shop -->
                            <li class="menu-item ">
                                <a href="{{ asset('/product') }}">Tất Cả Sách <i></i></a>
                            </li>
                            <!-- Pages -->
                            <!-- Blog -->
                            <li class="menu-item ">
                                <a href="{{ asset('/news') }}">Tin Tức <i></i></a>
                            </li>
                            <li class="menu-item">
                                <a href="contact.html">Liên Hệ</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="header-bottom pb--10">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-3">
                    <nav class="category-nav   ">
                        <div>
                            @php
                                $categories = $modelCategory->start()->getData();
                            @endphp
                            <a href="javascript:void(0)" class="category-trigger"><i
                                    class="fa fa-bars"></i>Danh Mục Sách</a>
                            <ul class="category-menu">
                                @foreach ($categories as $key => $category)
                                <li class="cat-item has-children">
                                    <a href="#">{{ $category->title }}</a>
                                    @php
                                    $products01 = $modelProduct
                                        ->start()
                                        ->getProductToCategory($category->id)
                                        // ->setLimit(4)
                                        ->getData();
                                @endphp 
                                    <ul class="sub-menu">
                                        @foreach ($products01 as $key => $product)
                                        <li><a href="{{ $product->getUrl() }}">{{ $product->name }}</a></li>
                                        @endforeach
                                    </ul>
                                </li>
                                @endforeach
                            </ul>
                        </div>
                    </nav>
                </div>
                <div class="col-lg-5">
                    <div class="header-search-block">
                        <form action="{{ route('search') }}" method="get">
                            <input class="form-control" placeholder="Tìm Kiếm..." type="search" name="keyword"
                                placeholder="{{ trans('front.search_form.keyword') }}..." aria-label="Search">
                            <button class="btn btn-search" type="submit">Tìm Kiếm Sách</button>
                        </form>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="main-navigation flex-lg-right">
                        <div class="cart-widget">
                            <div class="login-block">
                                @guest
                                    <li>
                                        <a href="{{ route('login') }}"><i class="fa fa-user"
                                                aria-hidden="true"></i>{{ trans('front.login') }} / Đăng ký</a>
                                    </li>
                                @else
                                    <li>
                                        <a href="{{ route('member.index') }}">{{ trans('front.account') }}</a>
                                    </li>
                                    <li>
                                        <a href="{{ route('logout') }}"
                                            onclick="event.preventDefault(); document.getElementById('logout-form').submit();">{{ trans('front.logout') }}</a>
                                        <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                            style="display: none;">@csrf</form>
                                    </li>
                                @endguest
                            </div>
                            <div class="cart-block">
                                
                                <div class="cart-total">
                                    <span class="text-number">
                                        {{ Cart::instance('default')->count() }}
                                    </span>
                                    <span class="text-item">
                                        Giỏ Hàng
                                    </span>
                                    <span class="price">
                                        £0.00
                                        <i class="fas fa-chevron-down"></i>
                                    </span>
                                </div>
                                <div class="cart-dropdown-block">
                                    <div class=" single-cart-block ">

                                    </div>
                                    <div class=" single-cart-block ">
                                        <div class="btn-block">
                                            <a href="cart.html" class="btn">Xem Giỏ Hàng <i
                                                    class="fas fa-chevron-right"></i></a>
                                            <a href="{{ route('checkout') }}" class="btn btn--primary">Kiểm Tra <i
                                                    class="fas fa-chevron-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
