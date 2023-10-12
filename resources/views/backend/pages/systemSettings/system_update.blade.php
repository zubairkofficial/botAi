@extends('backend.layouts.master')

@section('title')
    {{ localize('Update System') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('contents')
    <section class="tt-section pt-4">
        <div class="container">

            <div class="row mb-4">
                <div class="col-12">
                    <div class="tt-page-header">
                        <div class="d-lg-flex align-items-center justify-content-lg-between">
                            <div class="tt-page-title mb-3 mb-lg-0">
                                <h1 class="h4 mb-lg-1">{{ localize('Update System') }}</h1>
                                <ol class="breadcrumb breadcrumb-angle text-muted">
                                    <li class="breadcrumb-item"><a
                                            href="{{ route('writebot.dashboard') }}">{{ localize('Dashboard') }}</a>
                                    </li>
                                    <li class="breadcrumb-item">{{ localize('Update System') }}</li>
                                </ol>
                            </div>
                            <div class="tt-action">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row mb-5">
                <div class="col-12">
                  <h5>Be Aware!! Before Update</h5>
                  <ul class="mb-0 ps-3">
                    <li class="text-danger">You must take backup from your server (files &amp; database)</li>
                    <li>Make sure you have stable internet connection</li>
                    <li class="text-danger"> <strong>Do not close the tab while the process is running.</strong></li>             
                  </ul>
                </div>
              </div>
        
              <!-- one click update start -->
              <div class="row mb-5">
                <div class="col-12">
                  <h5>{{localize('Update Your Application')}}</h5>
                  <div class="card border-0 shadow-sm mt-3">
                    <div class="card-header pb-0 pt-1 bg-light">
                      <ul class="nav nav-line-tab fw-semibold" role="tablist">
                        <li class="nav-item" role="presentation"><a class="nav-link active" href="#result4" data-bs-toggle="tab"
                            role="tab" aria-controls="result4" aria-selected="true">{{localize('One Click Update')}}</a></li>
                        <li class="nav-item" role="presentation"><a class="nav-link" href="#html4" data-bs-toggle="tab"
                            role="tab" aria-controls="html4" aria-selected="false" tabindex="-1">{{localize('Manual Update')}} <small><span
                                class="text-danger">*</span>{{localize('Update File (Zip)')}}</small></a></li>
                      </ul>
                    </div>
                    <div class="card-body p-lg-5">
                      <div class="tab-content">
                        <div class="tab-pane fade active show" id="result4" role="tabpanel">
                          <div class="d-flex">
                            <div class="tt-version tt-your-version py-5 d-flex flex-column h-100 w-100">
                              <h6>{{ localize('Your Version') }}</h6>
                              <div class="h2 fw-bold">V{{ currentVersion() }}</div>
                              <div class="fs-md">{{ getSetting('last_update') }}</div>
                            </div>
                            <div class="tt-version tt-latest-version py-5 d-flex flex-column h-100 w-100">
                              <h6>{{ localize('Latest Version') }}</h6>
                              <div class="h2 fw-bold text-success">V{{latestVersion(true)}}</div>
                              <div class="fs-md"> <a href="https://codecanyon.net/user/themetags/portfolio" class="fw-medium">{{ localize('View Changelog') }}</a></div>
                            </div>
                          </div>
                          <div class="d-flex align-items-center mt-4">
                            <a href="{{route('system.update')}}" class="btn btn-primary {{ latestVersion(true) == currentVersion() ? 'disabled':''}}">{{localize('Update Now')}}</a>
                          </div>
                        </div>
                        <div class="tab-pane fade" id="html4" role="tabpanel">
                            <form action="{{ route('admin.system.update-version') }}" method="POST" 
                            enctype="multipart/form-data">
                            @csrf
                            <div class="" id="section-2">                                    
                                  <div class="mb-3">
                                      <label for="default_creativity" class="form-label">{{ localize('Update File (Zip)') }}
                                          <span class="text-danger ms-1">*</span></label>
  
  
                                      <div class="file-drop-area file-upload text-center rounded-3">
                                          <input type="file" class="file-drop-input" name="updateFile" id="json" />
                                          <div class="file-drop-icon ci-cloud-upload">
                                              <i data-feather="image"></i>
                                          </div>
                                          <p class="text-dark fw-bold mb-2 mt-3">
                                              {{ localize('Drop your files here or') }}
                                              <a href="javascript::void(0);"
                                                  class="text-primary">{{ localize('Browse') }}</a>
                                          </p>
                                          <p class="mb-0 file-name text-muted">
                                              
                                                  <small>* {{ localize('Allowed file types: ') }} .zip
                                                  </small>
                                              
  
                                          </p>
                                      </div>
                                      @if ($errors->has('file'))
                                          <span class="text-danger">{{ $errors->first('file') }}</span>
                                      @endif
                                  </div>    
                                  <div class="d-flex align-items-center mt-4">
                                      <button class="btn btn-primary" type="submit">{{localize('Update Now')}}</button>
                                  </div>
                            </div>
                            
                        </form>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- one click update end -->
           
        </div>
    </section>
@endsection

