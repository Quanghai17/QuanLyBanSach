@extends($templatePath.'.layout')

@section('main')
<section >
<div class="container">
    <div class="row">
        <h2 class="title text-center">{{ $title }}</h2>
        <!-- Center colunm-->
          <div class="center_column">
            @if ($entries->count())
            <ul class="blog-posts">
              @foreach ($entries as $entryDetail)
                <div class="post-item col-md-6">
                  <article class="entry">
                    <div class="row">
                      <div class="col-md-6">
                        <div class="entry-thumb image-hover2"> <a href="{{ $entryDetail->getUrl() }}">
                          <figure><img src="{{ asset($entryDetail->getThumb()) }}" alt="{{ $entryDetail->title }}" alt="Blog"></figure>
                          </a> </div>
                      </div>
                      <div class="col-md-6">
                        <h4 class="entry-title"><a href="{{ $entryDetail->getUrl() }}">{{ $entryDetail->title }}</a></h4>
                        <div class="entry-meta-data"> <span class="author">  <span class="date">&nbsp; {{ $entryDetail->created_at }}</span> </div>
                        <div class="entry-excerpt">{{ $entryDetail->description }}</div>
                        <a href="{{ $entryDetail->getUrl() }}" class="button read-more">{{ trans('front.view_more') }}&nbsp; <i class="fa fa-angle-double-right"></i></a> </div>
                    </div>
                  </article>
                  <hr>
                </div>
              @endforeach
              </ul>
              <div class="sortPagiBar">
                <div class="pagination-area " >
                      {{ $entries->links() }}
                </div>
              </div>
            @else
            <ul class="blog-posts">
              <li class="post-item">
                Chưa có dữ liệu!
              </li>
            </ul>
            @endif

        </div>
      <!-- ./row-->
    </div>
  </section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">Home</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection
