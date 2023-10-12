 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasYookassa" tabindex="-1">
     <div class="offcanvas-header border-bottom">
         <h5 class="offcanvas-title">{{ localize('Yookassa Configuration') }}</h5>
         <span class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center" data-bs-dismiss="offcanvas">
             <i data-feather="x"></i>
         </span>
     </div>
     <div class="offcanvas-body" data-simplebar>
         <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
             @csrf
             <input type="hidden" name="payment_methods[]" value="yookassa">
             <div class="mb-3">
                 <label for="YOOKASSA_SHOP_ID" class="form-label">{{ localize('Yookassa Shop ID') }}</label>
                 <input type="hidden" name="types[]" value="YOOKASSA_SHOP_ID">
                 <input type="text" id="YOOKASSA_SHOP_ID" name="YOOKASSA_SHOP_ID" class="form-control" value="{{ env('YOOKASSA_SHOP_ID') }}">
             </div>
             <div class="mb-3">
                 <label for="YOOKASSA_SECRET_KEY" class="form-label">{{ localize('Yookassa Secret Key') }}</label>
                 <input type="hidden" name="types[]" value="YOOKASSA_SECRET_KEY">
                 <input type="text" id="YOOKASSA_SECRET_KEY" name="YOOKASSA_SECRET_KEY" class="form-control" value="{{ env('YOOKASSA_SECRET_KEY') }}">
             </div>

             <div class="mb-3">
                 <label for="YOOKASSA_CURRENCY_CODE" class="form-label">{{ localize('YOOKASSA Currency Code') }}</label>
                 <input type="hidden" name="types[]" value="YOOKASSA_CURRENCY_CODE">
                 <input type="text" id="YOOKASSA_CURRENCY_CODE" name="YOOKASSA_CURRENCY_CODE" class="form-control" value="{{ env('YOOKASSA_CURRENCY_CODE') }}">
             </div>

             <div class="mb-3">
                 <label class="form-label">{{ localize('Enable Yookassa') }}</label>
                 <select id="enable_yookassa" class="form-control select2" name="enable_yookassa" data-toggle="select2">
                     <option value="0" {{ getSetting('enable_yookassa') == '0' ? 'selected' : '' }}>
                         {{ localize('Disable') }}
                     </option>
                     <option value="1" {{ getSetting('enable_yookassa') == '1' ? 'selected' : '' }}>
                         {{ localize('Enable') }}
                     </option>
                 </select>
             </div>
             <div class="mb-3">
                 <div class="form-check form-switch">
                     <label for="is_active" class="form-label ms-2">{{ localize('Reciept ?') }} <span class="text-danger ms-1"> </span></label>
                     <input type="hidden" name="types[]" value="YOOKASSA_RECIEPT"> 
                     <input type="checkbox" class="form-check-input" id="yookassa_reciept_active" name="YOOKASSA_RECIEPT" @if (env('YOOKASSA_RECIEPT') == 'on') checked @endif>
                 </div>
             </div>
             <div class="reciept {{env('YOOKASSA_RECIEPT') == 'on' ? '' : 'd-none'}}" id="reciept_yookassa">
                 @php
                    $vatLists = [
                    '1'=> 'VAT not included',
                    '2'=> '0% VAT rate',
                    '3'=> '10% VAT rate',
                    '4'=> '20% receipt’s VAT rate',
                    '5'=> '10/110 receipt’s estimate VAT rate',
                    '6'=> '20/120 receipt’s estimate VAT rate',
                    ]
                 @endphp
                 <div class="mb-3">
                     <label class="form-label">{{ localize('VAT rates Yookassa') }}</label> 
                     <input type="hidden" name="types[]" value="YOOKASSA_VAT"> 
                     <select id="yookassa_vat" class="form-control select2" name="YOOKASSA_VAT" data-toggle="select2">
                         @foreach($vatLists as $key=>$vat)
                         <option value="{{$key}}" {{ env('YOOKASSA_VAT') == $key ? 'selected' : (2 == $key ? 'selected' : '')  }}>
                             {{ localize($vat) }}
                         </option>
                         @endforeach
                     </select>
                 </div>

             </div>
             <div class="mb-3">
                 <button class="btn btn-primary" type="submit">
                     <i data-feather="save" class="me-1"></i> {{ localize('Save Configuration') }}
                 </button>
             </div>
         </form>
     </div>
 </div>
 @section('scripts')
 <script>
    $(document).on('change', '#yookassa_reciept_active', function(){
        let status = $(this).is(':checked') ? true : false;
        if(status == true) {
            $('#reciept_yookassa').removeClass('d-none');
        }else{
            $('#reciept_yookassa').addClass('d-none');
        }
    })
 </script>
 @endsection