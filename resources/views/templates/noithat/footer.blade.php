<!--Footer-->

<!--Module top footer -->
  @isset ($blocksContent['footer'])
      @foreach ( $blocksContent['footer']  as $layout)
        @php
          $arrPage = explode(',', $layout->page)
        @endphp
        @if ($layout->page == '*' ||  (isset($layout_page) && in_array($layout_page, $arrPage)))
          @if ($layout->type =='html')
            {!! $layout->text !!}
          @elseif($layout->type =='view')
            @if (view()->exists('blockView.'.$layout->text))
             @include('blockView.'.$layout->text)
            @endif
          @endif
        @endif
      @endforeach
  @endisset
<!--//Module top footer -->
<footer class="site-footer footer-opt-2">

  <div class="footer-column equal-container">
    <div class="container">
      <div class="row">
        <div class="col-md-4 col-sm-6 equal-elem" style="height: 281px;">
          <div class="logo">
            <a href="{{ route('home') }}">
              <img src="{{ asset(sc_store('logofooter')) }}" alt="logo" style="max-width: 200px;" loading="lazy">
            </a>
          </div>
        </div>
        <div class="col-md-2 col-sm-6 equal-elem">
          <div class="links">
            <h3 class="title-of-section">Tài khoản</h3>
            <ul>
              <li><a href="{{ route('login') }}">Đăng ký/Đăng nhập</a></li>
              <li><a href="{{ route('product.all') }}">Sản phẩm</a></li>
              <li><a href="{{ route('cart') }}">Giỏ hàng</a></li>
            </ul>
          </div>
        </div>
        <div class="col-md-2 col-sm-6 equal-elem">
          <div class="links">
            <h3 class="title-of-section">Menu</h3>
            <ul>
              @if (!empty($layoutsUrl['menu']))
                @foreach ($layoutsUrl['menu'] as $url)
                  <li class="nav-item">
                    <a class="nav-link" {{ ($url->target =='_blank')?'target=_blank':''  }}
                    href="{{ sc_url_render($url->url) }}">{{ sc_language_render($url->name) }}</a>
                  </li>
                @endforeach
              @endif
            </ul>
          </div>
        </div>
        <div class="col-md-4 col-sm-6 equal-elem" style="height: 248px;">
          <div class="links">
            <h3 class="title-of-section">Về chúng tôi</h3>
            <div class="contacts">
              <span class="contacts-info flaticon-localization">{{ trans('front.shop_info.address') }}: {{ sc_store('address') }}</span>
              <span class="contacts-info flaticon-telephone">{{ trans('front.shop_info.hotline') }}: {{ sc_store('long_phone') }}</span>
              <span class="contacts-info flaticon-envelope-of-white-paper">{{ trans('front.shop_info.email') }}: {{ sc_store('email') }}</span>
              <div class="socials">
                <a href="#" class="social"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                <a href="#" class="social"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                <a href="#" class="social"><i class="fa fa-pinterest" aria-hidden="true"></i></a>
                <a href="#" class="social"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                <a href="#" class="social"><i class="fa fa-vimeo" aria-hidden="true"></i></a>
                <a href="#" class="social"><i class="fa fa-youtube" aria-hidden="true"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <div class="copyright full-width">
    <div class="container">
      <style>
        a:hover {
          color: #fbb22f;
        }
      </style>
      <div class="copyright-right">
        © Copyright {{ date('Y') }}<span> Anh An Phú </span>. All Rights Reserved. <br>
        Powered by <a href="https://kennatech.vn">Kennatech - IT Team</a></div>
      </div>

    </div>
  </div>
</footer>
<!--//Footer-->
