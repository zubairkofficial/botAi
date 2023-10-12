@extends('backend.layouts.master')


@section('title')
    {{ localize('Custom Templates') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection


@section('contents')
    <section class="tt-section pt-4">
        <div class="container">
            <div class="row mb-4">
                <div class="col-12">
                    <div class="tt-page-header">
                        <div class="d-lg-flex align-items-center justify-content-lg-between">
                            <div class="tt-page-title mb-3 mb-lg-0">
                                <h1 class="h4 mb-lg-1">{{ localize('All Templates') }}</h1>
                                <ol class="breadcrumb breadcrumb-angle text-muted">
                                    <li class="breadcrumb-item"><a
                                            href="{{ route('writebot.dashboard') }}">{{ localize('Dashboard') }}</a>
                                    </li>
                                    <li class="breadcrumb-item">{{ localize('Custom Templates') }}</li>
                                </ol>
                            </div>
                            <div class="tt-action">
                                <a href="{{ route('custom.templates.create') }}" class="btn btn-primary"><i
                                        data-feather="plus"></i> {{ localize('Add Custom Template') }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


            <div class="row mb-3 g-3">
                <div class="col-xl-12">
                    <div class="card h-100 bg-secondary-subtle">
                        <div class="card-header sticky-top-card bg-secondary py-lg-5 py-4">
                            <!-- template search -->
                            <form action="{{ Request::fullUrl() }}" method="GET">
                                <div class="row justify-content-center">
                                    <div class="col-lg-6 col-md-8">
                                        <div class="input-group">
                                            <input type="search"
                                                placeholder="{{ localize('Search template that you are looking for') }}..."
                                                name="search"
                                                @isset($searchKey)
                                    value="{{ $searchKey }}"
                                @endisset
                                                class="form-control border border-2 border-primary rounded-pill rounded-end">
                                            <div class="input-group-append">
                                                <button type="submit"
                                                    class="btn btn-link bg-primary border border-2 border-primary text-light rounded-pill rounded-start"><i
                                                        class="flaticon-search translate-middle-y"></i>{{ localize('Search Now') }}</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>

                            <ul class="nav nav-pills d-flex justify-content-center tt-horizontal-tab mt-3" id="pills-tab"
                                role="tablist">

                                <li class="nav-item mb-2" role="presentation">
                                    <a class="nav-link rounded-pill active" id="tabId-all"data-bs-toggle="pill"
                                        data-bs-target="#all-tab" type="button" role="tab" aria-controls="all-tab"
                                        aria-selected="true" href="#">
                                        <i data-feather="book" class="me-1 icon-16"></i> {{ localize('All Templates') }}
                                    </a>
                                </li>

                                @foreach ($categories as $category)
                                    <li class="nav-item mb-2" role="presentation">
                                        <a class="nav-link rounded-pill" id="tabId-{{ $category->slug }}"
                                            data-bs-toggle="pill" data-bs-target="#tab-{{ $category->slug }}"
                                            type="button" role="tab" aria-controls="tab-{{ $category->slug }}"
                                            aria-selected="true" href="#">
                                            {!! $category->icon !!}
                                            {{ $category->collectLocalization('name') }}</a>
                                    </li>
                                @endforeach
                            </ul>
                        </div>

                        @if (count($templates) > 0)
                            <div class="tab-content card-body" id="pills-tabContent">
                                <div class="tab-pane fade show active" id="all-tab" role="tabpanel"
                                    aria-labelledby="tabId-all" tabindex="0">
                                    <div class="row g-3">

                                        @foreach ($templates as $template)
                                            <div class="col-lg-3 col-sm-6">
                                                @include(
                                                    'backend.pages.templates.inc.custom-template-card',
                                                    [
                                                        'template' => $template,
                                                    ]
                                                )
                                            </div>
                                        @endforeach
                                    </div>
                                </div>


                                <!-- loop -->
                                @foreach ($categories as $category)
                                    <div class="tab-pane fade" role="tabpanel"
                                        aria-labelledby="tabId-{{ $category->slug }}" id="tab-{{ $category->slug }}">
                                        <div class="row g-3">
                                            @foreach ($templates as $template)
                                                @if ($template->custom_template_category_id == $category->id)
                                                    <div class="col-lg-3 col-sm-6">
                                                        @include(
                                                            'backend.pages.templates.inc.custom-template-card',
                                                            [
                                                                'template' => $template,
                                                            ]
                                                        )
                                                    </div>
                                                @endif
                                            @endforeach
                                        </div>
                                    </div>
                                @endforeach

                            </div>
                        @else
                            <div class="text-center text-danger my-5">
                                <img src="{{ staticAsset('backend/assets/img/nodata.png') }}" alt=""
                                    class="img-fluid w-25">
                            </div>
                        @endif
                    </div>
                </div>
            </div>

        </div>
    </section>
@endsection

@section('scripts')
    @include('backend.pages.templates.inc.template-scripts')
@endsection
