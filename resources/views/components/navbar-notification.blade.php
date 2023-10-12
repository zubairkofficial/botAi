<li class="nav-item dropdown">

    <a class="nav-link position-relative tt-notification" href="#" role="button"
        id="notificationDropdown" data-bs-toggle="dropdown" aria-haspopup="true"
        aria-expanded="false" data-bs-auto-close="outside">
        <i data-feather="bell"></i>
        @if ($newMsgCount > 0)
            <span class="tt-notification-dot bg-danger rounded-circle"></span>
        @endif
    </a>
    <div class="dropdown-menu dropdown-menu-end py-0 shadow-sm border-0"
        aria-labelledby="notificationDropdown">
        <div class="card position-relative border-0">
            <div class="card-body p-0">
                <div class="scrollbar-overlay">

                    @can('contact_us_messages')
                        @if ($newMsgCount > 0)
                            <div class="p-3 position-relative border-bottom">
                                <a href="{{ route('admin.queries.index') }}"
                                    class="d-flex align-items-center">
                                    <h4 class="fs-md mb-0"><i data-feather="mail" width="18"
                                            class="me-1 text-primary"></i>
                                        {{ localize('New Contact Message') }}
                                        ({{ $newMsgCount }})
                                    </h4>
                                </a>
                            </div>
                        @endif
                        
                    @endcan
                    @if ($newMsgCount > 0)
                        <div class="p-3 position-relative border-bottom">
                            <a href="{{ route('admin.notifications.index') }}"
                                class="d-flex align-items-center">
                                <h4 class="fs-md mb-0"><i data-feather="mail" width="18"
                                        class="me-1 text-primary"></i>
                                    {{ localize('New Notification Message') }}
                                    ({{ $newMsgCount }})
                                </h4>
                            </a>
                        </div>
                    @endif
                    @if ($newMsgCount <= 0)
                        <div class="p-3 position-relative border-bottom">
                            <h4 class="fs-md mb-0 text-muted fw-normal"><i data-feather="info"
                                    width="18"
                                    class="me-1 text-danger"></i>{{ localize('No New Notification') }}
                            </h4>
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </div>
</li>