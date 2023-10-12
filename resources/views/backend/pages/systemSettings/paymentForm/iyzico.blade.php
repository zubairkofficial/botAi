 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasIyzico" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Iyzico Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <input type="hidden" name="payment_methods[]" value="iyzico">
             <div class="mb-3">
                 <label for="IYZICO_API_KEY" class="form-label">{{ localize('IyZico API Key') }}</label>
                 <input type="hidden" name="types[]" value="IYZICO_API_KEY">
                 <input type="text" id="IYZICO_API_KEY" name="IYZICO_API_KEY" class="form-control"
                     value="{{ env('IYZICO_API_KEY') }}">
             </div>

             <div class="mb-3">
                 <label for="IYZICO_SECRET_KEY" class="form-label">{{ localize('IyZico Secret Key') }}</label>
                 <input type="hidden" name="types[]" value="IYZICO_SECRET_KEY">
                 <input type="text" id="IYZICO_SECRET_KEY" name="IYZICO_SECRET_KEY" class="form-control"
                     value="{{ env('IYZICO_SECRET_KEY') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable IyZico') }}</label>
                 <select id="enable_iyzico" class="form-control select2" name="enable_iyzico" data-toggle="select2">
                     <option value="0" {{ getSetting('enable_iyzico') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_iyzico') == '1' ? 'selected' : '' }}>
                         {{ localize('Enable') }}</option>
                 </select>
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Test Sandbox Mode') }}</label>
                 <select id="iyzico_sandbox" class="form-control select2" name="iyzico_sandbox" data-toggle="select2">
                     <option value="0" {{ getSetting('iyzico_sandbox') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('iyzico_sandbox') == '1' ? 'selected' : '' }}>
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
