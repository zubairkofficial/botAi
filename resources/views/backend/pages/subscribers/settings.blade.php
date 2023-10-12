@extends('backend.layouts.master')

@section('title')
    {{ localize('Subscriptions Settings') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('contents')
    <section class="tt-section pt-4">
        <div class="container">


            <div class="row mb-4">
                <div class="col-12">
                    <div class="tt-page-header">
                        <div class="d-lg-flex align-items-center justify-content-lg-between">
                            <div class="tt-page-title mb-3 mb-lg-0">
                                <h1 class="h4 mb-lg-1">{{ localize('Subscriptions Settings') }}</h1>
                                <ol class="breadcrumb breadcrumb-angle text-muted">
                                    <li class="breadcrumb-item"><a
                                            href="{{ route('writebot.dashboard') }}">{{ localize('Dashboard') }}</a>
                                    </li>
                                    <li class="breadcrumb-item">{{ localize('Subscriptions Settings') }}</li>
                                </ol>
                            </div>
                            <div class="tt-action">
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4 pb-650">
                <!--left sidebar-->
                <div class="col-xl-9 order-2 order-md-2 order-lg-2 order-xl-1">                   
                
                        <!--balance carry forward-->
                        <div class="card mb-4" id="section-1">
                            <div class="card-body">
                            <h5 class="mb-4">{{ localize('Balance Carry Forward') }}</h5>
                                <div class="mb-3">
                                    <div class="form-check tt-checkbox">
                                        <label for="carry_forward" class="form-check-label fw-medium ">
                                            <input class="form-check-input cursor-pointer subcriptionSettings"
                                                data-type="carry_forward" onchange="updateStatus(this)" type="checkbox"
                                                id="carry_forward"
                                                {{ getSetting('carry_forward') == 1 ? 'checked' : '' }}>
                                            <strong>{{ localize('Balance Carry Forward: ') }}</strong>
                                            {{ localize('Remaining balance from active package(only for active) will be added to next package balance.') }}
                                        </label>
                                        {{ localize('This service is applicable for same package - Lifetime to Lifetime, Yearly to Yearly, Monthly to Monthly and Prepaid to Prepaid pacakge.') }}
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--balance carry forward-->

                  
                    
                        <!--starter pacakge-->
                        <div class="card mb-4" id="section-2">
                            <div class="card-body">
                                <h5 class="mb-4">{{ localize('New package Purchase Settigns') }}</h5>

                                <div class="mb-3">
                                    <div class="form-check tt-checkbox">
                                        <label for="new_package_purchase" class="form-check-label fw-medium ">
                                            <input class="form-check-input cursor-pointer subcriptionSettings"
                                                data-type="new_package_purchase" onchange="updateStatus(this)" type="checkbox"
                                                id="new_package_purchase"
                                                {{ getSetting('new_package_purchase') == 1 ? 'checked' : '' }}>
                                            <strong>{{ localize('Auto Activated New package Exire Old Package: ') }}</strong>
                                            {{ localize('if enable, running package expire when purchase to new package') }}
                                        </label>
                                       
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!--starter pacakge-->

                  
                </div>

                <!--right sidebar-->
                <div class="col-xl-3 order-1 order-md-1 order-lg-1 order-xl-2">
                    <div class="card tt-sticky-sidebar">
                        <div class="card-body">
                            <h5 class="mb-4">{{ localize('Configure Subscriptions Settings') }}</h5>
                            <div class="tt-vertical-step">
                                <ul class="list-unstyled">
                                    
                                    <li>
                                        <a href="#section-1" class="active">{{ localize('Balance Carry Forward') }}</a>
                                    </li>
                                    <li>
                                        <a href="#section-2">{{ localize('New Package Purchase Settigns') }}</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection

@section('scripts')
    <script>
        "use strict";       

        function updateStatus(el) {
            let type = $(el).data('type');
            if (el.checked) {
                var is_active = 1;
            } else {
                var is_active = 0;
            }

            $.post('{{ route('admin.subscription-settings.store') }}', {
                    _token: '{{ csrf_token() }}',
                    is_active: is_active,
                    type: type,

                },
                function(data) {
                    if (data == 1) {
                        notifyMe('success', '{{ localize('Status updated successfully') }}');
                    } else {
                        notifyMe('danger', '{{ localize('Something went wrong') }}');
                    }
                });
        }
    </script>
@endsection
