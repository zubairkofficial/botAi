@extends('backend.layouts.master')

@section('title')
    {{ localize('Queries') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('contents')
    <section class="tt-section pt-4">
        <div class="container">
            <div class="row mb-4">
                <div class="col-12">
                    <div class="tt-page-header">
                        <div class="d-lg-flex align-items-center justify-content-lg-between">
                            <div class="tt-page-title mb-3 mb-lg-0">
                                <h1 class="h4 mb-lg-1">{{ localize('Queries') }}</h1>
                                <ol class="breadcrumb breadcrumb-angle text-muted">
                                    <li class="breadcrumb-item"><a
                                            href="{{ route('writebot.dashboard') }}">{{ localize('Dashboard') }}</a>
                                    </li>
                                    <li class="breadcrumb-item">{{ localize('Queries') }}</li>
                                </ol>
                            </div>
                            <div class="tt-action">
                                <button type="button" class="tt-remove btn btn-soft-danger d-flex align-items-center"
                                    data-bs-toggle="tooltip" data-bs-placement="top"
                                    data-bs-title="{{ localize('Remove all data') }}"
                                    data-href="{{ route('admin.queries.deleteAll') }}" onclick="confirmAllDelete(this)"><i
                                        data-feather="trash-2" class="icon-12 btn-icon"></i>
                                    <span class="ms-1">{{ localize('Delete All') }}</span></button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row g-4">
                <div class="col-12">
                    <div class="card mb-4" id="section-1">

                        <table class="table tt-footable align-middle" data-use-parent-width="true">
                            <thead>
                                <tr>
                                    <th class="text-center">{{ localize('S/L') }}</th>
                                    <th>{{ localize('Name') }}</th>
                                    <th data-breakpoints="xs sm">{{ localize('Email') }}</th>
                                    <th data-breakpoints="xs sm">{{ localize('Phone') }}</th>
                                    <th data-breakpoints="xs sm">{{ localize('Issue') }}</th>
                                    <th data-breakpoints="xs sm md lg xl">{{ localize('Message') }}</th>
                                    <th data-breakpoints="xs sm" class="text-end">{{ localize('Action') }}
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($messages as $key => $message)
                                    <tr class="{{ $message->is_seen == 0 ? 'fw-bold' : 'fw-light' }}">
                                        <td class="text-center">
                                            {{ $key + 1 + ($messages->currentPage() - 1) * $messages->perPage() }}
                                        </td>

                                        <td> {{ $message->name }} </td>

                                        <td>
                                            <a href="mailto:{{ $message->email }}"
                                                class="text-dark">{{ $message->email }}</a>
                                        </td>

                                        <td>
                                            {{ $message->phone ?? localize('n/a') }}
                                        </td>

                                        <td>

                                            {{ Str::title(Str::replace('_', ' ', $message->support_for)) }}
                                        </td>


                                        <td>
                                            {{ $message->message }}
                                        </td>

                                        <td class="text-end">
                                            <div class="dropdown tt-tb-dropdown">
                                                <button type="button" class="btn p-0" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                    <i data-feather="more-vertical"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end shadow">

                                                    <a class="dropdown-item"
                                                        href="{{ route('admin.queries.markRead', ['id' => $message->id, 'lang_key' => env('DEFAULT_LANGUAGE')]) }}&localize">
                                                        <i data-feather="check"
                                                            class="me-2"></i>{{ $message->is_seen == 0 ? localize('Mark As Read') : localize('Mark As Unread') }}
                                                    </a>

                                                    <a class="dropdown-item" href="mailto:{{ $message->email }}">
                                                        <i data-feather="message-circle"
                                                            class="me-2"></i>{{ localize('Reply in Email') }}
                                                    </a>

                                                    {{-- <a href="#" class="dropdown-item confirm-hide"
                                                        data-href="{{ route('admin.queries.delete', $message->id) }}"
                                                        title="{{ localize('Hide') }}">
                                                        <i data-feather="eye-off" class="me-2"></i>
                                                        {{ localize('Hide') }}
                                                    </a> --}}

                                                    <a href="#" class="dropdown-item confirm-delete"
                                                        data-href="{{ route('admin.queries.delete', [$message->id, 'clear']) }}"
                                                        title="{{ localize('Delete') }}">
                                                        <i data-feather="trash-2" class="me-2"></i>
                                                        {{ localize('Delete') }}
                                                    </a>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <!--pagination start-->
                        <div class="d-flex align-items-center justify-content-between px-4 pb-4">
                            <span>{{ localize('Showing') }}
                                {{ $messages->firstItem() }}-{{ $messages->lastItem() }} {{ localize('of') }}
                                {{ $messages->total() }} {{ localize('results') }}</span>
                            <nav>
                                {{ $messages->appends(request()->input())->links() }}
                            </nav>
                        </div>
                        <!--pagination end-->
                    </div>
                </div>
            </div>
        </div>
    </section>
@endsection


@section('scripts')
    <script>
        "use strict";

        function updateBanStatus(el) {
            if (el.checked) {
                var status = 1;
            } else {
                var status = 0;
            }
            $.post('{{ route('admin.customers.updateBanStatus') }}', {
                    _token: '{{ csrf_token() }}',
                    id: el.value,
                    status: status
                },
                function(data) {
                    if (data == 1) {
                        notifyMe('success', '{{ localize('Status updated successfully') }}');

                    } else {
                        notifyMe('danger', '{{ localize('Something went wrong') }}');
                    }
                });
        }
    </script>
@endsection
