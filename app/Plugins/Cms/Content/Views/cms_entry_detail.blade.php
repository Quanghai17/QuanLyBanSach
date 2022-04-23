@extends($templatePath.'.layout')

@section('main')

<section >
    <div class="container">
        <div class="row">
            <div class="col-12">
                <h1 class="title-page-cms">{{ $title }}</h1>
            </div>
            <div class="col-12 new-detail">
                {!! sc_html_render($entry_currently->content) !!}
            </div>
        </div>
    </div>
</section>
@endsection

@section('breadcrumb')
    <div class="breadcrumbs">
        <ol class="breadcrumb">
          <li><a href="{{ route('home') }}">{{ trans('front.home') }}</a></li>
          <li><a href="{{ $entry_currently->category->getUrl() }}">{{ $entry_currently->category->getFull()->title }}</a></li>
          <li class="active">{{ $title }}</li>
        </ol>
      </div>
@endsection
