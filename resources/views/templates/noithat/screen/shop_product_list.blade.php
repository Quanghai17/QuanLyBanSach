@php
/*
$layout_page = product_list
$itemsList: paginate
Use paginate: $itemsList->appends(request()->except(['page','_token']))->links()
$products: paginate
Use paginate: $products->appends(request()->except(['page','_token']))->links()
*/ 
@endphp
@extends($templatePath.'.layout')

@section('center')
    <div class="col-md-9 col-sm-8 float-none float-right">
        <div class="main-content">
            <div class="promotion-banner style-3">
               <img src="{{asset($templateFile.'/images/banner-product.jpg')}}" alt="banner-product">

            </div>
            <div class="toolbar-products">
                <h4 class="title-product">Sản phẩm</h4>
            </div>


            <div class="products products-list products-grid equal-container auto-clear">
                @foreach ($products as $key => $product)
                <div class="product-item style1 width-33 col-md-4 col-sm-6 col-xs-6 equal-elem" >
                    <div class="product-inner">
                        <div class="product-thumb">
                            <div class="thumb-inner" style="background-image: url({{asset($product->getThumb())}})">
                            </div>
                            @if ($product->promotionPrice->price_promotion != $product->price)
                              <span class="onsale">-{{ceil((1 - ($product->promotionPrice->price_promotion / $product->price)) * 100)}}%</span>
                            @endif
                            <a href="{{ $product->getUrl() }}" onclick="location.href='{{ $product->getUrl() }}'" class="quick-view">Quick View</a>
                        </div>
                        <div class="product-innfo">
                            <div class="product-name"><a href="{{ $product->getUrl() }}">
                                    {{ $product->name }}
                                </a></div>
                            <span class="price">

                                                {!! $product->showPrice() !!}

                                            </span>
                            @if ($product->allowSale())
                            <div class="single-add-to-cart" >
                                <a  href="{{ $product->getUrl() }}" class="btn-add-to-cart">Đặt hàng</a>
                            </div>
                            @endif
                        </div>
                    </div>
                </div>
                @endforeach
            </div>

            @if (count($products) == 0)
                  <p>Không có sản phẩm nào</p>
                @endif

            <div class="pagination">
                {{ $products->appends(request()->except(['page','_token']))->links($templatePath.'.common.pagination') }}
            </div>
        </div>
    </div>
@endsection


@section('breadcrumb')
    <div class="breadcrumbs pull-left">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@section('filter')
  <form action="" method="GET" id="filter_sort">
        <div class="pull-right">
        <div>
            @php
              $queries = request()->except(['filter_sort','page']);
            @endphp
            @foreach ($queries as $key => $query)
              <input type="hidden" name="{{ $key }}" value="{{ $query }}">
            @endforeach
          <select class="custom-select" name="filter_sort">
            <option value="">{{ trans('front.filters.sort') }}</option>
            <option value="price_asc" {{ ($filter_sort =='price_asc')?'selected':'' }}>{{ trans('front.filters.price_asc') }}</option>
            <option value="price_desc" {{ ($filter_sort =='price_desc')?'selected':'' }}>{{ trans('front.filters.price_desc') }}</option>
            <option value="sort_asc" {{ ($filter_sort =='sort_asc')?'selected':'' }}>{{ trans('front.filters.sort_asc') }}</option>
            <option value="sort_desc" {{ ($filter_sort =='sort_desc')?'selected':'' }}>{{ trans('front.filters.sort_desc') }}</option>
            <option value="id_asc" {{ ($filter_sort =='id_asc')?'selected':'' }}>{{ trans('front.filters.id_asc') }}</option>
            <option value="id_desc" {{ ($filter_sort =='id_desc')?'selected':'' }}>{{ trans('front.filters.id_desc') }}</option>
          </select>
        </div>
      </div>
  </form>

@endsection

@push('styles')
      {{-- style css --}}
@endpush

@push('scripts')
  <script type="text/javascript">
    $('[name="filter_sort"]').change(function(event) {
      $('#filter_sort').submit();
    });
  </script>
@endpush
