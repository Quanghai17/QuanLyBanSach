@php
/*
$layout_page = shop_home
*/ 
@endphp

@extends($templatePath.'.layout')

@section('home')
  @php
      $products = $modelProduct->start()->setlimit(8)->getData();
      $productsHot = $modelProduct->start()->getProductHot()->getData();
      $productsBuild = $modelProduct->start()->getProductBuild()->getData();
      $productsGroup = $modelProduct->start()->getProductGroup()->getData();
      $productsCategory = $modelProduct->start()->getProductGroup()->getData();
      $news = $modelNews->start()->setlimit(8)->getData(); 
  @endphp

<!--=================================
Home Features Section
===================================== -->
<section class="mb--30">
    <div class="container">
        <div class="row">
            <div class="col-xl-3 col-md-6 mt--30">
                <div class="feature-box h-100">
                    <div class="icon">
                        <i class="fas fa-shipping-fast"></i>
                    </div>
                    <div class="text">
                        <h5>Miễn Phí Vận Chuyển</h5>
                        <p> Đơn Hàng Từ 500.000VNĐ</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mt--30">
                <div class="feature-box h-100">
                    <div class="icon">
                        <i class="fas fa-redo-alt"></i>
                    </div>
                    <div class="text">
                        <h5>Hoàn Trả Nếu Có Lỗi</h5>
                        <p>100% Tiền Mặt</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mt--30">
                <div class="feature-box h-100">
                    <div class="icon">
                        <i class="fas fa-piggy-bank"></i>
                    </div>
                    <div class="text">
                        <h5>Thanh Toán Khi Nhận Hàng</h5>
                        <p>Kiểm Tra Hàng Thoải Mãi</p>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6 mt--30">
                <div class="feature-box h-100">
                    <div class="icon">
                        <i class="fas fa-life-ring"></i>
                    </div>
                    <div class="text">
                        <h5>Hỗ Trợ Và Tư Vấn</h5>
                        <p> {{ sc_store('long_phone') }}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Promotion Section One
===================================== -->
<section class="section-margin">
    <h2 class="sr-only">Promotion Section</h2>
    <div class="container">
        <div class="row space-db--30">
            <div class="col-lg-6 col-md-6 mb--30">
                <a href="#" class="promo-image promo-overlay">
                    
                    <img src="{{ asset($templateFile.'/image/promo-banner-with-text.jpg')}}">
                </a>
            </div>
            <div class="col-lg-6 col-md-6 mb--30">
                <a href="#" class="promo-image promo-overlay">
                    
                    <img src="{{ asset($templateFile.'/image/promo-banner-with-text-2.jpg')}}">
                </a>
            </div>
        </div>
    </div>
</section>
<!--=================================
Home Slider Tab
===================================== -->
<section class="section-padding">
    <h2 class="sr-only">Home Tab Slider Section</h2>
    <div class="container">
        <div class="sb-custom-tab">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="shop-tab" data-bs-toggle="tab" href="#shop" role="tab"
                        aria-controls="shop" aria-selected="true">
                        Tất Cả Sách Trong Cửa Hàng
                    </a>
                    <span class="arrow-icon"></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="men-tab" data-bs-toggle="tab" href="#men" role="tab"
                        aria-controls="men" aria-selected="true">
                        Sách Mới Nhất
                    </a>
                    <span class="arrow-icon"></span>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="woman-tab" data-bs-toggle="tab" href="#woman" role="tab"
                        aria-controls="woman" aria-selected="false">
                       Sách Có Lượt Xem Nhiều Nhất
                    </a>
                    <span class="arrow-icon"></span>
                </li>
            </ul>
                
                <div class="tab-pane" id="men" role="tabpanel" aria-labelledby="men-tab">
                    <div class="product-slider multiple-row  slider-border-multiple-row  sb-slick-slider"
                        data-slick-setting='{
                                "autoplay": true,
                                "autoplaySpeed": 8000,
                                "slidesToShow": 5,
                                "rows":2,
                                "dots":true
                            }' data-slick-responsive='[
                                {"breakpoint":1200, "settings": {"slidesToShow": 3} },
                                {"breakpoint":768, "settings": {"slidesToShow": 2} },
                                {"breakpoint":480, "settings": {"slidesToShow": 1} },
                                {"breakpoint":320, "settings": {"slidesToShow": 1} }
                            ]'>
                            @foreach ($products as $product)
                        <div class="single-slide">
                            <div class="product-card">
                                <div class="product-header">
                                    <a href="#" class="author">
                                       Nhiều Tác Giả
                                    </a>
                                        <h3><a href="{{ $product->getUrl() }}">{{ $product->name }}</a></h3>
                                </div>
                                <div class="product-card--body">
                                    <div class="card-asset/image">
                                        <img src="{{ asset($product->getThumb()) }}" alt="">
                                        <div class="hover-contents">
                                            <a href="product-details.html" class="hover-asset/image">
                                                <img src="{{ asset($product->getThumb()) }}" alt="">
                                            </a>
                                            <div class="hover-btns">
                                                <a href="cart.html" class="single-btn">
                                                    <i class="fas fa-shopping-basket"></i>
                                                </a>
                                                <a href="wishlist.html" class="single-btn">
                                                    <i class="fas fa-heart"></i>
                                                </a>
                                                <a href="compare.html" class="single-btn">
                                                    <i class="fas fa-random"></i>
                                                </a>
                                                <a href="#" data-bs-toggle="modal" data-bs-target="#quickModal"
                                                    class="single-btn">
                                                    <i class="fas fa-eye"></i>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="price-block">
                                        <span class="price">{!! $product->showPrice() !!}</span>
                                        @if ($product->promotionPrice->price_promotion != $product->price)
                              <span class="price-discount">-{{ceil((1 - ($product->promotionPrice->price_promotion / $product->price)) * 100)}}%</span>
                            @endif
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach

                    </div>
                </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!--=================================
Deal of the day 
===================================== -->
<section class="section-margin">
    <div class="container-fluid">
        <div class="promo-section-heading">
            <h2>Giảm Giá 20% Khi Mua Và Ngày Lễ Kỉ Niệm Quốc Khánh</h2>
        </div>
        <div class="product-slider with-countdown  slider-border-single-row sb-slick-slider" data-slick-setting='{
        "autoplay": true,
        "autoplaySpeed": 8000,
        "slidesToShow": 6,
        "dots":true
    }' data-slick-responsive='[
        {"breakpoint":1400, "settings": {"slidesToShow": 4} },
        {"breakpoint":992, "settings": {"slidesToShow": 3} },
        {"breakpoint":768, "settings": {"slidesToShow": 2} },
        {"breakpoint":575, "settings": {"slidesToShow": 2} },
        {"breakpoint":490, "settings": {"slidesToShow": 1} }
    ]'>
    @foreach ( $productsHot as $product)
            <div class="single-slide">
                <div class="product-card">
                    <div class="product-header">
                        <a href="#" class="author">
                            Tác Giả: Nguyễn Quang Hải
                        </a>
                        <h3><a href="{{ $product->getUrl() }}">{{ $product->name }}</a>
                        </h3>
                    </div>
                    <div class="product-card--body">
                        <div class="card-asset/image">
                            <img src="image/product-5.jpg" alt="">
                            <img src="{{ asset($product->getThumb()) }}">
                            <div class="hover-contents">
                                <a href="product-details.html" class="hover-asset/image">
                                    <img src="{{ asset($product->getThumb()) }}">
                                </a>
                                <div class="hover-btns">
                                    <a href="cart.html" class="single-btn">
                                        <i class="fas fa-shopping-basket"></i>
                                    </a>
                                    <a href="wishlist.html" class="single-btn">
                                        <i class="fas fa-heart"></i>
                                    </a>
                                    <a href="compare.html" class="single-btn">
                                        <i class="fas fa-random"></i>
                                    </a>
                                    <a href="#" data-bs-toggle="modal" data-bs-target="#quickModal"
                                        class="single-btn">
                                        <i class="fas fa-eye"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="price-block">
                            <span class="price">{!! $product->showPrice() !!}</span>
                            @if ($product->promotionPrice->price_promotion != $product->price)
                              <span class="price-discount">-{{ceil((1 - ($product->promotionPrice->price_promotion / $product->price)) * 100)}}%</span>
                            @endif
                           
                        </div>
                        <div class="count-down-block">
                            <div class="product-countdown" data-countdown="01/05/2020"></div>
                        </div>
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
<!--=================================
Best Seller Product
===================================== -->
<section class="section-margin bg-asset/image section-padding-top section-padding"
    data-bg="image/bg-asset/images/best-seller-bg.jpg">
    <div class="container">
        <div class="section-title section-title--bordered mb-0">
            <h2>Các Loại Sách Cùng Bộ</h2>
        </div>
        <div class="best-seller-block">
            <div class="row align-items-center">
                <div class="col-lg-5 col-md-6">
                    <div class="author-asset/image">
                        <img src="image/others/best-seller-author.jpg" alt="">
                        <img src="{{ asset($templateFile.'/image/best-seller-author.jpg')}}">
                    </div>
                </div>
                <div class="col-lg-7 col-md-6">
                    <div class="sb-slick-slider product-slider product-list-slider multiple-row slider-border-multiple-row"
                        data-slick-setting='{
                            "autoplay": false,
                            "autoplaySpeed": 8000,
                            "slidesToShow":2,
                            "rows":2,
                            "dots":true
                        }' data-slick-responsive='[
                            {"breakpoint":1200, "settings": {"slidesToShow": 1} },
                            {"breakpoint":992, "settings": {"slidesToShow": 1} },
                            {"breakpoint":768, "settings": {"slidesToShow": 1} },
                            {"breakpoint":575, "settings": {"slidesToShow": 1} },
                            {"breakpoint":490, "settings": {"slidesToShow": 1} }
                        ]'>
                        @foreach ( $productsBuild as $product)
                        <div class="single-slide">
                            <div class="product-card card-style-list">
                                <div class="card-asset/image">
                                    <img src="{{ asset($product->getThumb()) }}">
                                </div>
                                <div class="product-card--body">
                                    <div class="product-header">
                                        <a href="#" class="author">
                                            Rpple
                                        </a>
                                        <h3><a href="{{ $product->getUrl() }}">{{ $product->name }}
                          </a></h3>
                                    </div>
                                    <div class="price-block">
                                        {{-- <span class="price">{!! $product->showPrice() !!}</span>
                                        <del class="price-old">£51.20</del>
                                        <span class="price-discount">20%</span> --}}
                                    </div>
                                </div>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!--=================================
Home Blog Slider
===================================== -->
<!--=================================
Home Blog
===================================== -->
<section class="section-margin">
    <div class="container">
        <div class="section-title">
            <h2>Tin Tức</h2>
        </div>
        <div class="blog-slider sb-slick-slider" data-slick-setting='{
        "autoplay": true,
        "autoplaySpeed": 8000,
        "slidesToShow": 2,
        "dots": true
    }' data-slick-responsive='[
        {"breakpoint":1200, "settings": {"slidesToShow": 1} }
    ]'>
    @foreach ($news as $newsDetail)
            <div class="single-slide">
                <div class="blog-card">
                    <div class="asset/image">
                       
                        <img src="{{ asset($newsDetail->getThumb()) }}">
                    </div>
                    <div class="content">
                        <div class="content-header">
                            <div class="date-badge">
                                <span class="date">
                                    {{ $newsDetail->created_at->format('d')}}
                                </span>
                                <span class="month">
                                    Aug
                                </span>
                            </div>
                            <h3 class="title"><a href="blog-details.html">{{ $newsDetail->title }}</a>
                            </h3>
                        </div>
                        <p class="meta-para">Sáng tác <a href="#">Hastech</a></p>
                        <article class="blog-paragraph">
                            <h2 class="sr-only">{{ $newsDetail->created_at->format('d')}}</h2>
                            <p>{{ $newsDetail->description }}</p>
                        </article>
                       
                    </div>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
      
  </main>
@endsection



@push('styles')
      {{-- style css --}}
@endpush

@push('scripts')
      {{-- script --}}
@endpush