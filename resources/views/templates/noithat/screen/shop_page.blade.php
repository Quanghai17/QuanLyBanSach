@php
/*
$layout_page = shop_page
$page: no paginate
*/ 
@endphp

@extends($templatePath.'.layout')

@section('main')
<section >
  <div class="container">
      <div class="img-height-auto">
            <h2 class="title text-center">{{ $title }}</h2>
            {!! sc_html_render($page->content) !!}
    </div>
  </div>
</section>

@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection

@push('styles')
      {{-- style css --}}
@endpush

@push('scripts')
      {{-- script --}}
@endpush