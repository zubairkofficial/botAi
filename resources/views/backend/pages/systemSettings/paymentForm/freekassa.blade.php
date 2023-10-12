 <!-- Offcanvas -->
 <div class="offcanvas offcanvas-end" id="offcanvasFreekassa" tabindex="-1">
    <div class="offcanvas-header border-bottom">
        <h5 class="offcanvas-title">{{ localize('Freekassa Configuration') }}</h5>
        <span class="btn btn-outline-danger rounded-circle btn-icon d-inline-flex align-items-center justify-content-center" data-bs-dismiss="offcanvas">
            <i data-feather="x"></i>
        </span>
    </div>
    <div class="offcanvas-body" data-simplebar>
        <form action="{{ route('admin.settings.updatePaymentMethods') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <input type="hidden" name="payment_methods[]" value="freekassa">
            <div class="mb-3">
                <label for="FREEKASSA_PROJECT_ID" class="form-label">{{ localize('Freekassa Project ID') }}</label>
                <input type="hidden" name="types[]" value="FREEKASSA_PROJECT_ID">
                <input type="text" id="FREEKASSA_PROJECT_ID" name="FREEKASSA_PROJECT_ID" class="form-control" value="{{ env('FREEKASSA_PROJECT_ID') }}">
            </div>
            <div class="mb-3">
                <label for="FREEKASSA_SECRET_KEY" class="form-label">{{ localize('Freekassa Secret Key') }}</label>
                <input type="hidden" name="types[]" value="FREEKASSA_SECRET_KEY">
                <input type="text" id="FREEKASSA_SECRET_KEY" name="FREEKASSA_SECRET_KEY" class="form-control" value="{{ env('FREEKASSA_SECRET_KEY') }}">
            </div>
           
            <div class="mb-3">
                <label for="FREEKASSA_SECRET_KEY_SECOND" class="form-label">{{ localize('Freekassa Secret Key Second') }}</label>
                <input type="hidden" name="types[]" value="FREEKASSA_SECRET_KEY_SECOND">
                <input type="text" id="FREEKASSA_SECRET_KEY_SECOND" name="FREEKASSA_SECRET_KEY_SECOND" class="form-control" value="{{ env('FREEKASSA_SECRET_KEY_SECOND') }}">
            </div>

            {{-- <div class="mb-3">
                <label for="FREEKASSA_CURRENCY_CODE" class="form-label">{{ localize('Freekassa Currency Code') }}</label>
                <input type="hidden" name="types[]" value="FREEKASSA_CURRENCY_CODE">
                <input type="text" id="FREEKASSA_CURRENCY_CODE" name="FREEKASSA_CURRENCY_CODE" class="form-control" value="{{ env('FREEKASSA_CURRENCY_CODE') }}">
            </div> --}}

            <div class="mb-3">
                <label class="form-label">{{ localize('Enable Freekassa') }}</label>
                <select id="enable_freekassa" class="form-control select2" name="enable_freekassa" data-toggle="select2">
                    <option value="0" {{ getSetting('enable_freekassa') == '0' ? 'selected' : '' }}>
                        {{ localize('Disable') }}
                    </option>
                    <option value="1" {{ getSetting('enable_freekassa') == '1' ? 'selected' : '' }}>
                        {{ localize('Enable') }}
                    </option>
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
