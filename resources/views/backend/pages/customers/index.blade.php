@extends('backend.layouts.master')

@section('title')
    {{ localize('Customers') }} {{ getSetting('title_separator') }} {{ getSetting('system_title') }}
@endsection

@section('contents')
    <section class="tt-section pt-4">
        <div class="container">
            <div class="row mb-4">
                <div class="col-12">
                    <div class="tt-page-header">
                        <div class="d-lg-flex align-items-center justify-content-lg-between">
                            <div class="tt-page-title mb-3 mb-lg-0">
                                <h1 class="h4 mb-lg-1">{{ localize('Customers') }}</h1>
                                <ol class="breadcrumb breadcrumb-angle text-muted">
                                    <li class="breadcrumb-item"><a
                                            href="{{ route('writebot.dashboard') }}">{{ localize('Dashboard') }}</a>
                                    </li>
                                    <li class="breadcrumb-item">{{ localize('Customers') }}</li>
                                </ol>
                            </div>
                            <div class="tt-action">
                                @can('add_customer')
                                    <a href="{{ route('admin.customers.create') }}" class="btn btn-primary"><i
                                            data-feather="plus"></i> {{ localize('Add Customer') }}</a>
                                @endcan
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row g-4">
                <div class="col-12">
                    <div class="card mb-4" id="section-1">
                        <form class="app-search" action="{{ Request::fullUrl() }}" method="GET">
                            <div class="card-header border-bottom-0">
                                <div class="row justify-content-between g-3">
                                    <div class="col-auto flex-grow-1">
                                        <div class="tt-search-box">
                                            <div class="input-group">
                                                <span class="position-absolute top-50 start-0 translate-middle-y ms-2"> <i
                                                        data-feather="search"></i></span>
                                                <input class="form-control rounded-start w-100" type="text"
                                                    id="search" name="search" placeholder="{{ localize('Search') }}..."
                                                    @isset($searchKey)
                                        value="{{ $searchKey }}"
                                        @endisset>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <div class="input-group">
                                            <select class="form-select select2" name="is_banned"
                                                data-minimum-results-for-search="Infinity">
                                                <option value="">{{ localize('Select status') }}</option>

                                                <option value="0"
                                                    @isset($is_banned)
                                                     @if ($is_banned == 0) selected @endif
                                                    @endisset>
                                                    {{ localize('Active') }}</option>

                                                <option value="1"
                                                    @isset($is_banned)
                                                     @if ($is_banned == 1) selected @endif
                                                    @endisset>
                                                    {{ localize('Banned') }}</option>

                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-auto">
                                        <button type="submit" class="btn btn-secondary">
                                            <i data-feather="search" width="18"></i>
                                            {{ localize('Search') }}
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>

                        <table class="table tt-footable border-top" data-use-parent-width="true">
                            <thead>
                                <tr>
                                    <th class="text-center">{{ localize('S/L') }}</th>
                                    <th>{{ localize('Name') }}</th>
                                    <th data-breakpoints="xs sm">{{ localize('Email') }}</th>
                                    <th data-breakpoints="xs sm">{{ localize('Phone') }}</th>
                                    <th data-breakpoints="xs sm">{{ localize('Banned') }}
                                    <th data-breakpoints="xs sm" class="text-end">{{ localize('Action') }}
                                    </th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($customers as $key => $customer)
                                    <tr>
                                        <td class="text-center">
                                            {{ $key + 1 + ($customers->currentPage() - 1) * $customers->perPage() }}
                                        </td>
                                        <td>
                                            <a href="javascript:void(0);" class="d-flex align-items-center">
                                                <div class="avatar avatar-sm">
                                                    <img class="rounded-circle"
                                                        src="{{ uploadedAsset($customer->avatar) }}" alt=""
                                                        onerror="this.onerror=null;this.src='{{ staticAsset('backend/assets/img/placeholder-thumb.png') }}';" />
                                                </div>
                                                <h6 class="fs-sm mb-0 ms-2">{{ $customer->name }}
                                                </h6>
                                            </a>
                                        </td>
                                        <td>
                                            {{ $customer->email }}
                                        </td>
                                        <td>
                                            {{ $customer->phone ?? localize('n/a') }}
                                        </td>
                                        <td>
                                            @can('ban_customers')
                                                <div class="form-check form-switch d-flex">
                                                    <input type="checkbox" onchange="updateBanStatus(this)"
                                                        class="form-check-input"
                                                        @if ($customer->is_banned) checked @endif
                                                        value="{{ $customer->id }}">
                                                </div>
                                            @endcan
                                        </td>

                                        <td class="text-end">
                                            <div class="dropdown tt-tb-dropdown">
                                                <button type="button" class="btn p-0" data-bs-toggle="dropdown"
                                                    aria-expanded="false">
                                                    <i data-feather="more-vertical"></i>
                                                </button>
                                                <div class="dropdown-menu dropdown-menu-end shadow">

                                                    <a class="dropdown-item"
                                                        href="{{ route('admin.customers.assignPackage', ['id' => $customer->id, 'lang_key' => env('DEFAULT_LANGUAGE')]) }}&localize">
                                                        <i data-feather="zap"
                                                            class="me-2"></i>{{ localize('Assign Package') }}
                                                    </a>

                                                    <a class="dropdown-item"
                                                        href="{{ route('admin.customers.edit', ['id' => $customer->id, 'lang_key' => env('DEFAULT_LANGUAGE')]) }}&localize">
                                                        <i data-feather="edit-3" class="me-2"></i>{{ localize('Edit') }}
                                                    </a>
                                                    <a href="#" class="dropdown-item confirm-delete"
                                                        data-href="{{ route('admin.customers.delete', $customer->id) }}"
                                                        title="{{ localize('Delete') }}">
                                                        <i data-feather="user-x" class="me-2"></i>
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
                                {{ $customers->firstItem() }}-{{ $customers->lastItem() }} {{ localize('of') }}
                                {{ $customers->total() }} {{ localize('results') }}</span>
                            <nav>
                                {{ $customers->appends(request()->input())->links() }}
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
