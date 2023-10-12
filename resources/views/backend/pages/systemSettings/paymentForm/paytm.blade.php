 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasPaytm" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('PayTm Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <input type="hidden" name="payment_methods[]" value="paytm">
             <div class="mb-3">
                 <label for="PAYTM_ENVIRONMENT" class="form-label">{{ localize('PayTm Environment') }}</label>
                 <input type="hidden" name="types[]" value="PAYTM_ENVIRONMENT">
                 <input type="text" id="PAYTM_ENVIRONMENT" name="PAYTM_ENVIRONMENT" class="form-control"
                     value="{{ env('PAYTM_ENVIRONMENT') }}">
             </div>

             <div class="mb-3">
                 <label for="PAYTM_MERCHANT_ID" class="form-label">{{ localize('PayTm Merchant ID') }}</label>
                 <input type="hidden" name="types[]" value="PAYTM_MERCHANT_ID">
                 <input type="text" id="PAYTM_MERCHANT_ID" name="PAYTM_MERCHANT_ID" class="form-control"
                     value="{{ env('PAYTM_MERCHANT_ID') }}">
             </div>
             <div class="mb-3">
                 <label for="PAYTM_MERCHANT_KEY" class="form-label">{{ localize('PayTm Merchant Key') }}</label>
                 <input type="hidden" name="types[]" value="PAYTM_MERCHANT_KEY">
                 <input type="text" id="PAYTM_MERCHANT_KEY" name="PAYTM_MERCHANT_KEY" class="form-control"
                     value="{{ env('PAYTM_MERCHANT_KEY') }}">
             </div>

             <div class="mb-3">
                 <label for="PAYTM_MERCHANT_WEBSITE" class="form-label">{{ localize('PayTm Merchant Website') }}</label>
                 <input type="hidden" name="types[]" value="PAYTM_MERCHANT_WEBSITE">
                 <input type="text" id="PAYTM_MERCHANT_WEBSITE" name="PAYTM_MERCHANT_WEBSITE" class="form-control"
                     value="{{ env('PAYTM_MERCHANT_WEBSITE') }}">
             </div>

             <div class="mb-3">
                 <label for="PAYTM_CHANNEL" class="form-label">{{ localize('PayTm Channel') }}</label>
                 <input type="hidden" name="types[]" value="PAYTM_CHANNEL">
                 <input type="text" id="PAYTM_CHANNEL" name="PAYTM_CHANNEL" class="form-control"
                     value="{{ env('PAYTM_CHANNEL') }}">
             </div>

             <div class="mb-3">
                 <label for="PAYTM_INDUSTRY_TYPE" class="form-label">{{ localize('PayTm Industry Type') }}</label>
                 <input type="hidden" name="types[]" value="PAYTM_INDUSTRY_TYPE">
                 <input type="text" id="PAYTM_INDUSTRY_TYPE" name="PAYTM_INDUSTRY_TYPE" class="form-control"
                     value="{{ env('PAYTM_INDUSTRY_TYPE') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable PayTm') }}</label>
                 <select id="enable_paytm" class="form-control select2" name="enable_paytm" data-toggle="select2">
                     <option value="0" {{ getSetting('enable_paytm') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_paytm') == '1' ? 'selected' : '' }}>
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
