@php
/*
$layout_page = shop_auth
*/
@endphp

@extends($templatePath.'.layout')

@section('main')

    <section id="form-login"><!--form-->
        <div class="container">
            <div class="row">
{{--                <h2 class="title text-center">{{ $title }}</h2>--}}
                <div class="col-sm-5 col-sm-offset-1">
                    <div class="login-form"><!--login form-->
                        @include($templatePath.'.auth.login')
                    </div><!--/login form-->
                </div>

                <div class="col-sm-1">
                </div>

                <div class="col-sm-5">
                    <div class="signup-form"><!--sign up form-->
                        @include($templatePath.'.auth.register')
                    </div><!--/sign up form-->
                </div>

            </div>
        </div>
    </section><!--/form-->
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