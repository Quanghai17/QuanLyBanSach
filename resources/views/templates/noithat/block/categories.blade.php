  @php
    $categories = $modelCategory->start()->getList(['status' => 1]);
    $categoriesTop = $modelCategory->start()->getCategoryTop()->getData();
  @endphp

  <div class="filter-options">
      <div class="block-content">
          <div class="filter-options-item filter-categori">
              <div class="filter-options-title">{{ trans('front.categories') }}</div>
              <div class="filter-options-content">
                  <ul>
                      @foreach ($categoriesTop as $key => $category)
                      <li><label class="inline"><a href="{{ $category->getUrl() }}"> {{ $category->title }}</a>
                          </label></li>
                      @endforeach
                  </ul>
              </div>
          </div>
      </div>
  </div>

