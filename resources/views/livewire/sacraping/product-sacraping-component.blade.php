<div>
    <div class="row g-4">
        <div class="col-12">
            <div class="card mb-4" id="section-1">
                <form class="app-search" wire:submit.prevent='getData'>
                    @csrf
                    <div class="card-header border-bottom-0">
                        <div class="row justify-content-between g-3">
                            <div class="col-auto flex-grow-1">
                                <div class="tt-search-box">
                                    <div class="input-group">
                                        <span class="position-absolute top-50 start-0 translate-middle-y ms-2">
                                            <i data-feather="search"></i>
                                        </span>
                                        <input class="form-control rounded-start w-100" type="text" id="productId"
                                            name="productId" wire:model='productId'
                                            placeholder="{{ localize('Paste Product Id Here') }}...">
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto flex-grow-1">
                                <div class="tt-search-box">
                                    <div class="input-group">
                                        <select name="platform" id="platform" class="form-control" wire:model='platform'>
                                            <option value="" selected>Select Platform</option>
                                            <option value="amazon">Amazon</option>
                                            <option value="b&n">B&N</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="col-auto">
                                <button type="submit" class="btn btn-secondary">
                                    <i data-feather="search" width="18"></i>
                                    {{ localize('Search') }}
                                </button>
                            </div>
                        </div>
                        <div wire:loading>
                            Processing Reviews please wait...
                        </div>
                        @if(Session::has('message'))
                        <div class="alert alert-success" role="alert">{{ Session::get('message') }}</div>
                        @endif
                    </div>
                </form>
    
                <div class="container p-1">
                  
                    @if($project)
                    <div class="row">
                        <div class="col-md-12">
                            <a href="{{ route('generatePdf',['projectId'=>$project->id]) }}" class="btn btn-primary">
                                DownloadPdf
                            </a >
                        </div>
                    </div>

                    <table class="table table-striped">
                        <tr>
                            <td>Project Title</td>
                            <td>{{ $project->title }}</td>
                        </tr>
                        <tr>
                            <td>Project Content</td>
                            <td>{!! nl2br($project->content) !!}</td>
                        </tr>
                    </table>
                    @else
                    <table class="table table-striped">
                        <tr>
                            No Product Reviews Found. 
                        </tr>
                    </table>
                    @endif
                </div>
                <!--pagination end-->
            </div>
        </div>
    </div>
</div>
