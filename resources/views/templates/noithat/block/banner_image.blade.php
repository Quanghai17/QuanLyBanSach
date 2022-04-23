@php
  $banners = $modelBanner->start()->getBanner()->getData()
@endphp

 @if (!empty($banners))
     <div class="block-section-1">
         <div class="main-slide slide-opt-1 full-width">
             <div class="owl-carousel nav-style1 owl-theme owl-loaded" data-nav="true" data-autoplay="false" data-dots="false" data-loop="true" data-margin="0" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;600&quot;:{&quot;items&quot;:1},&quot;1000&quot;:{&quot;items&quot;:1}}">
                 @foreach ($banners as $key => $banner)
                 <div class="item-slide item-slide-2">
                     <img src="{{asset($banner->image)}}">
                     <div class="slide-desc slide-desc-2">
                         <div class="p-primary">{{$banner->html}}</div>
                         <a class="btn-shop-now" href="{{$banner->url}}">Xem thêm</a>
                     </div>
                 </div>
                 @endforeach
             </div>
         </div>
     </div>
@endif
