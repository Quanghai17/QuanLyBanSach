
@php
/*
This view use render price
$price
$priceFinal
$kind
*/
@endphp

@switch($kind)
    @case(SC_PRODUCT_GROUP)
        <span class="sc-new-price">{!! trans('product.price_group') !!}</span>
        @break
    @default
        @if ($price == $priceFinal)
            <span class="sc-new-price">{!! sc_currency_render($price) !!}</span>
        @else
            <span class="sc-new-price">{!! sc_currency_render($priceFinal) !!}</span><span class="sc-old-price">{!!  sc_currency_render($price) !!}</span>
        @endif
        
@endswitch