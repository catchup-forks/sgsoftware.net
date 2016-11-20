@extends('webed-theme-sgsoftware::front._master')

@section('content')
    <!--How it works-->
    <section id="how-it-works" class="how-it-works section-spacing">
        <div class="container">
            <header class="section-header text-center">
                <h2>{{ get_field($object, 'how_it_works_title') }}</h2>
                <h3>{!! get_field($object, 'how_it_works_caption') !!}</h3>
            </header>
            <div class="row">
                <div class="col-md-11 center-block">
                    @foreach(get_field($object, 'how_it_works_steps') as $key => $step)
                        @if(($key + 1) % 2 !== 0)
                            <div class="row">
                                <div class="col-md-6 col-md-push-6 text-center">
                                    <img src="{{ get_sub_field($step, 'image') }}" alt="step-{{ $key + 1 }}">
                                </div>
                                <div class="col-md-6 col-md-pull-6">
                                    <div class="step-number"><span>{{ $key + 1 }}</span></div>
                                    <h4>{{ get_sub_field($step, 'title') }}</h4>
                                    <p>{{ get_sub_field($step, 'caption') }}</p>
                                </div>
                            </div>
                        @else
                            <div class="row">
                                <div class="col-md-6 text-center">
                                    <img src="{{ get_sub_field($step, 'image') }}"
                                         alt="step-{{ $key + 1 }}"
                                         data-pin-nopin="true">
                                </div>
                                <div class="col-md-6">
                                    <div class="step-number"><span>2</span></div>
                                    <h4>{{ get_sub_field($step, 'title') }}</h4>
                                    <p>{{ get_sub_field($step, 'caption') }}</p>
                                </div>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </section>
    <!--How it works end-->

    <!--features-->
    <section class="features bg-gray text-center section-spacing" id="features">
        <div class="container">
            <header class="section-header">
                <h2>{{ get_field($object, 'our_services_title') }}</h2>
                <h3>{{ get_field($object, 'our_services_caption') }}</h3>
            </header>
            <div class="row">
                @foreach(get_field($object, 'services') as $service)
                    <div class="col-sm-6">
                        <span class="icon-features">
                          <i class="{{ get_sub_field($service, 'icon_font') }}"></i>
                        </span>

                        <h4>{{ get_sub_field($service, 'title') }}</h4>
                        {!! get_sub_field($service, 'description') !!}
                        <ul class="steps-list list-unstyled">
                            @foreach(get_sub_field($service, 'steps') as $step)
                            <li><span>{{ get_sub_field($step, 'title') }}</span></li>
                            @endforeach
                        </ul>
                    </div>
                @endforeach
            </div>
        </div>
    </section>
    <!--features end-->

    <!--client-->
    <!--section class="client text-center section-spacing">
        <div class="container">
            <header class="section-header">
                <h2>We recognize <strong>our responsibility</strong></h2>
                <h3>For Saigon Software, success means to help you succeed, we succeed</h3>
            </header>
            <div class="tn-carousel">
                <div class="swiper-container">
                    <div class="swiper-wrapper">
                        <div class="swiper-slide">
                            <img src="http://placehold.it/150x150" alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="http://placehold.it/150x150" alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="http://placehold.it/150x150" alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="http://placehold.it/150x150" alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="http://placehold.it/150x150" alt="">
                        </div>
                        <div class="swiper-slide">
                            <img src="http://placehold.it/150x150" alt="">
                        </div>
                    </div>

                    <div class="swiper-pagination"></div>
                </div>
            </div>
        </div>
    </section-->
    <!--client end-->

    <section class="testimonial bg-gray section-spacing">
        <div class="container">
            <header class="section-header text-center">
                <h2>{{ get_field($object, 'testimonial_title') }}</h2>
                <h3>{{ get_field($object, 'testimonial_caption') }}</h3>
            </header>
            <div class="row row-col2-testimonial">
                @foreach(get_field($object, 'testimonials') as $testimonial)
                <div class="col-sm-6">
                    <blockquote class="testimonial">
                        <p>{{ get_sub_field($testimonial, 'content') }}</p>
                    </blockquote>
                    <div class="testimonial-arrow-down"></div>
                    <div class="testimonial-author">
                        <div class="img-thumbnail img-thumbnail-small">
                            <img src="{{ get_sub_field($testimonial, 'avatar') }}"
                                 alt="{{ get_sub_field($testimonial, 'author') }}">
                        </div>
                        <p>
                            <strong>{{ get_sub_field($testimonial, 'author') }}</strong>
                            <span>{{ get_sub_field($testimonial, 'position') }}</span>
                        </p>
                    </div>
                </div>
                @endforeach
            </div>
        </div>
    </section>
@endsection
