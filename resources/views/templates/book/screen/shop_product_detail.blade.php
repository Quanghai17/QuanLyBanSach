@php
/*
$layout_page = product_detail
$product: no paginate
$productRelation: no paginate
*/ 
@endphp

@extends($templatePath.'.layout')

@section('center')
<section class="breadcrumb-section">
    <h2 class="sr-only">Site Breadcrumb</h2>
    <div class="container">
        <div class="breadcrumb-contents">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html">Trang Chủ</a></li>
                    <li class="breadcrumb-item active">Chi Tiết Về Sách</li>
                </ol>
            </nav>
        </div>
    </div>
</section>
<main class="inner-page-sec-padding-bottom">
    <div class="container">
        <form id="buy_block" action="{{ route('cart.add') }}" method="post">
            {{ csrf_field() }}
            <input type="hidden" name="product_id" id="product-detail-id" value="{{ $product->id }}" />
        <div class="row mb--60">
        
            <div class="col-lg-5 mb--30">
                <!-- Product Details Slider Big asset/image-->
                <div id="products-details" class="product-details-slider sb-slick-slider arrow-type-two"
                    data-slick-setting='{
          "slidesToShow": 1,
          "arrows": false,
          "fade": true,
          "draggable": false,
          "swipe": false,
          "asNavFor": ".product-slider-nav"
          }'>
                    <div class="single-slide pink">
                        <img src="{{asset($product->getThumb())}}" alt="">
                    </div>
                    <div class="single-slide white">
                        <img src="{{asset($product->getThumb())}}" alt="">
                    </div>
                    <div class="single-slide yellow">
                        <img src="{{asset($product->getThumb())}}" alt="">
                    </div>
                    <div class="single-slide gray">
                        <img src="{{asset($product->getThumb())}}" alt="">
                    </div>
                </div>
                <!-- Product Details Slider Nav -->
                <div id="product-nav" class="mt--30 product-slider-nav sb-slick-slider arrow-type-two"
                    data-slick-setting='{
          "slidesToShow": 4,
          "asNavFor": ".product-details-slider",
          "focusOnSelect": true
          }'>
                    {{-- <div class="single-slide pink">
                        <img src="{{asset($product->getThumb())}}g" alt="">
                    </div>
                    <div class="single-slide white">
                        <img src="{{asset($product->getThumb())}}" alt="">
                    </div>
                    <div class="single-slide yellow">
                        <img src="{{asset($product->getThumb())}}" alt="">
                    </div>
                    <div class="single-slide gray">
                        <img src="{{asset($product->getThumb())}}" alt="">
                    </div> --}}
                </div>
            </div>
            <div class="col-lg-7">
                <div class="product-details-info pl-lg--30 ">
                    <p class="tag-block">Tags: <a href="#">Movado</a>, <a href="#">Omega</a></p>
                    <h3 class="product-title">{{ $product->name }}</h3>
                    <ul class="list-unstyled">
                        <li>Trước Thuế: <span class="list-value"> </span></li>
                        <li>Thương Hiệu: <a href="#" class="list-value font-weight-bold"> Canon</a></li>
                        <li>Mã Code: <span class="list-value"> model1</span></li>
                        <li>Đánh Giá: <span class="list-value"> 200</span></li>
                        <li>Số Lượng: <span class="list-value"> 198</span></li>
                    </ul>
                    <div class="price-block">
                        <span class="sc-new-price">{!! $product->showPriceDetail() !!}</span>
                        
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
                            <a href="">(1 Nhận Xét)</a> <span>|</span>
                            <a href="">Thêm Nhận Xét</a>
                        </div>
                    </div>
                    <article class="product-details-article">
                        <h4 class="sr-only">Tóm tắt sản phẩm</h4>
                        <p>{{ $product->description }}</p>
                    </article>
                    <div class="variable-block mb--30">
                        <h3 class="title">Tùy chọn có sẵn</h3>
                        <p><span class="text-red">*</span>color</p>
                        <div class="color-list">
                            <a href="#" class="single-color active" data-swatch-color="pink">
                                <span class="bg-pink"></span>
                                <span class="color-text">+ Pink</span>
                            </a>
                            <a href="#" class="single-color" data-swatch-color="white">
                                <span class="bg-white">
                                </span>
                                <span class="color-text">+ White</span>
                            </a>
                            <a href="#" class="single-color" data-swatch-color="yellow">
                                <span class="bg-yellow-2"></span>
                                <span class="color-text">+Yellow</span>
                            </a>
                            <a href="#" class="single-color" data-swatch-color="gray">
                                <span class="bg-dark-gray"></span>
                                <span class="color-text">+Gray</span>
                            </a>
                        </div>
                    </div>
                    <div class="add-to-cart-row">
                        <div class="count-input-block">
                            <span class="widget-label">Qty</span>
                            <input type="number" name="qty" class="form-control text-center" value="1">
                        </div>
                        <div class="add-cart-btn">
                            <button type="submit" class="btn btn-outlined--primary"><span class="plus-icon">+</span>Thêm Vào Giỏ Hàng</button>
                        </div>
                    </div>
                    <div class="compare-wishlist-row">
                        <a href="wishlist.html" class="add-link"><i class="fas fa-heart"></i>Thêm Vào Sách Yêu Thích</a>
                      
                    </div>
                </div>
            </div>
        </div>
    </form>
        <div class="sb-custom-tab review-tab section-padding">
            <ul class="nav nav-tabs nav-style-2" id="myTab2" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="tab1" data-bs-toggle="tab" href="#tab-1" role="tab"
                        aria-controls="tab-1" aria-selected="true">
                        Miêu Tả
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" id="tab2" data-bs-toggle="tab" href="#tab-2" role="tab"
                        aria-controls="tab-2" aria-selected="true">
                        Nhận Xét
                    </a>
                </li>
            </ul>
            <div class="tab-content space-db--20" id="myTabContent">
                <div class="tab-pane fade show active" id="tab-1" role="tabpanel" aria-labelledby="tab1">
                    <article class="review-article">
                        <h1 class="sr-only">Chi Tiết</h1>
                        <p> {!! sc_html_render( $product->content) !!}</p>
                    </article>
                </div>
                <div class="tab-pane fade" id="tab-2" role="tabpanel" aria-labelledby="tab2">
                    <div class="review-wrapper">
                        <h2 class="title-lg mb--20">1 Nhận Xét</h2>
                        <div class="review-comment mb--20">
                            <div class="avatar">
                                <img src="asset/image/icon/author-logo.png" alt="">
                            </div>
                            <div class="text">
                                <div class="rating-block mb--15">
                                    <span class="ion-android-star-outline star_on"></span>
                                    <span class="ion-android-star-outline star_on"></span>
                                    <span class="ion-android-star-outline star_on"></span>
                                    <span class="ion-android-star-outline"></span>
                                    <span class="ion-android-star-outline"></span>
                                </div>
                                <h6 class="author">ADMIN – <span class="font-weight-400">March 23, 2015</span>
                                </h6>
                                <p> {{ $product->description }}</p>
                            </div>
                        </div>
                        <h2 class="title-lg mb--20 pt--15">ADD A REVIEW</h2>
                        <div class="rating-row pt-2">
                            <p class="d-block">Your Rating</p>
                            <span class="rating-widget-block">
                                <input type="radio" name="star" id="star1">
                                <label for="star1"></label>
                                <input type="radio" name="star" id="star2">
                                <label for="star2"></label>
                                <input type="radio" name="star" id="star3">
                                <label for="star3"></label>
                                <input type="radio" name="star" id="star4">
                                <label for="star4"></label>
                                <input type="radio" name="star" id="star5">
                                <label for="star5"></label>
                            </span>
                            <form action="./" class="mt--15 site-form ">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="form-group">
                                            <label for="message">Comment</label>
                                            <textarea name="message" id="message" cols="30" rows="10"
                                                class="form-control"></textarea>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="name">Name *</label>
                                            <input type="text" id="name" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="email">Email *</label>
                                            <input type="text" id="email" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="form-group">
                                            <label for="website">Website</label>
                                            <input type="text" id="website" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="submit-btn">
                                            <a href="#" class="btn btn-black">Post Comment</a>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--=================================
RELATED PRODUCTS BOOKS
===================================== -->
    <section class="">
        <div class="container">
            <div class="section-title section-title--bordered">
                <h2>Sách Cùng Danh Mục</h2>
            </div>
            <div class="product-slider sb-slick-slider slider-border-single-row" data-slick-setting='{
        "autoplay": true,
        "autoplaySpeed": 8000,
        "slidesToShow": 4,
        "dots":true
    }' data-slick-responsive='[
        {"breakpoint":1200, "settings": {"slidesToShow": 4} },
        {"breakpoint":992, "settings": {"slidesToShow": 3} },
        {"breakpoint":768, "settings": {"slidesToShow": 2} },
        {"breakpoint":480, "settings": {"slidesToShow": 1} }
    ]'>
    @foreach ($productRelation as $key => $product_rel)
                <div class="single-slide">
                    <div class="product-card">
                        <div class="product-header">
                            <a href="" class="author">
                               Tác Giả: Nhiều Tác Giả
                            </a>
                            <h3><a href="{{ $product_rel->getUrl() }}">{{ $product_rel->name }}</a></h3>
                        </div>
                        <div class="product-card--body">
                            <div class="card-asset/image">
                                <img src="{{ asset($product_rel->getThumb()) }}" alt="">
                                <div class="hover-contents">
                                    <a href="{{ $product_rel->getUrl() }}" class="hover-asset/image">
                                        <img src="{{ asset($product_rel->getThumb()) }}" alt="">
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
                                <span class="price"> {!! $product_rel->showPrice() !!}</span>
                               
                                <span class="price-discount">20%</span>
                            </div>
                        </div>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </section>
    <!-- Modal -->
    <div class="modal fade modal-quick-view" id="quickModal" tabindex="-1" role="dialog"
        aria-labelledby="quickModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <button type="button" class="close modal-close-btn ml-auto" data-bs-dismiss="modal"
                    aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
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
                                <p class="tag-block">Tags: <a href="#">Movado</a>, <a href="#">Omega</a></p>
                                <h3 class="product-title">Beats EP Wired On-Ear Headphone-Black</h3>
                                <ul class="list-unstyled">
                                    <li>Ex Tax: <span class="list-value"> £60.24</span></li>
                                    <li>Brands: <a href="#" class="list-value font-weight-bold"> Canon</a></li>
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
                                        <a href="">(1 Reviews)</a> <span>|</span>
                                        <a href="">Write a review</a>
                                    </div>
                                </div>
                                <article class="product-details-article">
                                    <h4 class="sr-only">Product Summery</h4>
                                    <p>Long printed dress with thin adjustable straps. V-neckline and wiring
                                        under the Dust with ruffles at the bottom
                                        of the
                                        dress.</p>
                                </article>
                                <div class="add-to-cart-row">
                                    <div class="count-input-block">
                                        <span class="widget-label">Qty</span>
                                        <input type="number" class="form-control text-center" value="1">
                                    </div>
                                    <div class="add-cart-btn">
                                        <a href="" class="btn btn-outlined--primary"><span
                                                class="plus-icon">+</span>Add to Cart</a>
                                    </div>
                                </div>
                                <div class="compare-wishlist-row">
                                    <a href="" class="add-link"><i class="fas fa-heart"></i>Add to Wish List</a>
                                    <a href="" class="add-link"><i class="fas fa-random"></i>Add to Compare</a>
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
</main>
@endsection

@section('breadcrumb')
@endsection

@push('styles')
      {{-- style css --}}
@endpush

@push('scripts')
<script type="text/javascript">
  $('.sc-product-group').click(function(event) {
    if($(this).hasClass('active')){
      return;
    }
    $('.sc-product-group').removeClass('active');
    $(this).addClass('active');
    var id = $(this).data("id");
      $.ajax({
          url:'{{ route("product.info") }}',
          type:'POST',
          dataType:'json',
          data:{id:id,"_token": "{{ csrf_token() }}"},
          beforeSend: function(){
              $('#loading').show();
          },
          success: function(data){
            //console.log(data);
            var showImages = '<div class="carousel-inner">' +
              '<div class="view-product item active"  data-slide-number="0">'+
                  '<img src="'+data.image+'" alt="">'+
              '</div>';
          if(data.subImages.length) {
              $.each(data.subImages, function( index, value ) {
                  showImages +='<div class="view-product item"  data-slide-number="'+(index + 1)+ '">'+
                      '<img src="'+value+'" alt="">'+
                      '</div>'
                });
          }
          showImages +='</div>';
          if(data.subImages.length) {
              showImages += '<a class="left item-control" href="#similar-product" data-slide="prev">'+
                  '<i class="fa fa-angle-left"></i></a>'+
                  '<a class="right item-control" href="#similar-product" data-slide="next">'+
                  '<i class="fa fa-angle-right"></i>'+
                  '</a>';
          }
            $('#product-detail-cart-group').show();
            $('#product-detail-name').html(data.name);
            $('#product-detail-model').html(data.sku);
            $('#product-detail-price').html(data.showPrice);
            $('#product-detail-brand').html(data.brand_name);
            $('#product-detail-image').html(showImages);
            $('#product-detail-available').html(data.availability);
            $('#product-detail-id').val(data.id);
            $('#product-detail-image').carousel();
            $('#loading').hide();
            window.history.pushState("", "", data.url);            
          }
      });

  });
</script>
@endpush
