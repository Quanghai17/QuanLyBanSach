@php
/*
$layout_page = shop_contact
*/
@endphp

@extends($templatePath.'.layout')

@section('main')
    <section class="breadcrumb-section">
        <h2 class="sr-only">Site Breadcrumb</h2>
        <div class="container">
            <div class="breadcrumb-contents">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="index.html">Trang Chủ</a></li>
                        <li class="breadcrumb-item active">Liên Hệ</li>
                    </ol>
                </nav>
            </div>
        </div>
    </section>
    <main class="contact_area inner-page-sec-padding-bottom">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div id="google-map">
                        <iframe
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d59363.224577584304!2d105.82183747654967!3d21.578054947565363!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31352738b1bf08a3%3A0x515f4860ede9e108!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBDw7RuZyBuZ2jhu4cgVGjDtG5nIHRpbiAmIFRydXnhu4FuIHRow7RuZyBUaMOhaSBOZ3V5w6pu!5e0!3m2!1svi!2s!4v1649407342871!5m2!1svi!2s"
                            width="1200" height="550" style="border:0;" allowfullscreen="" loading="lazy"
                            referrerpolicy="no-referrer-when-downgrade"></iframe>
                    </div>
                </div>
            </div>
            <div class="row mt--60 ">
                <div class="col-lg-5 col-md-5 col-12">
                    <div class="contact_adress">
                        <div class="ct_address">
                            <h3 class="ct_title">Sách Và Cuốc Sống</h3>
                            <p>Dù người ta có nói với bạn điều gì đi nữa, hãy tin rằng cuộc sống là điều kỳ diệu và đẹp đẽ
                            </p>
                        </div>
                        <div class="address_wrapper">
                            <div class="address">
                                <div class="icon">
                                    <i class="fas fa-map-marker-alt"></i>
                                </div>
                                <div class="contact-info-text">
                                    <p><span>Địa Chỉ Liên Hệ </span>{{ sc_store('address') }}</p>
                                </div>
                            </div>
                            <div class="address">
                                <div class="icon">
                                    <i class="far fa-envelope"></i>
                                </div>
                                <div class="contact-info-text">
                                    <p><span>Email: </span> {{ sc_store('email') }}</p>
                                </div>
                            </div>
                            <div class="address">
                                <div class="icon">
                                    <i class="fas fa-mobile-alt"></i>
                                </div>
                                <div class="contact-info-text">
                                    <p><span>{{ sc_store('long_phone') }}</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7 col-md-7 col-12 mt--30 mt-md--0">
                    <div class="contact-form">
                        <h2 class="title text-center">{{ trans('front.contact_form.title') }}</h2>
                        <form method="post" action="{{ route('contact.post') }}" class="contact-form">
                            {{ csrf_field() }}
                            <div id="contactFormWrapper" style="margin: 30px;">
                                <div class="row">
                                    <div class="col-md-12 col-xs-12">
                                        <div class="row">
                                            <div
                                                class="col-sm-4 form-group {{ $errors->has('name') ? ' has-error' : '' }}">
                                                <label>{{ trans('front.contact_form.name') }}:</label>
                                                <input type="text"
                                                    class="form-control {{ $errors->has('name') ? 'input-error' : '' }}"
                                                    name="name" placeholder="Tên..." value="{{ old('name') }}">
                                                @if ($errors->has('name'))
                                                    <span class="help-block">
                                                        {{ $errors->first('name') }}
                                                    </span>
                                                @endif
                                            </div>
                                            <div
                                                class="col-sm-4 form-group {{ $errors->has('email') ? ' has-error' : '' }}">
                                                <label>{{ trans('front.contact_form.email') }}:</label>
                                                <input type="email"
                                                    class="form-control {{ $errors->has('email') ? 'input-error' : '' }}"
                                                    name="email" placeholder="Email..." value="{{ old('email') }}">
                                                @if ($errors->has('email'))
                                                    <span class="help-block">
                                                        {{ $errors->first('email') }}
                                                    </span>
                                                @endif
                                            </div>
                                            <div
                                                class="col-sm-4 form-group {{ $errors->has('phone') ? ' has-error' : '' }}">
                                                <label>{{ trans('front.contact_form.phone') }}:</label>
                                                <input type="telephone"
                                                    class="form-control {{ $errors->has('phone') ? 'input-error' : '' }}"
                                                    name="phone" placeholder="Số điện thoại..."
                                                    value="{{ old('phone') }}">
                                                @if ($errors->has('phone'))
                                                    <span class="help-block">
                                                        {{ $errors->first('phone') }}
                                                    </span>
                                                @endif
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div
                                                class="col-sm-12 form-group {{ $errors->has('title') ? ' has-error' : '' }}">
                                                <label
                                                    class="control-label">{{ trans('front.contact_form.subject') }}:</label>
                                                <input type="text"
                                                    class="form-control {{ $errors->has('title') ? 'input-error' : '' }}"
                                                    name="title" placeholder="Yều cầu..." value="{{ old('title') }}">
                                                @if ($errors->has('title'))
                                                    <span class="help-block">
                                                        {{ $errors->first('title') }}
                                                    </span>
                                                @endif
                                            </div>
                                            <div
                                                class="col-sm-12 form-group {{ $errors->has('content') ? ' has-error' : '' }}">
                                                <label
                                                    class="control-label">{{ trans('front.contact_form.content') }}:</label>
                                                <textarea class="form-control {{ $errors->has('content') ? 'input-error' : '' }}" rows="5" cols="75" name="content"
                                                    placeholder="Nội dung...">{{ old('content') }}</textarea>
                                                @if ($errors->has('content'))
                                                    <span class="help-block">
                                                        {{ $errors->first('content') }}
                                                    </span>
                                                @endif

                                            </div>
                                        </div>
                                        <div class="btn-toolbar form-group">
                                            <input type="submit" value="{{ trans('front.contact_form.submit') }}"
                                                class="btn btn--primary w-20">
                                        </div>
                                    </div>
                                </div>
                            </div><!-- contactFormWrapper -->
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

   

    <!-- Main Container -->
    <div class="main-container col1-layout">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="page_content">


                    </div>
                </div>
            </div>
        </div>
    </div>
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
