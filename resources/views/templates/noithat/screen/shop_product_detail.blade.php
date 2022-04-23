@php
/*
$layout_page = product_detail
$product: no paginate
$productRelation: no paginate
*/ 
@endphp

@extends($templatePath.'.layout')

@section('center')
    <main class="col-sm-12 site-main">

            <div class="product-content-single">
                <div class="row">
                    <div class="col-md-6 col-sm-12 padding-right" style="padding-bottom: 30px;">
                        <div class="photo-detail-large slider-for">
                            <div class="photo-large detail_zoom">
                              <img src="{{ $product->getThumb()}}" alt="">
                            </div>
                            @foreach ($product->images as $key=>$image)
                            <div class="photo-large detail_zoom">
                                <img src="{{ $image->getImage()}}" alt="">
                            </div>
                            @endforeach
                        </div>
                        <div class="photo-detail-small slider-nav">
                            <div class="photo-small">
                              <img src="{{ $product->getThumb() }}" alt="">
                            </div>
                            @foreach ($product->images as $key=>$image)
                            <div class="photo-small">
                                <img src="{{ $image->getImage()}}" alt="">
                            </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="col-md-6 col-sm-12">
                        <div class="product-info-main">
                            <div class="product-name"><a href="">{{ $product->name }}</a></div>
                            <div class="product-info-stock-sku">
                                <div class="stock available">
                                    <span class="label-stock">Trạng thái: </span>Còn hàng
                                </div>
                            </div>
                            @if($product->description)
                            <div class="product-infomation">
                                {{ $product->description }}
                            </div>
                            @endif
                            <div class="product-info-price">
                                <span class="price">

                                    {!! $product->showPriceDetail() !!}

                                </span>

                                <form id="buy_block" action="{{ route('cart.add') }}" method="post">
                                    {{ csrf_field() }}
                                    <input type="hidden" name="product_id" id="product-detail-id" value="{{ $product->id }}" />
                                    <div id="product-detail-attr">
                                        @if ($product->attributes())
                                            {!! $product->renderAttributeDetails() !!}
                                        @endif
                                    </div>


                                <span id="product-detail-cart-group">
                                    <label>{{ trans('product.quantity') }}:</label>
                                    <input type="number" name="qty" value="1" min="1" />
                                    <button type="submit" class="btn-add-to-cart">
                                        <i class="fa fa-shopping-cart"></i>
                                        {{trans('front.add_to_cart')}}
                                    </button>
                                </span>
                            </div>
                        </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-details-product">
                <ul class="box-tab nav-tab">
                    <li class="active"><a data-toggle="tab" href="#tab-1" aria-expanded="true">Thông tin sản phẩm</a></li>
                </ul>
                <div class="tab-container">
                    <div id="tab-1" class="tab-panel active">
                        <div class="box-content img-height-auto">
                            {!! sc_html_render( $product->content) !!}
                        </div>
                    </div>
                </div>
            </div>
        <div class="block-recent-view">
            <div class="container">
                <div class="title-of-section">{{ trans('front.recommended_items') }}</div>
                <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="true" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;480&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}}">
                    @foreach ($productRelation as $key => $product_rel)
                    <div class="product-item style1">
                        <div class="product-inner equal-elem">
                            <div class="product-thumb">
                                <div class="thumb-inner">
                                    <a href="{{ $product_rel->getUrl() }}">
                                        <img src="{{ asset($product_rel->getThumb()) }}" alt="{{ $product_rel->name }}">
                                    </a>
                                </div>
                                <a href="{{ $product_rel->getUrl() }}" onclick="location.href='{{ $product_rel->getUrl() }}'" class="quick-view">Quick View</a>
                            </div>
                            <div class="product-innfo">
                                <div class="product-name"><a href="{{ $product_rel->getUrl() }}">
                                        {{ $product_rel->name }}
                                    </a></div>
                                <span class="price price-dark">

                                        {!! $product_rel->showPrice() !!}

                                    </span>

                            </div>
                        </div>

                    </div>
                        @endforeach
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
