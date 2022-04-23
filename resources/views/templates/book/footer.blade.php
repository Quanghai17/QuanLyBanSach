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
<!--=================================
        Footer
        ===================================== -->
        <!-- Modal -->
        <footer class="site-footer">
          <div class="container">
              <div class="row justify-content-between  section-padding">
                  <div class=" col-xl-3 col-lg-4 col-sm-6">
                      <div class="single-footer pb--40">
                          <div class="brand-footer footer-title">
                            <img src="{{ asset($templateFile.'/image/logo--footer.png')}}">
                              <img src="asset/image/logo--footer.png" alt="">
                          </div>
                          <div class="footer-contact">
                              <p><span class="label">Địa Chỉ:</span><span class="text">{{ sc_store('address') }}</span></p>
                              <p><span class="label">Số Điện Thoại:</span><span class="text">{{ sc_store('long_phone') }}</span></p>
                              <p><span class="label">Email:</span><span class="text">{{ sc_store('email') }}</span></p>
                          </div>
                      </div>
                  </div>
                  <div class=" col-xl-3 col-lg-2 col-sm-6">
                      <div class="single-footer pb--40">
                          <div class="footer-title">
                              <h3>Thông Tin Về Chúng Tôi</h3>
                          </div>
                          <ul class="footer-list normal-list">
                              <li><a href="#">Giá Sản Phẩm</a></li>
                              <li><a href="#">Sản Phẩm Mới</a></li>
                              
                              <li><a href="#">Liên Hệ</a></li>
                             
                          </ul>
                      </div>
                  </div>
                  <div class=" col-xl-3 col-lg-2 col-sm-6">
                      <div class="single-footer pb--40">
                          <div class="footer-title">
                              <h3>Bổ Sung</h3>
                          </div>
                          <ul class="footer-list normal-list">
                            <li><a href="#">Tư Vấn Khách Hàng</a></li>
                            <li><a href="#">Đặt Mua Trực Tiêp</a></li>
                            
                            <li><a href="#">Chọn Sách</a></li>
                          </ul>
                      </div>
                  </div>
                  <div class=" col-xl-3 col-lg-4 col-sm-6">
                      <div class="footer-title">
                          <h3>Gửi Thông Tin Liên Hệ</h3>
                      </div>
                      <div class="newsletter-form mb--30">
                          <form action="https://template.hasthemes.com/pustok/pustok/php/mail.php">
                              <input type="email" class="form-control" placeholder="Enter Your Email Address Here...">
                              <button class="btn btn--primary w-100">Đăng Kí</button>
                          </form>
                      </div>
                      <div class="social-block">
                          <h3 class="title">Mạng Xã Hội</h3>
                          <ul class="social-list list-inline">
                              <li class="single-social facebook"><a href="#"><i class="ion ion-social-facebook"></i></a>
                              </li>
                              <li class="single-social twitter"><a href="#"><i class="ion ion-social-twitter"></i></a></li>
                              <li class="single-social google"><a href="#"><i
                                          class="ion ion-social-googleplus-outline"></i></a></li>
                              <li class="single-social youtube"><a href="#"><i class="ion ion-social-youtube"></i></a></li>
                          </ul>
                      </div>
                  </div>
              </div>
          </div>
          <div class="footer-bottom">
              <div class="container">
                  <p class="copyright-heading">Hãy hướng về phía mặt trời bạn sẽ không thể nhìn thấy bóng tối. Đó là những gì hoa hướng dương đang làm. - Helen Keller</p>
                  <a href="#" class="payment-block">
                      <img src="asset/image/icon/payment.png" alt="">
                      <img src="{{ asset($templateFile.'/image/payment.png')}}">
                  </a>
                  <p class="copyright-text">Copyright © 2021 <a href="#" class="author">Pustok</a>. All Right Reserved.
                      <br>
                      Design By Nguyen Quang Hai</p>
              </div>
          </div>
      </footer>
