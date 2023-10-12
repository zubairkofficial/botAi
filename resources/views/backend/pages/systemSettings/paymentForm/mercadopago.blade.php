 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasMercadopago" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Mercadopago Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <!--Mercadopago settings-->
             <input type="hidden" name="payment_methods[]" value="mercadopago">

             <div class="mb-3">
                 <label for="MERCADOPAGO_SECRET_KEY" class="form-label">{{ localize('Mercadopago Secret Key') }}</label>
                 <input type="hidden" name="types[]" value="MERCADOPAGO_SECRET_KEY">
                 <input type="text" id="MERCADOPAGO_SECRET_KEY" name="MERCADOPAGO_SECRET_KEY" class="form-control"
                     value="{{ env('MERCADOPAGO_SECRET_KEY') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Mercadopago') }}</label>
                 <select id="enable_mercadopago" class="form-control select2" name="enable_mercadopago"
                     data-toggle="select2">
                     <option value="0" {{ getSetting('enable_mercadopago') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_mercadopago') == '1' ? 'selected' : '' }}>
                         {{ localize('Enable') }}</option>
                 </select>
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Test Sandbox Mode') }}</label>
                 <select id="mercadopago_sandbox" class="form-control select2" name="mercadopago_sandbox"
                     data-toggle="select2">
                     <option value="0" {{ getSetting('mercadopago_sandbox') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('mercadopago_sandbox') == '1' ? 'selected' : '' }}>
                         {{ localize('Enable') }}</option>
                 </select>
             </div>
             <!--Mercadopago settings-->
             <div class="mb-3">
                 <button class="btn btn-primary" type="submit">
                     <i data-feather="save" class="me-1"></i> {{ localize('Save Configuration') }}
                 </button>
             </div>
         </form>
     </div>
 </div>
