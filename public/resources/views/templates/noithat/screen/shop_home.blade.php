@php
/*
$layout_page = shop_home
*/ 
@endphp

@extends($templatePath.'.layout')

@section('home')
  @php
      $productsNew = $modelProduct->start()->getProductLatest()->setlimit(8)->getData();
      $productsHot = $modelProduct->start()->getProductHot()->getData();
      $productsBuild = $modelProduct->start()->getProductBuild()->getData();
      $productsGroup = $modelProduct->start()->getProductGroup()->getData();
      $productsCategory = $modelProduct->start()->getProductGroup()->getData();
  @endphp
  <main class="site-main">
      <div class="block-daily-deals style1">
          <div class="container">
              <div class="title-of-section">Dự án nổi bật</div>
              <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="true" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:2}}">
                  @foreach($duan as $duan)
                  <div class="nt-project equal-elem">
                      <div class="nt-project-inner">
                          <div class="thumb">
                              <img src="{{$duan->image}}">
                          </div>
                          <div class="content">
                              {{$duan->html}}
                          </div>
                      </div>
                  </div>
                  @endforeach
              </div>
          </div>
      </div>
          <div class="block-section-4">
              <div class="container">
                  <div class="title-of-section">Sản phẩm</div>
                  <div class="tab-product tab-product-fade-effect">
                      <ul class="box-tabs nav-tab">
                          @php
                            $i = 0;
                          @endphp
                          @foreach($data as $category)
                              @if(count($category->productDescription))
                                  <li class="{{ ($i==0) ? 'active' : '' }}"><a data-animated="" data-toggle="tab" href="#tab-{{ $category->id }}" aria-expanded="false">{{ $category->title }}</a></li>
                                  @php
                                      $i++;
                                  @endphp
                              @endif
                          @endforeach
                      </ul>
                      <div class="tab-content">
                          <div class="tab-container">
                              @php
                                  $j = 0;
                              @endphp
                              @foreach($data as $key => $category)
                                  @if(count($category->productDescription))
                                      <div id="tab-{{ $category->id }}" class="tab-panel {{ ($j==0) ? 'active' : '' }}">
                                  <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="false" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;480&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}}">
                                      @foreach($category->productDescription as $product)
                                          <div class="product-item style1" style="">
                                          <div class="product-inner equal-elem">
                                              <div class="product-thumb">
                                                  <div class="thumb-inner">
                                                      <a href="{{ $product->getUrl() }}"><img src="{{ $product->getThumb() }}" alt="p7"></a>
                                                  </div>
                                                  <a href="#" class="quick-view">Quick View</a>
                                              </div>
                                              <div class="product-innfo">
                                                  <div class="product-name">
                                                      <a href="{{ $product->getUrl() }}">
                                                          @foreach($product->descriptions as $description)
                                                              {{ ($description->lang == sc_get_locale()) ? $description->name : '' }}
                                                          @endforeach
                                                      </a>
                                                  </div>
                                                  <span class="price">
                                                      {!! $product->showPrice() !!}
{{--                                                        <ins>$229.00</ins>--}}
                                                    </span>
                                                  @if ($product->allowSale())
                                                  <div class="group-btn-hover">
                                                      <div class="inner">
                                                          <a href="{{ $product->getUrl() }}" class="add-to-cart">Chi tiết</a>
                                                      </div>
                                                  </div>
                                                      @endif
                                              </div>
                                          </div>
                                      </div>
                                      @endforeach
                                  </div>
                              </div>
                                      @php
                                          $j++;
                                      @endphp
                                  @endif
                              @endforeach
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      <div class="block-section-6">
          <div class="container">
              <div class="promotion-banner box-single style-2">
                  <a href="#" class="banner-img"><img src="{{ asset($templateFile.'/images/banner-3.jpg')}}" alt="banner-3"></a>
                  <div class="promotion-banner-inner">
                      <h4>Nội thất phòng khách</h4>
                      <h3>TẤT CẢ phụ kiện ghế mới</h3>
                      <a class="banner-link" href="#">Xem thêm</a>
                  </div>
              </div>
          </div>
      </div>
      <div class="block-daily-deals style1">
          <div class="container">
              <div class="title-of-section">Tin tức</div>
              <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="true" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:2},&quot;992&quot;:{&quot;items&quot;:3}}">
                  @foreach ($blogs as $blogDetail)
                  <div class="post-item">
                      <div class="post-thumb">
                          <a href="#"><img src="{{ asset($blogDetail->getThumb()) }}" alt="{{ $blogDetail->title }}" alt="post-image-5"></a>
                          <span class="date">{{ $blogDetail->created_at->format('d')}}<span>{{ $blogDetail->created_at->format('M')}}</span></span>
                      </div>
                      <div class="post-item-info">
                          <h3 class="post-name"><a href="{{ $blogDetail->getUrl() }}">{{ $blogDetail->title }}</a>
                          </h3>
                          <div class="post-metas">
                          </div>
                          <div class="post-content">
                              <p>{{ $blogDetail->description }}</p>
                              <a href="{{ $blogDetail->getUrl() }}" class="read-more">Xem thêm</a>
                          </div>
                      </div>
                  </div>
                  @endforeach
              </div>
          </div>

      </div>
  </main>
@endsection



@push('styles')
      {{-- style css --}}
@endpush

@push('scripts')
      {{-- script --}}
@endpush