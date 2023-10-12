 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasRazorpay" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Razorpay Configuration') }}</h5>
         <span
             class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center"
             data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <input type="hidden" name="payment_methods[]" value="razorpay">
             <div class="mb-3">
                 <label for="RAZORPAY_KEY" class="form-label">{{ localize('Razorpay Key') }}</label>
                 <input type="hidden" name="types[]" value="RAZORPAY_KEY">
                 <input type="text" id="RAZORPAY_KEY" name="RAZORPAY_KEY" class="form-control"
                     value="{{ env('RAZORPAY_KEY') }}">
             </div>
             <div class="mb-3">
                 <label for="RAZORPAY_SECRET" class="form-label">{{ localize('Razorpay Secret') }}</label>
                 <input type="hidden" name="types[]" value="RAZORPAY_SECRET">
                 <input type="text" id="RAZORPAY_SECRET" name="RAZORPAY_SECRET" class="form-control"
                     value="{{ env('RAZORPAY_SECRET') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Razorpay') }}</label>
                 <select id="enable_razorpay" class="form-control select2" name="enable_razorpay" data-toggle="select2">
                     <option value="0" {{ getSetting('enable_razorpay') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}</option>
                     <option value="1" {{ getSetting('enable_razorpay') == '1' ? 'selected' : '' }}>
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
