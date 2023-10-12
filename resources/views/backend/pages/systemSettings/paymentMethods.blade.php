@extends('backend.layouts.master')

@section('title')
    {{ localize('Payment Methods Settings') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('contents')
    <section class="tt-section pt-4">
        <div class="container">

            <div class="row mb-4">
                <div class="col-12">
                    <div class="tt-page-header">
                        <div class="d-lg-flex align-items-center justify-content-lg-between">
                            <div class="tt-page-title mb-3 mb-lg-0">
                                <h1 class="h4 mb-lg-1">{{ localize('Payment Methods Settings') }}</h1>
                                <ol class="breadcrumb breadcrumb-angle text-muted">
                                    <li class="breadcrumb-item"><a
                                            href="{{ route('writebot.dashboard') }}">{{ localize('Dashboard') }}</a>
                                    </li>
                                    <li class="breadcrumb-item">{{ localize('Payment Methods Settings') }}</li>
                                </ol>
                            </div>
                            <div class="tt-action">
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4">

                {{-- paypal --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasPaypal">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid" src="{{ staticAsset('backend/assets/img/payments/paypal.svg') }}"
                                    alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_paypal') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- stripe --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasStripe">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid" src="{{ staticAsset('backend/assets/img/payments/stripe.svg') }}"
                                    alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_stripe') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- paytm --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasPaytm">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid" src="{{ staticAsset('backend/assets/img/payments/paytm.svg') }}"
                                    alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_paytm') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- razorpay --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasRazorpay">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid" src="{{ staticAsset('backend/assets/img/payments/razorpay.svg') }}"
                                    alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_razorpay') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- iyzico --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasIyzico">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid" src="{{ staticAsset('backend/assets/img/payments/iyzico.svg') }}"
                                    alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_iyzico') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- paystack --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasPaystack">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid" src="{{ staticAsset('backend/assets/img/payments/paystack.svg') }}"
                                    alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_paystack') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- flutterwave --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasFlutterwave">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid"
                                    src="{{ staticAsset('backend/assets/img/payments/flutterwave.svg') }}"
                                    alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_flutterwave') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- duitku --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasDuitku">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid" src="{{ staticAsset('backend/assets/img/payments/duitku.svg') }}"
                                    alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_duitku') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- yookassa --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasYookassa">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid"
                                    src="{{ staticAsset('backend/assets/img/payments/yookassa.svg') }}" alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_yookassa') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>


                {{-- molile --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasMolile">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid" src="{{ staticAsset('backend/assets/img/payments/molile.svg') }}"
                                    alt="molile" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_molile') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- mercadopago --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasMercadopago">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid"
                                    src="{{ staticAsset('backend/assets/img/payments/mercadopago.svg') }}"
                                    alt="mercadopago" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_mercadopago') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>

                {{-- midtrans --}}
                <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasMidtrans">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid"
                                    src="{{ staticAsset('backend/assets/img/payments/midtrans.svg') }}" alt="midtrans" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_midtrans') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div>
                                   
                 {{-- freekassa --}}
                 {{-- <div class="col-lg-3 col-md-6">
                    <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                        data-bs-toggle="offcanvas" data-bs-target="#offcanvasFreekassa">
                        <div class="card-body tt-payment-info">
                            <div class="d-flex align-items-center justify-content-between">
                                <img class="img-fluid"
                                    src="{{ staticAsset('backend/assets/img/payments/freekassa.png') }}" alt="avatar" />
                                <div class="form-check form-switch mb-0">
                                    <input type="checkbox" class="form-check-input"
                                        @if (getSetting('enable_freekassa') == 1) checked @endif>
                                </div>
                            </div>
                            <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                            </div>
                        </div>
                    </div>
                </div> --}}
            </div>

            {{-- offline --}}
            <div class="mt-5">
                <h4>{{ localize('Offline Payment Method') }}</h4>
                <div class="row g-4">
                    <div class="col-lg-3 col-md-6">
                        <div class="tt-payment-gateway rounded-3 shadow-sm card border-0 h-100 flex-column cursor-pointer"
                            data-bs-toggle="offcanvas" data-bs-target="#offcanvasOffline">
                            <div class="card-body tt-payment-info">
                                <div class="d-flex align-items-center justify-content-between">
                                    <img class="img-fluid" src="{{ uploadedAsset(getSetting('offline_image')) }}"
                                        alt="offline" />
                                    <div class="form-check form-switch mb-0">
                                        <input type="checkbox" class="form-check-input"
                                            @if (getSetting('enable_offline') == 1) checked @endif>
                                    </div>
                                </div>
                                <div class="tt-payment-setting position-absolute btn rounded-pill btn-light">
                                    {{ localize('Settings') }}<i data-feather="arrow-right" class="ms-1"></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    {{-- payment form --}}
    @include('backend.pages.systemSettings.paymentForm.paypal')
    @include('backend.pages.systemSettings.paymentForm.stripe')
    @include('backend.pages.systemSettings.paymentForm.paytm')
    @include('backend.pages.systemSettings.paymentForm.razorpay')
    @include('backend.pages.systemSettings.paymentForm.iyzico')
    @include('backend.pages.systemSettings.paymentForm.paystack')
    @include('backend.pages.systemSettings.paymentForm.flutterwave')
    @include('backend.pages.systemSettings.paymentForm.duitku')
    @include('backend.pages.systemSettings.paymentForm.yookassa')
    @include('backend.pages.systemSettings.paymentForm.freekassa')
    @include('backend.pages.systemSettings.paymentForm.molile')
    @include('backend.pages.systemSettings.paymentForm.mercadopago')
    @include('backend.pages.systemSettings.paymentForm.midtrans')
    @include('backend.pages.systemSettings.paymentForm.offline')
@endsection



@section('scripts')
    <script>
        "use strict";
        // runs when the document is ready --> for media files
        $(document).ready(function() {
            getChosenFilesCount();
            showSelectedFilePreviewOnLoad();
        });
    </script>
@endsection
