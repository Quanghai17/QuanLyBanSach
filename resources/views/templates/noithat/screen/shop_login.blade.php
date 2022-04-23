@php
/*
$layout_page = shop_auth
*/
@endphp

@extends($templatePath.'.layout')

@section('main')

<main class="page-section inner-page-sec-padding-bottom">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-xs-12 col-lg-6 mb--30 mb-lg--0">
                <form action="#">
                    <div class="signup-form">
                        <!--sign up form-->
                        @include($templatePath . '.auth.register')
                    </div>
                    <!--/sign up form-->
                </form>
            </div>
            <div class="col-sm-12 col-md-12 col-lg-6 col-xs-12">
                <form action="https://template.hasthemes.com/pustok/pustok/">
                    <div class="login-form">
                        <!--login form-->
                        @include($templatePath . '.auth.login')
                    </div>
                    <!--/login form-->
                </form>
            </div>
        </div>
    </div>
</main>
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