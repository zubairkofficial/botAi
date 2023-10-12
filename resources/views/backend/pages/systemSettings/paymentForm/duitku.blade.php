 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasDuitku" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Duitku Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <input type="hidden" name="payment_methods[]" value="duitku">

             <div class="mb-3">
                 <label for="DUITKU_API_KEY" class="form-label">{{ localize('Duitku Api Key') }}</label>
                 <input type="hidden" name="types[]" value="DUITKU_API_KEY">
                 <input type="text" id="DUITKU_API_KEY" name="DUITKU_API_KEY" class="form-control"
                     value="{{ env('DUITKU_API_KEY') }}">
             </div>

             <div class="mb-3">
                 <label for="DUITKU_MERCHANT_CODE" class="form-label">{{ localize('Duitku Merchant Code') }}</label>
                 <input type="hidden" name="types[]" value="DUITKU_MERCHANT_CODE">
                 <input type="text" id="DUITKU_MERCHANT_CODE" name="DUITKU_MERCHANT_CODE" class="form-control"
                     value="{{ env('DUITKU_MERCHANT_CODE') }}">
             </div>

             <div class="mb-3">
                 <label for="DUITKU_CALLBACK_URL" class="form-label">{{ localize('Duitku Callback Url') }}</label>
                 <input type="hidden" name="types[]" value="DUITKU_CALLBACK_URL">
                 <input type="url" id="DUITKU_CALLBACK_URL" name="DUITKU_CALLBACK_URL" class="form-control"
                     value="{{ url('/duitku/payment/callback') }}" readonly>
             </div>

             <div class="mb-3">
                 <label for="DUITKU_RETURN_URL" class="form-label">{{ localize('Duitku Return Url') }}</label>
                 <input type="hidden" name="types[]" value="DUITKU_RETURN_URL">
                 <input type="url" id="DUITKU_RETURN_URL" name="DUITKU_RETURN_URL" class="form-control"
                     value="{{ url('/duitku/payment/return') }}" readonly>
             </div>

             <div class="mb-3">
                 <label for="DUITKU_ENV" class="form-label">{{ localize('Duitku Env') }}</label>
                 <input type="hidden" name="types[]" value="DUITKU_ENV">
                 <input type="url" id="DUITKU_ENV" name="DUITKU_ENV" class="form-control"
                     value="{{ env('DUITKU_ENV') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Duitku') }}</label>
                 <select id="enable_duitku" class="form-control select2" name="enable_duitku" data-toggle="select2">
                     <option value="0" {{ getSetting('enable_duitku') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_duitku') == '1' ? 'selected' : '' }}>
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
