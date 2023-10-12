 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasFlutterwave" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Flutterwave Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <input type="hidden" name="payment_methods[]" value="flutterwave">

             <div class="mb-3">
                 <label for="FLW_PUBLIC_KEY" class="form-label">{{ localize('Flutterwave Public Key') }}</label>
                 <input type="hidden" name="types[]" value="FLW_PUBLIC_KEY">
                 <input type="text" id="FLW_PUBLIC_KEY" name="FLW_PUBLIC_KEY" class="form-control"
                     value="{{ env('FLW_PUBLIC_KEY') }}">
             </div>

             <div class="mb-3">
                 <label for="FLW_SECRET_KEY" class="form-label">{{ localize('Flutterwave Secret Key') }}</label>
                 <input type="hidden" name="types[]" value="FLW_SECRET_KEY">
                 <input type="text" id="FLW_SECRET_KEY" name="FLW_SECRET_KEY" class="form-control"
                     value="{{ env('FLW_SECRET_KEY') }}">
             </div>

             <div class="mb-3">
                 <label for="FLW_SECRET_HASH" class="form-label">{{ localize('Flutterwave Secret Hash') }}</label>
                 <input type="hidden" name="types[]" value="FLW_SECRET_HASH">
                 <input type="text" id="FLW_SECRET_HASH" name="FLW_SECRET_HASH" class="form-control"
                     value="{{ env('FLW_SECRET_HASH') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Flutterwave') }}</label>
                 <select id="enable_flutterwave" class="form-control select2" name="enable_flutterwave"
                     data-toggle="select2">
                     <option value="0" {{ getSetting('enable_flutterwave') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_flutterwave') == '1' ? 'selected' : '' }}>
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
