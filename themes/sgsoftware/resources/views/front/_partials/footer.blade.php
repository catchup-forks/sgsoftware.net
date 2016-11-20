<div class="tn-footer container">
    <div class="row">
        <div class="footer-ribbon">
            <span>Get in Touch</span>
        </div>
        {{--<div class="col-md-4">
            <div class="contact-form">
                <h4>Newsletter</h4>
                <div class="textwidget">
                    <p>Keep up on our always evolving product features and technology. Enter your e-mail and subscribe
                        to our
                        newsletter.</p>
                    <form id="newsletterForm" action="index.html" method="POST">
                        <div class="input-group">
                            <input class="form-control" placeholder="Email Address" name="email" id="email" type="text"
                                   value="">
                            <span class="input-group-btn">
												<button class="btn btn-default" type="submit">Go!</button>
											</span>
                        </div>
                    </form>
                </div>
            </div>
        </div>--}}
        <div class="col-md-5">
            <div class="contact-details">
                <h4>Contact Us</h4>
                <ul>
                    <li class="first">
                        <p>
                            <i class="fa fa-map-marker"></i>
                            <strong>Address:</strong>
                            {{ get_settings('address') }}
                        </p>
                    </li>
                    <li>
                        <p><i class="fa fa-phone"></i> <strong>Phone:</strong> {{ get_settings('phone') }}</p>
                    </li>
                    <li class="last">
                        <p>
                            <i class="fa fa-envelope"></i>
                            <strong>Email:</strong>
                            <a href="mailto:{{ get_settings('contact_email') }}">{{ get_settings('contact_email') }}</a>
                        </p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="col-md-3">
            <div class="contact-social">
                <h4>Follow Us</h4>
                <ul class="social-icons">
                    <li class="tn-socialicon first">
                        <a href="{{ get_settings('facebook') }}" target="_blank" class="fa fa-facebook"></a>
                    </li>
                    <li class="tn-socialicon">
                        <a href="{{ get_settings('youtube') }}" target="_blank" class="fa fa-youtube"></a>
                    </li>
                    <li class="tn-socialicon last">
                        <a href="{{ get_settings('github') }}" target="_blank" class="fa fa-github"></a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<div class="container footer-copyright">
    <div class="tn-wrapfix">&copy; 2016 Saigon Software Co.LTD</div>
</div>
