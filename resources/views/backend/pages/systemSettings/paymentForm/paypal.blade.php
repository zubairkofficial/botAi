 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasPaypal" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Paypal Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <!--paypal settings-->
             <input type="hidden" name="payment_methods[]" value="paypal">
             <div class="mb-3">
                 <label for="PAYPAL_CLIENT_ID" class="form-label">{{ localize('Paypal Client ID') }}</label>
                 <input type="hidden" name="types[]" value="PAYPAL_CLIENT_ID">
                 <input type="text" id="PAYPAL_CLIENT_ID" name="PAYPAL_CLIENT_ID" class="form-control"
                     value="{{ env('PAYPAL_CLIENT_ID') }}">
             </div>
             <div class="mb-3">
                 <label for="PAYPAL_CLIENT_SECRET" class="form-label">{{ localize('Paypal Client Secret') }}</label>
                 <input type="hidden" name="types[]" value="PAYPAL_CLIENT_SECRET">
                 <input type="text" id="PAYPAL_CLIENT_SECRET" name="PAYPAL_CLIENT_SECRET" class="form-control"
                     value="{{ env('PAYPAL_CLIENT_SECRET') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Paypal') }}</label>
                 <select id="enable_paypal" class="form-control select2" name="enable_paypal" data-toggle="select2">
                     <option value="0" {{ getSetting('enable_paypal') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_paypal') == '1' ? 'selected' : '' }}>
                         {{ localize('Enable') }}</option>
                 </select>
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Test Sandbox Mode') }}</label>
                 <select id="paypal_sandbox" class="form-control select2" name="paypal_sandbox" data-toggle="select2">
                     <option value="0" {{ getSetting('paypal_sandbox') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('paypal_sandbox') == '1' ? 'selected' : '' }}>
                         {{ localize('Enable') }}</option>
                 </select>
             </div>
             <!--paypal settings-->
             <div class="mb-3">
                 <button class="btn btn-primary" type="submit">
                     <i data-feather="save" class="me-1"></i> {{ localize('Save Configuration') }}
                 </button>
             </div>
         </form>
     </div>
 </div>
