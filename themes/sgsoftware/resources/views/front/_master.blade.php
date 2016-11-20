<!DOCTYPE html>
<!--[if IE 8]>
<html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]>
<html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en">
<!--<![endif]-->
<head>
    <meta charset="utf-8"/>
    <title>{{ $pageTitle or '' }} - {{ get_settings('site_title', 'WebEd') ?: 'WebEd' }}</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta content="{{ $pageTitle or '' }} - {{ get_settings('site_title', 'WebEd') ?: 'WebEd' }}" name="description"/>
    <meta content="" name="author"/>

    <base href="{{ asset('') }}">

    <link rel="stylesheet" href="{{ asset('themes/sgsoftware/css/style.css') }}">
    @php do_action('front_header_css') @endphp
    @yield('css')

    <link rel="shortcut icon" href="{{ asset(get_settings('favicon')) }}"/>

    @php do_action('front_header_js') @endphp
</head>

<body class="{{ $bodyClass or '' }} @php do_action('front_body_class') @endphp">

<div class="site-wrapper" id="site_wrapper">
    <header class="site-header header" id="header" style="background-image: url('{{ get_settings('header_background') }}');">
        @include('webed-theme-sgsoftware::front._partials.header')
    </header>

    <main class="site-main main" id="main">
        @yield('content')
    </main>

    <footer class="site-footer footer" id="footer">
        @include('webed-theme-sgsoftware::front._partials.footer')
    </footer>

    @yield('other-content')
</div>

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->

<script src="{{ asset('themes/sgsoftware/third_party/modernizr.js') }}"></script>
<script src="{{ asset('themes/sgsoftware/dist/core.min.js') }}"></script>
<script src="{{ asset('themes/sgsoftware/dist/app.min.js') }}"></script>
@php do_action('front_footer_js') @endphp
@yield('js')
@yield('js-init')

</body>

</html>