@php
    $yearlyCounter = \App\Models\Subscriptionpackage::isActive()
        ->where('package_type', 'yearly')
        ->count();
    $lifetimeCounter = \App\Models\Subscriptionpackage::isActive()
        ->where('package_type', 'lifetime')
        ->count();
    $prepaidCounter = \App\Models\Subscriptionpackage::isActive()
        ->where('package_type', 'prepaid')
        ->count();
@endphp

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-6">
            <div class="tt-section-heading text-center mb-5">

                <h2 class="fw-bold fs-1 text-capitalize">{{ localize('Our Subscription Packages') }} <br>
                    <span class="tt-text-gradient-primary text-capitalize">{{ localize('Ready to get started?') }}</span>
                </h2>


                <ul class="list-unstyled list-inline tt-package-switch-list mt-4 z-2 position-relative" id="myTab"
                    role="tablist">
                    <li class="list-inline-item" role="presentation">
                        <input class="active" type="radio" name="tt-package-radio" id="tt-monthly"
                            data-bs-toggle="tab" data-bs-target="#tt-monthly-tab" role="tab"
                            aria-controls="tt-monthly" aria-selected="true" checked />
                        <label for="tt-monthly">{{ localize('Monthly') }}</label>
                    </li>

                    @if ($yearlyCounter > 0)
                        <li class="list-inline-item" role="presentation">
                            <input type="radio" name="tt-package-radio" id="tt-yearly" data-bs-toggle="tab"
                                data-bs-target="#tt-yearly-tab" role="tab" aria-controls="tt-yearly"
                                aria-selected="true" />
                            <label for="tt-yearly">{{ localize('Yearly') }}</label>
                        </li>
                    @endif

                    @if ($lifetimeCounter > 0)
                        <li class="list-inline-item" role="presentation">
                            <input type="radio" name="tt-package-radio" id="tt-lifetime" data-bs-toggle="tab"
                                data-bs-target="#tt-lifetime-tab" role="tab" aria-controls="home"
                                aria-selected="true" />
                            <label for="tt-lifetime">{{ localize('Lifetime') }}</label>
                        </li>
                    @endif

                    @if ($prepaidCounter > 0)
                        <li class="list-inline-item" role="presentation">
                            <input type="radio" name="tt-package-radio" id="tt-prepaid" data-bs-toggle="tab"
                                data-bs-target="#tt-prepaid-tab" role="tab" aria-controls="home"
                                aria-selected="true" />
                            <label for="tt-prepaid">{{ localize('Prepaid') }}</label>
                        </li>
                    @endif
                </ul>

            </div>
        </div>
    </div>

    <div class="row justify-content-center tab-content" id="myTabContent">
        <div class="col-lg-10 tab-pane fade show active" id="tt-monthly-tab" role="tabpanel"
            aria-labelledby="tt-monthly-tab">
            <div class="row g-3">
                @foreach ($packages as $package)
                    @if ($package->package_type == 'starter' || $package->package_type == 'monthly')
                        <div class="col-lg-4">
                            @include('frontend.default.pages.partials.home.pricing-card', [
                                'package' => $package,
                            ])
                        </div>
                    @endif
                @endforeach
            </div>
        </div>

        {{-- yearly tab --}}
        <div class="col-lg-10 tab-pane fade" id="tt-yearly-tab" role="tabpanel" aria-labelledby="tt-yearly-tab">
            <div class="row g-3">
                @foreach ($packages as $package)
                    @if ($package->package_type == 'yearly')
                        <div class="col-lg-4">
                            @include('frontend.default.pages.partials.home.pricing-card', [
                                'package' => $package,
                            ])
                        </div>
                    @endif
                @endforeach
            </div>
        </div>

        {{-- lifetime tab --}}
        <div class="col-lg-10 tab-pane fade" id="tt-lifetime-tab" role="tabpanel" aria-labelledby="tt-lifetime-tab">
            <div class="row g-3">
                @foreach ($packages as $package)
                    @if ($package->package_type == 'lifetime')
                        <div class="col-lg-4">
                            @include('frontend.default.pages.partials.home.pricing-card', [
                                'package' => $package,
                            ])
                        </div>
                    @endif
                @endforeach
            </div>
        </div>


        {{-- prepaid tab --}}
        <div class="col-lg-10 tab-pane fade" id="tt-prepaid-tab" role="tabpanel" aria-labelledby="tt-prepaid-tab">
            <div class="row g-3">
                @foreach ($packages as $package)
                    @if ($package->package_type == 'prepaid')
                        <div class="col-lg-4">
                            @include('frontend.default.pages.partials.home.pricing-card', [
                                'package' => $package,
                            ])
                        </div>
                    @endif
                @endforeach
            </div>
        </div>
    </div>
</div>

@section('modals-common')
    <!-- Modal -->
    <div class="modal fade" id="packagePaymentModal" tabindex="-1" aria-labelledby="packagePaymentModalLabel"
        aria-hidden="true">

        <div class="modal-dialog modal-lg modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="packagePaymentModalLabel">{{ localize('Select Payment Method') }}</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body p-4">

                    <form action="{{ route('website.subscriptions.subscribe') }}" method="POST" class="payment-method-form"
                        enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="package_id" value="" class="payment_package_id">
                        <!-- Online payment gateway -->
                        @auth
                            <div class="row g-3">
                                @if (getSetting('new_package_purchase') != 1 && activePackageHistory())
                                    <div class="col-md-12 mb-3">
                                        <div class="form-check tt-checkbox">
                                            <label for="new_package_purchase" class="form-check-label fw-medium ">
                                                <input class="form-check-input cursor-pointer" type="checkbox"
                                                    id="new_package_purchase" name="active_now">
                                                <strong>{{ localize('Do you want to active this package ?') }}</strong>

                                            </label>
                                            {{ localize('Your current active package will be expired and This Will be active.') }}

                                        </div>
                                    </div>
                                @endif

                            </div>
                        @endauth
                        <div class="online_payment" id="online_payment">
                            <div class="row g-3">

                                <!--Paypal-->
                                @if (getSetting('enable_paypal') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="paypal" value="paypal" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="paypal">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/paypal.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--stripe-->
                                @if (getSetting('enable_stripe') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="stripe" value="stripe" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="stripe">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/stripe.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--paytm-->
                                @if (getSetting('enable_paytm') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="paytm" value="paytm" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="paytm">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/paytm.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--razorpay-->
                                @if (getSetting('enable_razorpay') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="razorpay" value="razorpay" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="razorpay">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/razorpay.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--iyzico-->
                                @if (getSetting('enable_iyzico') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="iyzico" value="iyzico" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="iyzico">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/iyzico.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--paystack-->
                                @if (getSetting('enable_paystack') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="paystack" value="paystack" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="paystack">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/paystack.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--flutterwave-->
                                @if (getSetting('enable_flutterwave') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="flutterwave" value="flutterwave" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="flutterwave">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/flutterwave.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--duitku-->
                                @if (getSetting('enable_duitku') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="duitku" value="duitku" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="duitku">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/duitku.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--yookassa-->
                                @if (getSetting('enable_yookassa') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="yookassa" value="yookassa" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="yookassa">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/yookassa.svg') }}"
                                                        alt="" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--molile-->
                                @if (getSetting('enable_molile') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="molile" value="molile" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="molile">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/molile.svg') }}"
                                                        alt="molile" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--mercadopago-->
                                @if (getSetting('enable_mercadopago') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="mercadopago" value="mercadopago" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="mercadopago">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/mercadopago.svg') }}"
                                                        alt="mercadopago" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--midtrans-->
                                @if (getSetting('enable_midtrans') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="midtrans" value="midtrans" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="midtrans">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/midtrans.svg') }}"
                                                        alt="midtrans" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif
                                <!--freekassa-->
                                @if (getSetting('enable_freekassa') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="freekassa" value="freekassa" required>
                                            <label class="tt-gateway-info card p-3 cursor-pointer flex-column h-100"
                                                for="freekassa">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ staticAsset('backend/assets/img/payments/freekassa.png') }}"
                                                        alt="freekassa" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif

                                <!--offline-->
                                @if (getSetting('enable_offline') == 1)
                                    <div class="col-lg-3 col-md-6">
                                        <div class="tt-single-gateway text-center">
                                            <input type="radio" class="tt-custom-radio" name="payment_method"
                                                id="offline" value="offline" required>
                                            <label
                                                class="tt-gateway-info card p-3 cursor-pointer flex-column h-100 oflinePayment"
                                                data-method="offline" for="offline">
                                                <div class="tt-gateway-icon">
                                                    <img src="{{ uploadedAsset(getSetting('offline_image')) }}"
                                                        alt="offline payment" class="img-fluid">
                                                </div>
                                            </label>
                                        </div>
                                    </div>
                                @endif
                            </div>

                            <button type="submit" class="btn btn-primary mt-4 px-5">{{ localize('Proceed') }}</button>
                        </div>
                        <!--payment -->

                        @include('frontend.default.pages.partials.home._offline_payment')
                        <!-- End Offline  payment -->



                    </form>
                </div>


            </div>

        </div>
    </div>
    </div>
    </div>
@endsection

@section('scripts-common')
    <script>
        "use strict";

        // handle package payment
        function handlePackagePayment($this) {
            let package_type = $($this).data('package-type');
            let subscribed_package_type = $($this).data('previous-package-type');

            let check = true;
            let packageChangeCheck;
            let user_type = $($this).data('user-type') == "customer" ? 'customer' : 'admin';

            let carryForward = '{{ getSetting('carry_forward ')? 1: 0 }}';

            if ((subscribed_package_type == "prepaid" || subscribed_package_type == "lifetime") && (
                    package_type != "prepaid" && package_type != "lifetime")) {
                packageChangeCheck = confirm(
                    `{{ localize('You current package ${subscribed_package_type} will be expired if you want to subscribe to ${package_type}. Do you want to continue?') }}`
                )

            }
            if (subscribed_package_type != package_type && user_type == "customer" && carryForward == "0") {
                check = confirm(
                    `{{ localize('You are changing your subscription package type to ${package_type}, your balance will be reset with new package balance. Want to continue?') }}`
                )
            }

            if (check || packageChangeCheck) {
                let package_id = $($this).data('package-id');
                let price = parseFloat($($this).data('price'));
                $('.payment_package_id').val(package_id);

                let isLoggedIn = parseInt('{{ Auth::check() }}');
                let authUserType = 'customer';

                if (isLoggedIn == 1) {
                    authUserType = "{{ Auth::user()->user_type ?? 'customer' }}";
                    if (authUserType == "customer") {
                        if (price > 0) {
                            showPackagePaymentModal();
                        } else {
                            $('.payment-method-form').submit();
                        }
                    } else {
                        var redirectLink = "{{ route('subscriptions.index') }}";
                        $(location).prop('href', redirectLink)
                    }
                } else {
                    var redirectLink = "{{ route('subscriptions.index') }}";
                    $(location).prop('href', redirectLink)
                }
            }
        }

        // show package payment modal
        function showPackagePaymentModal() {
            $('#packagePaymentModal').modal('show')
        }

        // on submit payment form

        $(document).on('click', '.oflinePayment', function(e) {
            let payment_type = $(this).data('method');
            hideShow(payment_type);
        })
        $(document).on('click', '.cancel', function(e) {
            let payment_type = 'online';
            hideShow(payment_type);
        })
        // 
        $(document).on('change', '#offline_payment_method', function(e) {
            let id = $(this).val();
            if (id) {
                $('.all-description').addClass('d-none');
                $('#description_' + id).removeClass('d-none');
            } else {
                $('.all-description').addClass('d-none');
            }


        })

        // hide show
        function hideShow(payment_type) {
            if (payment_type == 'offline') {
                $('#online_payment').addClass('d-none');
                $('#offline_payment').removeClass('d-none');
                $('#offline_payment_method').attr('required', 'required');
                $('#offline_amount').attr('required', 'required');
                $('#offline_payment_detail').attr('required', 'required');
            } else {
                $('#online_payment').removeClass('d-none');
                $('#offline_payment').addClass('d-none');
                $('#offline_payment_method').removeAttr('required');
                $('#offline_amount').removeAttr('required');
                $('#offline_payment_detail').removeAttr('required');
            }
        }
        // clear data
        function clearData() {
            $('#offline_payment_method').val('')
            $('#offline_amount').val('')
            $('#offline_payment_method').val('')
        }
    </script>
@endsection
