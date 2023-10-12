<fieldset class="tt-single-fieldset">

    <div class="d-flex flex-column h-100">
        @if (auth()->user()->user_type == 'customer')
            @php
                $user = auth()->user();
                $latestPackage = activePackageHistory(auth()->user()->id);
            @endphp
        @if($latestPackage->new_image_balance != -1)
            <div class="card card-body py-2 mb-3">
                <div class="d-flex align-items-center flex-column used-images-percentage">
                    <div class="d-flex justify-content-between w-100 mt-auto mb-2">
                        @include('backend.pages.templates.inc.used-images-percentage')
                    </div>
                </div>
            </div>
        @endif  
             
        @endif
        <form action="#" class="d-flex flex-column stepImageForm">
            <input class="form-control ai_blog_wizard_id" type="hidden" id="ai_blog_wizard_id" name="ai_blog_wizard_id"
                value="">

            <div class="mb-3">
                <label for="imageStepTitle" class="form-label">{{ localize('Title') }} <span
                        class="text-danger">*</span></label>
                <input class="form-control" type="text" id="imageStepTitle" name="title"
                    placeholder="{{ localize('Type your title') }}" required>
            </div>

            <div class="form-input mb-3">
                <label for="style" class="form-label">{{ localize('Image Style') }}
                    <span class="ms-1 cursor-pointer" data-bs-toggle="tooltip" data-bs-placement="top"
                        data-bs-title="{{ localize('Style of the image will be as selected') }}"><i
                            data-feather="help-circle" class="icon-14"></i></span>
                </label>
                <select class="form-select" id="style" name="style">
                    <option value="">{{ localize('None') }}</option>
                    <option value="Abstract">{{ localize('Abstract') }}
                    </option>
                    <option value="Realstic">{{ localize('Realstic') }}
                    </option>
                    <option value="Cartoon">{{ localize('Cartoon') }}</option>
                    <option value="Digital Art">{{ localize('Digital Art') }}
                    </option>
                    <option value="Illustration">{{ localize('Illustration') }}
                    </option>
                    <option value="Photography">{{ localize('Photography') }}
                    </option>
                    <option value="3D Render">{{ localize('3D Render') }}
                    </option>
                    <option value="Pencil Drawing">
                        {{ localize('Pencil Drawing') }}</option>
                </select>
            </div>


            <div class="form-input mb-3">
                <label for="mood" class="form-label">{{ localize('Mood') }}
                    <span class="ms-1 cursor-pointer" data-bs-toggle="tooltip" data-bs-placement="top"
                        data-bs-title="{{ localize('Mood of the image will be as selected') }}"><i
                            data-feather="help-circle" class="icon-14"></i></span>
                </label>
                <select class="form-select" id="mood" name="mood">
                    <option value="">{{ localize('None') }}</option>
                    <option value="Angry">{{ localize('Angry') }}
                    </option>
                    <option value="Agressive">{{ localize('Agressive') }}
                    </option>

                    <option value="Calm">{{ localize('Calm') }}
                    </option>
                    <option value="Cheerful">{{ localize('Cheerful') }}
                    </option>
                    <option value="Chilling">{{ localize('Chilling') }}
                    </option>
                    <option value="Dark">{{ localize('Dark') }}
                    </option>
                    <option value="Happy">{{ localize('Happy') }}
                    </option>
                    <option value="Sad">{{ localize('Sad') }}
                    </option>
                </select>
            </div>

            <div class="form-input mb-3"
                @if (env('DEMO_MODE') == 'On') data-bs-toggle="tooltip"
                                                        data-bs-placement="top"
                                                        data-bs-title="{{ localize('Disabled in demo') }}" @endif>
                <label for="resolution" class="form-label">{{ localize('Image Resolution') }}
                    <span class="ms-1 cursor-pointer" data-bs-toggle="tooltip" data-bs-placement="top"
                        data-bs-title="{{ localize('Select image resolution size that you need') }}"><i
                            data-feather="help-circle" class="icon-14"></i></span>
                </label>
                <select class="form-select" id="resolution" name="resolution" required
                    @if (env('DEMO_MODE') == 'On') disabled @endif>
                    <option value="512x512">{{ localize('Medium [512x512]') }}
                    </option>
                    <option value="1024x1024" selected>
                        {{ localize('Large [1024x1024]') }}</option>
                </select>
            </div>

            <div class="form-input"
                @if (env('DEMO_MODE') == 'On') data-bs-toggle="tooltip"
                                                            data-bs-placement="top"
                                                            data-bs-title="{{ localize('Disabled in demo') }}" @endif>
                <label for="num_of_results" class="form-label">{{ localize('Number of Results') }}
                    <span class="ms-1 cursor-pointer" data-bs-toggle="tooltip" data-bs-placement="top"
                        data-bs-title="{{ localize('Select how many variations of result you want') }}"><i
                            data-feather="help-circle" class="icon-14"></i></span>
                </label>
                <select class="form-select" id="num_of_results" name="num_of_results" required
                    @if (env('DEMO_MODE') == 'On') disabled @endif>
                    <option value="1" @if (getSetting('default_number_of_results') == '1') selected @endif>
                        1
                    </option>
                    <option value="2" @if (getSetting('default_number_of_results') == '2') selected @endif>
                        2
                    </option>
                    <option value="3" @if (getSetting('default_number_of_results') == '3') selected @endif>
                        3
                    </option>
                    <option value="4" @if (getSetting('default_number_of_results') == '4') selected @endif>
                        4
                    </option>
                    <option value="5" @if (getSetting('default_number_of_results') == '5') selected @endif>
                        5
                    </option>
                </select>
            </div>


            <div class="d-flex align-items-center my-4 gap-2">
                <button class="btn btn-primary btn-create-content" data-text="{{ localize('Generate Images') }}">
                    <span class="me-2 btn-create-text image-text">{{ localize('Generate Images') }}</span>
                    <!-- text preloader start -->
                    <span class="tt-text-preloader d-none">
                        <span></span>
                        <span></span>
                        <span></span>
                    </span>
                    <!-- text preloader end -->
                </button>

                <a href="javascript:void(0);" class="text-decoration-underline text-muted btn-next-step">
                    {{ localize('Skip this step') }}
                </a>

                <div class="flex-grow-1"></div>

                <button type="button" class="btn btn-soft-primary rounded-circle btn-icon btn-prev-step">
                    <i data-feather="arrow-left"></i>
                </button>

                <button type="button" class="btn btn-soft-primary rounded-circle btn-icon btn-next-step">
                    <i data-feather="arrow-right"></i>
                </button>
            </div>
        </form>
    </div>
</fieldset>
