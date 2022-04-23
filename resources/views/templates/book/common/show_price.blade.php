
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
        <span class="">{!! trans('product.price_group') !!}</span>
        @break
    @default
        @if ($price == $priceFinal)
            <span >{!! sc_currency_render($price) !!}</span>
        @else
            <ins >{!! sc_currency_render($priceFinal) !!}</ins><del >{!!  sc_currency_render($price) !!}</del>
        @endif
        
@endswitch