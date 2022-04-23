@php
/*
$layout_page = news_list
$news: paginate
Use paginate: $news->appends(request()->except(['page','_token']))->links()
$products: paginate
Use paginate: $products->appends(request()->except(['page','_token']))->links()
*/
@endphp

@extends($templatePath.'.layout')

@section('main')
    <section>
        <section class="breadcrumb-section">
            <h2 class="sr-only">Site Breadcrumb</h2>
            <div class="container">
                <div class="breadcrumb-contents">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                            <li class="breadcrumb-item active">Blog</li>
                        </ol>
                    </nav>
                </div>
            </div>
        </section>
        <section class="inner-page-sec-padding-bottom space-db--30">
            <div class="container">
                <div class="row space-db-lg--60 space-db--30">
                  @foreach ($news as $newsDetail)
                    <div class="col-lg-4 col-md-6 mb-lg--60 mb--30">
                        <div class="blog-card card-style-grid">
                            <a href="blog-details.html" class="image d-block">
                                <img src="{{ asset($newsDetail->getThumb()) }}" alt="">
                            </a>
                            <div class="card-content">
                                <h3 class="title"><a href="blog-details.html">{{ $newsDetail->title }}</a></h3>
                                <p class="post-meta"><span>{{ $newsDetail->created_at->format('d') }}</span> | <a href="#">Hastech</a></p>
                                <article>
                                    <h2 class="sr-only">
                                        Blog Article
                                    </h2>
                                    <p>{{ $newsDetail->description }}
                                    </p>
                                    <a href="blog-details.html" class="blog-link">Read More</a>
                                </article>
                            </div>
                        </div>
                    </div>
                    @endforeach
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
