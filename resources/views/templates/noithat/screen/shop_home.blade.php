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
  @endphp
  <main class="site-main">
      <div class="block-section-4 section-about">
          <div class="container">
              <div class="title-of-section style-02">Về chúng tôi</div>
              <p>{{sc_store('description')}}</p>
          </div>
      </div>
      <div class="block-section-4 section-testimonial">
          <div class="container">
              <div class="title-of-section style-02 light">Lý do chọn chúng tôi
              </div>
              <div class="testimonial-wrap">
                  <div class="row">
                      <div class="testimonial-item col-md-6 text-right">
                          <div class="row">
                          <div class="content col-md-10">
                                <div class="title">
                                    Vật liệu an toàn - cam kết đúng thương hiệu
                                </div>
                                <div class="des">
                                    Nguyên liệu sạch được chọn lựa tại các đơn vị cung cấp uy tín hàng đầu, đảm bảo đúng chất lượng với sự lựa chọn của quý khách hàng
                                </div>
                          </div>
                          <div class="icon col-md-2">
                              <img src="{{ asset($templateFile.'/image/w1-b3a.png')}}">
                          </div>
                          </div>
                      </div>
                      <div class="testimonial-item col-md-6 ">
                          <div class="row">
                              <div class="icon col-md-2">
                                  <img src="{{ asset($templateFile.'/image/w2-fc9.png')}}">
                              </div>
                              <div class="content col-md-10">
                                <div class="title">
                                    Đội ngũ chuyên nghiệp
                                </div>
                                <div class="des">
                                    Với đội ngũ nhân sự dày dặn kinh nghiệm, trách nhiệm và yêu nghề sẽ tạo ra những sản phẩm và chất lượng nhất
                                </div>
                          </div>
                          </div>
                      </div>
                      <div class="testimonial-item col-md-6 text-right">
                          <div class="row">
                              <div class="content col-md-10">
                                  <div class="title">
                                      Chất lượng sản phẩm - giá cả hợp lý
                                  </div>
                                  <div class="des">
                                      Sản phẩm được thiết kế sáng tạo phù hợp công năg sử dụng, gia công sắc nét tỷ mỹ , đúng thiết kế đã chọn. Giá thành hợp lý tối ưu với mức đầu tư khách hàng đưa ra
                                  </div>
                              </div>
                              <div class="icon col-md-2">
                                  <img src="{{ asset($templateFile.'/images/w3-3b4.png')}}">
                              </div>
                          </div>
                      </div>
                      <div class="testimonial-item col-md-6 ">
                          <div class="row">
                              <div class="icon col-md-2">
                                  <img src="{{ asset($templateFile.'/images/w4-7b8-80-80-f38.png')}}">
                              </div>
                              <div class="content col-md-10">
                                  <div class="title">
                                      Uy tín hàng đầu
                                  </div>
                                  <div class="des">
                                      Là một trong những thương hiệu được đánh giá cao trong khu vực trong nhiều năm qua, làđơn vị được tin tưởng cho nhiều dự án mang tính thẫm mỹ được yêu cầu cao.
                                  </div>
                              </div>
                          </div>
                      </div>
                      <div class="testimonial-item col-md-6 text-right">
                          <div class="row">
                              <div class="content col-md-10">
                                  <div class="title">
                                      Ý tưởng sáng tạo
                                  </div>
                                  <div class="des">
                                      Với đội ngủ thiết kế trẻ năng động , tư duy mới. Luôn cho ra những sản phẩm thiết kế độc đáo, mới mẻ đáp ứng mọi nhu cầu của khách hàng
                                  </div>
                              </div>
                              <div class="icon col-md-2">
                                  <img src="{{ asset($templateFile.'/images/w5-c4a-80-80-7d9.png')}}">
                              </div>
                          </div>
                      </div>
                      <div class="testimonial-item col-md-6 ">
                          <div class="row">
                              <div class="icon col-md-2">
                                  <img src="{{ asset($templateFile.'/images/w6-14f.png')}}">
                              </div>
                              <div class="content col-md-10">
                                  <div class="title">
                                      Đảm bảo sự hài lòng của khách hàng
                                  </div>
                                  <div class="des">
                                      Với phương châm sự hài lòng của bạn là thành công của chúng tôi. Đó cũng là động lực lớn nhất cho sự phát triển của nha trang home
                                  </div>
                              </div>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <div class="block-daily-deals style1">
          <div class="container">
              <div class="title-of-section">Quy trình</div>
              <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="true" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:2}}">
                  @foreach($projects as $project)
                  <div class="nt-prequal-elemoject equal-elem">
                      <a href="{{ $project->getUrl() }}">
                          <div class="nt-project-inner">
                              <div class="thumb" style="background-image: url({{ $project->getImage() }})"></div>
                              <div class="content">
                                  {{ $project->title }}
                              </div>
                          </div>
                      </a>
                  </div>
                  @endforeach
              </div>
          </div>
      </div>
      <div  class="block-section-4" style="background-color: #af1f43">
          <div class="container">
          <div class="wap_item">
              <div class="grid_quytrinh">
                  <div class="box__quytrinh wow bounceInLeft animated" id="" data-wow-delay="0.1s" style="visibility: visible; animation-delay: 0.1s; animation-name: bounceInLeft;">
                      <div class="img middle">
                          <div class="baophu ">
                              <p>01</p>
                              <a href="{{ url('/len-y-tuong-thiet-ke.html') }}">LÊN Ý TƯỞNG THIẾT KẾ</a>
                          </div>
                      </div>
                  </div>
                  <div class="box__quytrinh wow bounceInLeft animated" id="box__quytrinh" data-wow-delay="0.2s" style="visibility: visible; animation-delay: 0.2s; animation-name: bounceInLeft;">
                      <div class="img middle">
                          <div class="baophu ">
                              <p>02</p>
                              <a href="{{ url('/khao-sat-cong-trinh-can-thiet-ke.html') }}">KHẢO SÁT CÔNG TRÌNH CẦN THIẾT KẾ</a>
                          </div>
                      </div>
                  </div>
                  <div class="box__quytrinh wow bounceInLeft animated" id="" data-wow-delay="0.3s" style="visibility: visible; animation-delay: 0.3s; animation-name: bounceInLeft;">
                      <div class="img middle">
                          <div class="baophu ">
                              <p>03</p>
                              <a href="{{ url('/thiet-ke-so-bo-kien-truc-noi-that.html') }}">THIẾT KẾ SƠ BỘ KIẾN TRÚC NỘI THẤT</a>
                          </div>
                      </div>
                  </div>
                  <div class="box__quytrinh wow bounceInLeft animated" id="box__quytrinh" data-wow-delay="0.4s" style="visibility: visible; animation-delay: 0.4s; animation-name: bounceInLeft;">
                      <div class="img middle">
                          <div class="baophu ">
                              <p>04</p>
                              <a href="{{ url('/thi-cong-noi-that.html') }}">THI CÔNG NỘI THẤT</a>
                          </div>
                      </div>
                  </div>
                  <div class="box__quytrinh wow bounceInLeft animated" id="" data-wow-delay="0.5s" style="visibility: visible; animation-delay: 0.5s; animation-name: bounceInLeft;">
                      <div class="img middle">
                          <div class="baophu ">
                              <p>05</p>
                              <a href="{{ url('/nghiem-thu-cong-trinh-thi-cong.html') }}">NGHIỆM THU CÔNG TRÌNH THI CÔNG</a>
                          </div>
                      </div>
                  </div>

              </div>
          </div>
          </div>
      </div>
      <div class="block-section-4">
              <div class="container">
                  <div class="title-of-section">Sản phẩm</div>
                  <div class="tab-product tab-product-fade-effect">
                      <ul class="box-tabs nav-tab">
                          <li class="active"><a data-animated="" data-toggle="tab" href="#tab-1" aria-expanded="true">Tát cả sản phẩm </a></li>
                          @php
                            $i = 0;
                          @endphp
                          @foreach($data as $category)
                              @if(count($category->productDescription))
                                  <li class="{{ ($i==0) ? '' : '' }}"><a data-animated="" data-toggle="tab" href="#tab-{{ $category->id }}" aria-expanded="false">{{ $category->title }}</a></li>
                                  @php
                                      $i++;
                                  @endphp
                              @endif
                          @endforeach
                      </ul>
                      <div class="tab-content">
                          <div class="tab-container">
                              <div id="tab-1" class="tab-panel active">
                                  <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="false" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;480&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}}">
                                      @foreach($products as $key => $product_item)
                                          <div class="product-item style1" style="">
                                              <div class="product-inner equal-elem"  data-aos="fade-up" data-aos-delay="{{ $key*100 }}">
                                                  <div class="product-thumb">
                                                      <div class="thumb-inner" style="background-image: url({{asset($product_item->getThumb())}})">
                                                      </div>
                                                      <a href="#" class="quick-view">Quick View</a>
                                                  </div>
                                                  <div class="product-innfo">
                                                      <div class="product-name">
                                                          <a href="{{ $product_item->getUrl() }}">
                                                              {{$product_item->name}}
                                                          </a>
                                                      </div>
                                                      <span class="price">
                                                      {!! $product_item->showPrice() !!}
                                                          {{--                                                        <ins>$229.00</ins>--}}
                                                    </span>
                                                      @if ($product_item->allowSale())
                                                          <div class="group-btn-hover">
                                                              <div class="inner">
                                                                  <a href="{{ $product_item->getUrl() }}" class="add-to-cart">Chi tiết</a>
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
                                  $j = 0;
                              @endphp
                              @foreach($data as $key => $category)
                                  @if(count($category->productDescription))
                                      <div id="tab-{{ $category->id }}" class="tab-panel {{ ($j==0) ? '' : '' }}">
                                  <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="false" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;480&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:3},&quot;992&quot;:{&quot;items&quot;:4},&quot;1200&quot;:{&quot;items&quot;:4}}">
                                      @foreach($category->productDescription as $product)
                                          <div class="product-item style1" style="">
                                          <div class="product-inner equal-elem">
                                              <div class="product-thumb">
                                                  <div class="thumb-inner">
                                                      <a href="{{ $product->getUrl() }}"><img src="{{ $product->getThumb() }}" alt="p7"></a>
                                                  </div>
                                                  <a href="{{ $product->getUrl() }}" class="quick-view">Quick View</a>
                                              </div>
                                              <div class="product-innfo">
                                                  <div class="product-name">
                                                      <a href="{{ $product->getUrl() }}">
                                                          @foreach($product->descriptions as $descriptionp)
                                                              {{ ($descriptionp->lang == sc_get_locale()) ? $descriptionp->name : '' }}
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
                      <a class="banner-link" href="{{ asset('/product') }}">Xem thêm</a>
                  </div>
              </div>
          </div>
      </div>
      <div class="block-daily-deals style1">
          <div class="container">
              <div class="title-of-section">Tin tức</div>
              <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="true" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;500&quot;:{&quot;items&quot;:2},&quot;768&quot;:{&quot;items&quot;:2},&quot;992&quot;:{&quot;items&quot;:3}}">
                  @foreach ($blogs as $blogDetail)
                  <div class="post-item"  data-aos="fade-up" data-aos-delay="{{ $key*100 }}">
                      <div class="post-thumb">
                        <img src="{{ $blogDetail->getThumb() }}" alt="">
                          <span class="date">{{ $blogDetail->created_at->format('d')}}<span>{{ $blogDetail->created_at->format('M')}}</span></span>
                      </div>
                      <div class="post-item-info equal-elem">
                          <h3 class="post-name ">
                              <a href="{{ $blogDetail->getUrl() }}">{{ $blogDetail->title }}</a>
                          </h3>
                          <div class="post-metas">
                          </div>
                          <div class="post-content">
                              <p>  {{ mb_strlen( strip_tags($blogDetail->description ) ) > 150 ? mb_substr(strip_tags($blogDetail->description ), 0, 150) . ' ...' : strip_tags($blogDetail->description ) }}</p>
                          </div>
                      </div>
                      <a href="{{ $blogDetail->getUrl() }}" class="read-more">Xem thêm</a>
                  </div>
                  @endforeach
              </div>
          </div>

      </div>
      {{-- <div class="block-section-4">
          <div class="container">
              <div class="title-of-section">Đói tác</div>
              <div class="owl-carousel nav-style2 border-background equal-container owl-theme owl-loaded" data-nav="true" data-autoplay="false" data-dots="false" data-loop="true" data-margin="30" data-responsive="{&quot;0&quot;:{&quot;items&quot;:2},&quot;500&quot;:{&quot;items&quot;:3},&quot;768&quot;:{&quot;items&quot;:4},&quot;992&quot;:{&quot;items&quot;:5}}">
                  @foreach($partners as $partner)
                      <img src="{{ $partner->getImage() }}" alt="{{ $partner->html }}" title="{{ $partner->html }}">
                  @endforeach
              </div>
          </div>

      </div> --}}
  </main>
@endsection



@push('styles')
      {{-- style css --}}
@endpush

@push('scripts')
      {{-- script --}}
@endpush