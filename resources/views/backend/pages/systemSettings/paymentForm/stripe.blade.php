 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasStripe" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Stripe Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <!--stripe settings-->
             <input type="hidden" name="payment_methods[]" value="stripe">
             <div class="mb-3">
                 <label for="STRIPE_KEY" class="form-label">{{ localize('Publishable Key') }}</label>
                 <input type="hidden" name="types[]" value="STRIPE_KEY">
                 <input type="text" id="STRIPE_KEY" name="STRIPE_KEY" class="form-control"
                     value="{{ env('STRIPE_KEY') }}">
             </div>
             <div class="mb-3">
                 <label for="STRIPE_SECRET" class="form-label">{{ localize('Stripe Secret') }}</label>
                 <input type="hidden" name="types[]" value="STRIPE_SECRET">
                 <input type="text" id="STRIPE_SECRET" name="STRIPE_SECRET" class="form-control"
                     value="{{ env('STRIPE_SECRET') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Stripe') }}</label>
                 <select id="enable_stripe" class="form-control select2" name="enable_stripe" data-toggle="select2">
                     <option value="0" {{ getSetting('enable_stripe') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_stripe') == '1' ? 'selected' : '' }}>
                         {{ localize('Enable') }}</option>
                 </select>
             </div>
             <!--stripe settings-->
             <div class="mb-3">
                 <button class="btn btn-primary" type="submit">
                     <i data-feather="save" class="me-1"></i> {{ localize('Save Configuration') }}
                 </button>
             </div>
         </form>
     </div>
 </div>
