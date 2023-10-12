<form action="" method="POST" class="content-form">
    @csrf
    <input class="project_id" type="hidden" name="project_id"
        @if (isset($project)) value="{{ $project->id }}" @else value="" @endif>

    <div class="row justify-content-between align-items-center g-2 p-3">
        <div class="col-auto flex-grow-1">
            <input class="form-control border-0 px-2 project-title" type="text" id="title" name="title"
                placeholder="{{ localize('Your project title') }}..."
                @if (isset($project)) value="{{ $project->title }}" @else value="" @endif>
        </div>

        <div class="col-auto dropdown tt-tb-dropdown">
            <button type="button" class="btn tt-icon-btn tt-icon-primary border-0 shadow-sm rounded-circle p-0 me-2"
                data-bs-title="Download" id="downloadDropdown" href="#!" role="button" data-bs-toggle="dropdown"
                data-bs-auto-close="outside" aria-haspopup="true" aria-expanded="true"><i
                    data-feather="download"></i></button>

            <div class="dropdown-menu dropdown-menu-end shadow" style="">

                <a href="javascript:void(0);" class="dropdown-item downloadBtn" data-doc-type="pdf"
                    data-doc-name="{{ isset($conversation) ? $conversation->title : '' }}">
                    <i data-feather="file-text" class="icon-18"></i> {{ localize('PDF') }}
                </a>

                <a href="javascript:void(0);" class="dropdown-item downloadBtn" data-doc-type="html"
                    data-doc-name="{{ isset($conversation) ? $conversation->title : '' }}">
                    <svg class="shrink-0" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                        viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path d="M20 4l-2 14.5l-6 2l-6 -2l-2 -14.5z"></path>
                        <path d="M15.5 8h-7l.5 4h6l-.5 3.5l-2.5 .75l-2.5 -.75l-.1 -.5"></path>
                    </svg> {{ localize('HTML') }}
                </a>

                <a href="javascript:void(0);" class="dropdown-item downloadBtn" data-doc-type="doc"
                    data-doc-name="{{ isset($conversation) ? $conversation->title : '' }}">
                    <svg class="shrink-0" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                        viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" fill="none"
                        stroke-linecap="round" stroke-linejoin="round">
                        <path d="M4 18h9v-12l-5 2v5l-4 2v-8l9 -4l7 2v13l-7 3z"></path>
                    </svg> {{ localize('MS Word') }}
                </a>
            </div>
        </div>

        <div class="col-auto">
            <button type="button" class="tt-icon-btn tt-icon-info border-0 shadow-sm rounded-circle move_to_folder_btn"
                data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Move to folder"
                onclick="showSaveToFolderModal()"><i data-feather="folder"></i></button>
        </div>

        <div class="col-auto">
            <button type="button" class="tt-icon-btn tt-icon-warning border-0 shadow-sm rounded-circle copyBtn"
                data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Copy Contents"><i
                    data-feather="copy"></i></button>
        </div>

        <div class="col-auto">
            <button type="submit"
                class="tt-icon-btn tt-icon-success border-0 shadow-sm rounded-circle content-form-submit"
                data-bs-toggle="tooltip" data-bs-placement="top" data-bs-title="Save Changes"><i
                    data-feather="save"></i></button>
        </div>
    </div>
    <div class="card-body d-flex flex-column h-100 tt-create-content-wrap p-0 border-top">
        <textarea class="editor content-editor" data-content-min-height="true"
            data-buttons='[["font", ["bold", "underline" , "italic" ]], ["fontname",["fontname"]], ["para", ["ul", "ol" , "paragraph" ]], ["style", ["style"]], ["fontsize", ["fontsize"]], ["insert", ["link"]], ["view", ["undo", "redo" ]]]'
            class="p-0 border-0" id="aiContents" name="contents">
@if (isset($project))
{!! $project->content !!}
@endif
</textarea>
    </div>
</form>
