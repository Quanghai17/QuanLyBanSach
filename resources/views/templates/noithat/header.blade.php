<header class="site-header header-opt-1">
    <!-- header-top -->
    <div class="header-top">
        <div class="container">
            <!-- hotline -->
            <ul class="nav-top-left">
                <li><a href="{{ route('home') }}">{{ sc_store('title') }}</a></li>
            </ul><!-- hotline -->
            <!-- heder links -->
            <ul class="nav-top-right volazj-nav">
                @guest
                    <li>
                        <a href="{{ route('login') }}"><i class="fa fa-user" aria-hidden="true"></i>{{ trans('front.login') }} / Đăng ký</a>
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
            </ul>
            <!-- heder links -->
        </div>
    </div> <!-- header-top -->
    <!-- header-content -->
    <div class="header-content">
        <div class="container">
            <div class="row">
                <div class="col-md-3 nav-left">
                    <!-- logo -->
                    <div class="logo">
                        <a href="{{ route('home') }}">
                            <img src="{{ asset(sc_store('logo')) }}" alt="logo">
                        </a>
                    </div><!-- logo -->
                </div>
                <div class="col-md-8 nav-mind">
                    <!-- block search -->
                    <div class="block-search">
                        <div class="block-content">

                            <div class="form-search">
                                <form action="{{ route('search') }}" method="get">
                                    <div class="box-group">
                                        <input  class="form-control" placeholder="Tìm Kiếm..." type="search" name="keyword"
                                               placeholder="{{ trans('front.search_form.keyword') }}..." aria-label="Search">
                                        <button class="btn btn-search" type="submit"><span class="fa fa-search"></span></button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div><!-- block search -->
                </div>
                <div class="col-md-1 nav-right">
                    <!-- block mini cart -->
                    <span data-action="toggle-nav" class="menu-on-mobile hidden-md style2">
                                <span class="btn-open-mobile home-page">
                                    <span></span>
                                    <span></span>
                                    <span></span>
                                </span>
                                <span class="title-menu-mobile">Main menu</span>
                            </span>
                    <div class="logo-mobile">
                      <a href="{{ route('home') }}">
                        <img src="{{ asset(sc_store('logo')) }}" alt="logo">
                      </a>
                    </div>
                    <div class="block-minicart dropdown style2">
                        <a class="minicart" href="{{ route('cart') }}">

                                    <span class="counter qty">

                                        <span class="cart-icon"><i class="fa fa-shopping-cart" aria-hidden="true"></i></span>

                                        <span class="counter-number">{{ Cart::instance('default')->count() }}</span>

                                    </span>
                            <span class="counter-your-cart">
                                    </span>
                        </a>

                    </div><!-- block mini cart -->
                    <a href="#" class="hidden-md search-hidden"><span class="flaticon-magnifying-glass"></span></a>
                </div>
            </div>
        </div>
    </div><!-- header-content -->
    <!-- header-menu-bar -->
    <div id="sticky-wrapper" class="sticky-wrapper is-sticky" style="height: 61px;"><div class="header-menu-bar header-sticky">
            <div class="header-menu-nav menu-style-1">
                <div class="container">
                    <div class="header-menu-nav-inner ">
                        <div class="header-menu header-menu-resize">
                            <ul class="header-nav volazj-nav">
                                <li class="btn-close hidden-md"><i class="flaticon-close" aria-hidden="true"></i></li>

                                <li class="nav-item">
                                  <a class="nav-link" href="{{ asset('/') }}">Trang chủ</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link" href="{{ asset('/about.html') }}">Giới thiệu</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link" href="{{ asset('/product') }}">Sản phẩm</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link" href="{{ asset('/news') }}">Tin tức</a>
                                </li>
                                <li class="nav-item">
                                  <a class="nav-link" href="{{ asset('/contact.html') }}">Liên hệ</a>
                                </li>

                                <!-- @if (!empty($layoutsUrl['menu']))
                                    @foreach ($layoutsUrl['menu'] as $url)
                                        <li class="nav-item">
                                            <a class="nav-link" {{ ($url->target =='_blank')?'target=_blank':''  }}
                                            href="{{ sc_url_render($url->url) }}">{{ sc_language_render($url->name) }}</a>
                                        </li>
                                    @endforeach
                                @endif -->
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div></div>
</header><!-- end HEADER -->
