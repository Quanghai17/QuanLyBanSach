@extends($templatePath.'.layout')

@section('center')
    <section class="breadcrumb-section">
        <h2 class="sr-only">Site Breadcrumb</h2>
        <div class="container">
            <div class="breadcrumb-contents">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Trang Chủ</a></li>
                        <li class="breadcrumb-item active">Tất Cả Sách</li>
                    </ol>
                </nav>
            </div>
        </div>
    </section>
    <main class="inner-page-sec-padding-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-9">
                    <div class="shop-toolbar with-sidebar mb--30">
                        <div class="row align-items-center">
                            <div class="col-lg-2 col-md-2 col-sm-6">
                                <!-- Product View Mode -->
                                <div class="product-view-mode">
                                    <a href="#" class="sorting-btn" data-target="grid"><i class="fas fa-th"></i></a>
                                    <a href="#" class="sorting-btn" data-target="grid-four">
                                        <span class="grid-four-icon">
                                            <i class="fas fa-grip-vertical"></i><i class="fas fa-grip-vertical"></i>
                                        </span>
                                    </a>
                                    <a href="#" class="sorting-btn  active" data-target="list"><i
                                            class="fas fa-list"></i></a>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-4 col-sm-6  mt--10 mt-sm--0">
                                <span class="toolbar-status">
                                    Trang 1 to 9 of 14 (2 Pages)
                                </span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6  mt--10 mt-md--0">
                                <div class="sorting-selection">
                                    <span>Show:</span>
                                    <select class="form-control nice-select sort-select">
                                        <option value="" selected="selected">3</option>
                                        <option value="">9</option>
                                        <option value="">5</option>
                                        <option value="">10</option>
                                        <option value="">12</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-4 col-md-4 col-sm-6 mt--10 mt-md--0 ">
                                <div class="sorting-selection">
                                    <form action="" method="GET" id="filter_sort">
                                    <div style="border: cornsilk" class="select"> 
                                        @php
                                            $queries = request()->except(['filter_sort', 'page']);
                                        @endphp
                                        @foreach ($queries as $key => $query)
                                            <input type="hidden" name="{{ $key }}" value="{{ $query }}">
                                        @endforeach
                                        <select class="form-control" class="filter-bar" class="custom-select" name="filter_sort">
                                            <option value="">{{ trans('front.filters.sort') }}</option>
                                            <option value="price_asc" {{ $filter_sort == 'price_asc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.price_asc') }}</option>
                                            <option value="price_desc" {{ $filter_sort == 'price_desc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.price_desc') }}</option>
                                            <option value="sort_asc" {{ $filter_sort == 'sort_asc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.sort_asc') }}</option>
                                            <option value="sort_desc" {{ $filter_sort == 'sort_desc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.sort_desc') }}</option>
                                            <option value="id_asc" {{ $filter_sort == 'id_asc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.id_asc') }}</option>
                                            <option value="id_desc" {{ $filter_sort == 'id_desc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.id_desc') }}</option>
                                        </select>
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shop-toolbar d-none">
                        <div class="row align-items-center">
                            <div class="col-lg-2 col-md-2 col-sm-6">
                                <!-- Product View Mode -->
                                <div class="product-view-mode">
                                    <a href="#" class="sorting-btn active" data-target="grid"><i
                                            class="fas fa-th"></i></a>
                                    <a href="#" class="sorting-btn" data-target="grid-four">
                                        <span class="grid-four-icon">
                                            <i class="fas fa-grip-vertical"></i><i class="fas fa-grip-vertical"></i>
                                        </span>
                                    </a>
                                    <a href="#" class="sorting-btn" data-target="list "><i
                                            class="fas fa-list"></i></a>
                                </div>
                            </div>
                            <div class="col-xl-5 col-md-4 col-sm-6  mt--10 mt-sm--0">
                                <span class="toolbar-status">
                                    Trang 1 to 9 of 14 (2 Pages)
                                </span>
                            </div>
                            <div class="col-lg-2 col-md-2 col-sm-6  mt--10 mt-md--0">
                                <div class="sorting-selection">
                                    <span>Show:</span>
                                    <select class="form-control nice-select sort-select">
                                        <option value="" selected="selected">3</option>
                                        <option value="">9</option>
                                        <option value="">5</option>
                                        <option value="">10</option>
                                        <option value="">12</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-xl-3 col-lg-4 col-md-4 col-sm-6 mt--10 mt-md--0 ">
                                <div class="sorting-selection">
                                    <div class="select"> 
                                        @php
                                            $queries = request()->except(['filter_sort', 'page']);
                                        @endphp
                                        @foreach ($queries as $key => $query)
                                            <input type="hidden" name="{{ $key }}" value="{{ $query }}">
                                        @endforeach
                                        <select class="form-control" class="filter-bar" class="custom-select" name="filter_sort">
                                            <option value="">{{ trans('front.filters.sort') }}</option>
                                            <option value="price_asc" {{ $filter_sort == 'price_asc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.price_asc') }}</option>
                                            <option value="price_desc" {{ $filter_sort == 'price_desc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.price_desc') }}</option>
                                            <option value="sort_asc" {{ $filter_sort == 'sort_asc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.sort_asc') }}</option>
                                            <option value="sort_desc" {{ $filter_sort == 'sort_desc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.sort_desc') }}</option>
                                            <option value="id_asc" {{ $filter_sort == 'id_asc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.id_asc') }}</option>
                                            <option value="id_desc" {{ $filter_sort == 'id_desc' ? 'selected' : '' }}>
                                                {{ trans('front.filters.id_desc') }}</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="shop-product-wrap list with-pagination row space-db--30 shop-border">
                        @foreach ($products as $key => $product)
                            <div class="col-lg-4 col-sm-6">
                                <div class="product-card card-style-list">

                                    <div class="product-list-content">
                                        <div class="card-asset/image">
                                            <img href="{{ $product->getUrl() }}"
                                                src="{{ asset($product->getThumb()) }}">
                                        </div>

                                        <div class="product-card--body">
                                            <div class="product-header">
                                                <a href="#" class="author">
                                                    Tác Giả: Nguyễn Quang Hải
                                                </a>
                                                <h3><a href="{{ $product->getUrl() }}"
                                                        tabindex="0">{{ $product->name }}</a></h3>
                                            </div>
                                            <article>
                                                <h2 class="sr-only">Danh Sách Bài Viết</h2>
                                                <p>{{ $product->description }}</p>
                                            </article>
                                            <div class="price-block">
                                                {{-- <span class="sc-new-price"> {!! $product->showPrice() !!}</span> --}}
                                                <span class="price">{!! $product->showPriceDetail() !!}</span>
                                                {{-- <del class="price">{!! $product->showPriceDetail() !!}</del> --}}
                                                @if ($product->promotionPrice->price_promotion != $product->price)
                                                <span class="price-discount">-{{ceil((1 - ($product->promotionPrice->price_promotion / $product->price)) * 100)}}%</span>
                                                @endif
                                            </div>
                                            <div class="rating-block">
                                                <span class="fas fa-star star_on"></span>
                                                <span class="fas fa-star star_on"></span>
                                                <span class="fas fa-star star_on"></span>
                                                <span class="fas fa-star star_on"></span>
                                                <span class="fas fa-star "></span>
                                            </div>
                                            <div class="btn-block">
                                                @if ($product->allowSale())
                                                    <div class="single-add-to-cart">
                                                        <a href="" class="btn btn-outlined" onClick="addToCartAjax('{{ $product->id }}','default')">{{trans('front.add_to_cart')}}</a>
                                                    </div>
                                                @endif

                                                <a href="#" class="card-link"><i class="fas fa-heart"></i> Thêm Vào Yêu Thích</a>
                                                
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                        {{-- <div class="pagination">
                            {{ $products->appends(request()->except(['page','_token']))->links($templatePath.'.common.pagination') }}
                        </div> --}}
                    </div>
                    <!-- Pagination Block -->
                    <div class="row pt--30">
                        <div class="col-md-12">
                            <div class="pagination-block">
                                <ul class="pagination-btns ">
                                    {{ $products->appends(request()->except(['page','_token']))->links($templatePath.'.common.pagination') }}
                                    
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- Modal -->
                    <div class="modal fade modal-quick-view" id="quickModal" tabindex="-1" role="dialog"
                        aria-labelledby="quickModal" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <button type="button" class="btn-close" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                                <div class="product-details-modal">
                                    <div class="row">
                                        <div class="col-lg-5">
                                            <!-- Product Details Slider Big asset/image-->
                                            <div class="product-details-slider sb-slick-slider arrow-type-two"
                                                data-slick-setting='{
                                "slidesToShow": 1,
                                "arrows": false,
                                "fade": true,
                                "draggable": false,
                                "swipe": false,
                                "asNavFor": ".product-slider-nav"
                                }'>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-1.jpg" alt="">
                                                </div>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-2.jpg" alt="">
                                                </div>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-3.jpg" alt="">
                                                </div>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-4.jpg" alt="">
                                                </div>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-5.jpg" alt="">
                                                </div>
                                            </div>
                                            <!-- Product Details Slider Nav -->
                                            <div class="mt--30 product-slider-nav sb-slick-slider arrow-type-two"
                                                data-slick-setting='{
                    "infinite":true,
                      "autoplay": true,
                      "autoplaySpeed": 8000,
                      "slidesToShow": 4,
                      "arrows": true,
                      "prevArrow":{"buttonClass": "slick-prev","iconClass":"fa fa-chevron-left"},
                      "nextArrow":{"buttonClass": "slick-next","iconClass":"fa fa-chevron-right"},
                      "asNavFor": ".product-details-slider",
                      "focusOnSelect": true
                      }'>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-1.jpg" alt="">
                                                </div>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-2.jpg" alt="">
                                                </div>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-3.jpg" alt="">
                                                </div>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-4.jpg" alt="">
                                                </div>
                                                <div class="single-slide">
                                                    <img src="asset/image/products/product-details-5.jpg" alt="">
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-7 mt--30 mt-lg--30">
                                            <div class="product-details-info pl-lg--30 ">
                                                <p class="tag-block">Tags: <a href="#">Movado</a>, <a
                                                        href="#">Omega</a></p>
                                                <h3 class="product-title">Beats EP Wired On-Ear Headphone-Black</h3>
                                                <ul class="list-unstyled">
                                                    <li>Ex Tax: <span class="list-value"> £60.24</span></li>
                                                    <li>Brands: <a href="#" class="list-value font-weight-bold"> Canon</a>
                                                    </li>
                                                    <li>Product Code: <span class="list-value"> model1</span></li>
                                                    <li>Reward Points: <span class="list-value"> 200</span></li>
                                                    <li>Availability: <span class="list-value"> In Stock</span></li>
                                                </ul>
                                                <div class="price-block">
                                                    <span class="price-new">£73.79</span>
                                                    <del class="price-old">£91.86</del>
                                                </div>
                                                <div class="rating-widget">
                                                    <div class="rating-block">
                                                        <span class="fas fa-star star_on"></span>
                                                        <span class="fas fa-star star_on"></span>
                                                        <span class="fas fa-star star_on"></span>
                                                        <span class="fas fa-star star_on"></span>
                                                        <span class="fas fa-star "></span>
                                                    </div>
                                                    <div class="review-widget">
                                                        <a href="#">(1 Reviews)</a> <span>|</span>
                                                        <a href="#">Write a review</a>
                                                    </div>
                                                </div>
                                                <article class="product-details-article">
                                                    <h4 class="sr-only">Product Summery</h4>
                                                    <p>Long printed dress with thin adjustable straps. V-neckline and wiring
                                                        under
                                                        the Dust with ruffles
                                                        at the bottom
                                                        of the
                                                        dress.</p>
                                                </article>
                                                <div class="add-to-cart-row">
                                                    <div class="count-input-block">
                                                        <span class="widget-label">Qty</span>
                                                        <input type="number" class="form-control text-center" value="1">
                                                    </div>
                                                    <div class="add-cart-btn">
                                                        <a href="#" class="btn btn-outlined--primary"><span
                                                                class="plus-icon">+</span>Add to Cart</a>
                                                    </div>
                                                </div>
                                                <div class="compare-wishlist-row">
                                                    <a href="#" class="add-link"><i class="fas fa-heart"></i>Add
                                                        to Wish List</a>
                                                    <a href="#" class="add-link"><i class="fas fa-random"></i>Add
                                                        to Compare</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <div class="widget-social-share">
                                        <span class="widget-label">Share:</span>
                                        <div class="modal-social-share">
                                            <a href="#" class="single-icon"><i class="fab fa-facebook-f"></i></a>
                                            <a href="#" class="single-icon"><i class="fab fa-twitter"></i></a>
                                            <a href="#" class="single-icon"><i class="fab fa-youtube"></i></a>
                                            <a href="#" class="single-icon"><i class="fab fa-google-plus-g"></i></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3  mt--40 mt-lg--0">
                    <div class="inner-page-sidebar">
                        <!-- Accordion -->
                        <div class="single-block">
                            <h3 class="sidebar-title">Categories</h3>
                            <ul class="sidebar-menu--shop">
                                <li><a href="#">Accessories (5)</a></li>
                                <li><a href="#">Arts & Photography (10)</a></li>
                                <li><a href="#">Biographies (16)</a></li>
                                <li><a href="#">Business & Money (0)</a></li>
                                <li><a href="#">Calendars (6)</a></li>
                                <li><a href="#">Children's Books (9)</a></li>
                                <li><a href="#">Comics (16)</a></li>
                                <li><a href="#">Cookbooks (7)</a></li>
                                <li><a href="#">Education (3)</a></li>
                                <li><a href="#">House Plants (6)</a></li>
                                <li><a href="#">Indoor Living (9)</a></li>
                                <li><a href="#">Perfomance Filters (5)</a></li>
                                <li><a href="#">Shop (16)</a>
                                    <ul class="inner-cat-items">
                                        <li><a href="#">Saws (0)</a></li>
                                        <li><a href="#">Concrete Tools (7)</a></li>
                                        <li><a href="#">Drills (2)</a></li>
                                        <li><a href="#">Sanders (1)</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <!-- Price -->
                        <div class="single-block">
                            <h3 class="sidebar-title">Fillter By Price</h3>
                            <div class="range-slider pt--30">
                                <div class="sb-range-slider"></div>
                                <div class="slider-price">
                                    <p>
                                        <input type="text" id="amount" readonly="">
                                    </p>
                                </div>
                            </div>
                        </div>
                        <!-- Size -->
                        <div class="single-block">
                            <h3 class="sidebar-title">Manufacturer</h3>
                            <ul class="sidebar-menu--shop menu-type-2">
                                <li><a href="#">Christian Dior <span>(5)</span></a></li>
                                <li><a href="#">Diesel <span>(8)</span></a></li>
                                <li><a href="#">Ferragamo <span>(11)</span></a></li>
                                <li><a href="#">Hermes <span>(14)</span></a></li>
                                <li><a href="#">Louis Vuitton <span>(12)</span></a></li>
                                <li><a href="#">Tommy Hilfiger <span>(0)</span></a></li>
                                <li><a href="#">Versace <span>(0)</span></a></li>
                            </ul>
                        </div>
                        <!-- Color -->
                        <div class="single-block">
                            <h3 class="sidebar-title">Select By Color</h3>
                            <ul class="sidebar-menu--shop menu-type-2">
                                <li><a href="#">Black <span>(5)</span></a></li>
                                <li><a href="#">Blue <span>(6)</span></a></li>
                                <li><a href="#">Brown <span>(4)</span></a></li>
                                <li><a href="#">Green <span>(7)</span></a></li>
                                <li><a href="#">Pink <span>(6)</span></a></li>
                                <li><a href="#">Red <span>(5)</span></a></li>
                                <li><a href="#">White <span>(8)</span></a></li>
                                <li><a href="#">Yellow <span>(11)</span> </a></li>
                            </ul>
                        </div>
                        <!-- Promotion Block -->
                        <div class="single-block">
                            <a href="#" class="promo-asset/image sidebar">
                                <img src="{{ asset($templateFile . '/image/home-side-promo.jpg') }}">

                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        @if (count($products) == 0)
            <p>Không có sản phẩm nào</p>
        @endif

    </main>
    </div>
@endsection


@push('styles')

@endpush
@push('scripts')
    <script type="text/javascript">
        $('[name="filter_sort"]').change(function(event) {
            $('#filter_sort').submit();
        });
    </script>
@endpush
