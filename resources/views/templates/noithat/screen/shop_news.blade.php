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
<section >
<div class="container">
    <div class="row">
            <div class="main-content">
                <div class="post-grid post-items">
    @foreach ($news as $newsDetail)
        <div class="post-grid-item col-md-4">
        <div class="post-item">
            <div class="post-thumb">
                <a href="#"><img src="{{ asset($newsDetail->getThumb()) }}" alt="{{ $newsDetail->title }}" alt="post-image-5"></a>
                <span class="date">{{ $newsDetail->created_at->format('d')}}<span>{{ $newsDetail->created_at->format('M')}}</span></span>
            </div>
            <div class="post-item-info">
                <h3 class="post-name"><a href="{{ $newsDetail->getUrl() }}">{{ $newsDetail->title }}</a>
                </h3>
                <div class="post-metas">
                </div>
                <div class="post-content">
                    <p>{{ $newsDetail->description }}</p>
                    <a href="{{ $newsDetail->getUrl() }}" class="read-more">Xem thêm</a>
                </div>
        </div>
        </div>
    @endforeach
            </ul>
            <div class="sortPagiBar">
              <div class="pagination-area " >
                    {{ $news->links() }}
              </div>
            </div>
        </div>
      <!-- ./row-->
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