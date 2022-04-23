@php
$productPromotion = $modelProduct->getProductPromotion()->setRandom()->setLimit(1)->getData()
@endphp

@if (!empty($productPromotion))
    <div class="block-latest-roducts">
        <div class="block-title">{{ trans('front.products_special') }}</div>
        <div class="block-latest-roducts-content">
            <div class="owl-carousel nav-style2 owl-theme owl-loaded" data-nav="false" data-autoplay="false" data-dots="false" data-loop="false" data-margin="0" data-responsive="{&quot;0&quot;:{&quot;items&quot;:1},&quot;600&quot;:{&quot;items&quot;:1},&quot;1000&quot;:{&quot;items&quot;:1}}">
                <div class="owl-ones-row">
                    @foreach ($productPromotion as $key => $product)
                    <div class="product-item style1">
                        <div class="product-inner">
                            <div class="product-thumb">
                                <div class="thumb-inner">
                                    <a href="{{ $product->getUrl() }}"><img src="{{ asset($product->getThumb()) }}" alt="{{ $product->name }}" /></a>
                                </div>
                            </div>
                            <div class="product-innfo">
                                <div class="product-name"><a href="{{ $product->getUrl() }}"><p>{{ $product->name }}</p></a></div>
                                <span class="price">

                                                            {!! $product->showPrice() !!}

                                                        </span>
                            </div>
                        </div>
                    </div>
                        @endforeach
                </div>
            </div>
        </div>
    </div>
@endif
