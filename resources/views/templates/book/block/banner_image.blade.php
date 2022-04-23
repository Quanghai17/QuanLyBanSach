@php
$banners = $modelBanner
    ->start()
    ->getBanner()
    ->getData();
@endphp

@if (!empty($banners))
    <section class="hero-area hero-slider-1">
        <div class="sb-slick-slider" data-slick-setting='{
                    "autoplay": true,
                    "fade": true,
                    "autoplaySpeed": 3000,
                    "speed": 3000,
                    "slidesToShow": 1,
                    "dots":true
                    }'>
            @foreach ($banners as $key => $banner)
            @php
                $left = 'left';
                $right = 'right';
                if ($key % 2 != 0) {
                    $left = 'right';
                    $right = 'left';
                }
            @endphp
                <div class="single-slide bg-shade-whisper  ">
                    <div class="container">
                        <div class="home-content text-center text-sm-left position-relative">

                            <div class="hero-partial-image image-{{$right}}">
                                <img src="{{ asset($banner->image) }}" alt="">
                            </div>

                            <div class="row @if($key % 2 == 0) g-0 @else align-items-center justify-content-start justify-content-md-end @endif">
                                <div class="@if($key % 2 == 0) col-xl-6 col-md-6 col-sm-7 @else col-lg-6 col-xl-7 col-md-6 col-sm-7 @endif">
                                    <div class="home-content-inner content-{{$left}}-side text-start">
                                        <h1>{{$banner->html}}</h1>
                                        <h2> Tiền không mua cho bạn được hạnh phúc, nhưng nó làm cho sự nghèo khổ dễ chịu hơn .</h2>
                                        <a href="shop-grid.html" class="btn btn-outlined--primary">
                                            399.000 VNĐ Mua Ngay
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
            {{-- <div class="single-slide bg-ghost-white">
            <div class="container">
                <div class="home-content text-center text-sm-left position-relative">
                    @foreach ($banners as $key => $banner)
                    <div class="hero-partial-image image-left">
                        <img src="{{asset($banner->image)}}" alt="">
                    </div>
                    @endforeach
                    <div class="row ">
                        <div class="col-lg-6 col-xl-7 col-md-6 col-sm-7">
                            <div class="home-content-inner content-right-side text-start">
                                <h1>J.D. Kurtness <br>
                                    De Vengeance</h1>
                                <h2>Cover Up Front Of Books and Leave Summary</h2>
                                <a href="shop-grid.html" class="btn btn-outlined--primary">
                                    $78.09 - Learn More
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> --}}
        </div>
    </section>
@endif
