 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasPaystack" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Paystack Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <input type="hidden" name="payment_methods[]" value="paystack">

             <div class="mb-3">
                 <label for="PAYSTACK_PUBLIC_KEY" class="form-label">{{ localize('Paystack Public Key') }}</label>
                 <input type="hidden" name="types[]" value="PAYSTACK_PUBLIC_KEY">
                 <input type="text" id="PAYSTACK_PUBLIC_KEY" name="PAYSTACK_PUBLIC_KEY" class="form-control"
                     value="{{ env('PAYSTACK_PUBLIC_KEY') }}">
             </div>

             <div class="mb-3">
                 <label for="PAYSTACK_SECRET_KEY" class="form-label">{{ localize('Secret Key') }}</label>
                 <input type="hidden" name="types[]" value="PAYSTACK_SECRET_KEY">
                 <input type="text" id="PAYSTACK_SECRET_KEY" name="PAYSTACK_SECRET_KEY" class="form-control"
                     value="{{ env('PAYSTACK_SECRET_KEY') }}">
             </div>

             <div class="mb-3">
                 <label for="MERCHANT_EMAIL" class="form-label">{{ localize('Merchant Email') }}</label>
                 <input type="hidden" name="types[]" value="MERCHANT_EMAIL">
                 <input type="text" id="MERCHANT_EMAIL" name="MERCHANT_EMAIL" class="form-control"
                     value="{{ env('MERCHANT_EMAIL') }}">
             </div>

             <div class="mb-3">
                 <label for="" class="form-label">{{ localize('Paystack Callback') }}</label>
                 <input type="text" id="" name="" class="form-control" disabled
                     value="{{ route('paystack.callback') }}">
             </div>

             <div class="mb-3">
                 <label for="PAYSTACK_CURRENCY_CODE"
                     class="form-label">{{ localize('Paystack Currency Code') }}</label>
                 <input type="hidden" name="types[]" value="PAYSTACK_CURRENCY_CODE">
                 <input type="text" id="PAYSTACK_CURRENCY_CODE" name="PAYSTACK_CURRENCY_CODE" class="form-control"
                     value="{{ env('PAYSTACK_CURRENCY_CODE') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Paystack') }}</label>
                 <select id="enable_paystack" class="form-control select2" name="enable_paystack" data-toggle="select2">
                     <option value="0" {{ getSetting('enable_paystack') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_paystack') == '1' ? 'selected' : '' }}>
                         {{ localize('Enable') }}</option>
                 </select>
             </div>
             <div class="mb-3">
                 <button class="btn btn-primary" type="submit">
                     <i data-feather="save" class="me-1"></i> {{ localize('Save Configuration') }}
                 </button>
             </div>
         </form>
     </div>
 </div>
