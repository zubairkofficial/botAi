@extends('backend.layouts.master')

@section('title')
{{ localize('Products Reviews') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection
@section('contents')
<section class="tt-section pt-4">
    <div class="container">
        <div class="row mb-4">
            <div class="col-12">
                <div class="tt-page-header">
                    <div class="d-lg-flex align-items-center justify-content-lg-between">
                        <div class="tt-page-title mb-3 mb-lg-0">
                            <h1 class="h4 mb-lg-1">{{ localize('Product Reviews') }}</h1>
                            <ol class="breadcrumb breadcrumb-angle text-muted">
                                <li class="breadcrumb-item"><a href="{{ route('writebot.dashboard') }}">{{
                                        localize('Dashboard') }}</a>
                                </li>
                                <li class="breadcrumb-item"><a href="{{ route('sacrapingReviews.index') }}">{{
                                        localize('Sacraping') }}</a>
                                </li>
                                <li class="breadcrumb-item">{{ localize('Product Reviews') }}</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        
        <div>
            <livewire:sacraping.product-sacraping-component />
        </div>
    </div>
</section>
@endsection