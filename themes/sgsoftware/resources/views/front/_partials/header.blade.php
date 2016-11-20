<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="{{ url('') }}">
                <img src="{{ asset('themes/sgsoftware/images/logo-w.png') }}" alt="">
            </a>
        </div>

        {!! $cmsMenuHtml or '' !!}
    </div>
</nav>
<!--navigation end-->

<div class="header-text">
    <h2>WE BUILD YOUR DREAM </h2>
    <p>We create our themes with a thought of our customers, therefore our team</p>
    <div class="cross-btn">
        <a href="#how-it-works" title="Read More" class="btn btn-primary">Read more</a>
    </div>
</div>
