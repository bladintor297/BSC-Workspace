<!DOCTYPE html>
<html>
<head>
    <title>Payment</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body class="bg-light">
<div class="container">
<span>
Role: <%= session.getAttribute("role") %> <br>
MovieSlotID: <%= session.getAttribute("movieSlotID") %> <br>
MovieID: <%= session.getAttribute("movieID") %> <br>
PaymentID: <%= session.getAttribute("paymentID") %> <br>
CustID: <%= session.getAttribute("custID") %> <br>
CustEmail: <%= session.getAttribute("custEmail") %> <br>
Cust Name: <%= session.getAttribute("custName") %> <br>
Amount: <%= session.getAttribute("amount") %> <br>
Seats: <%= session.getAttribute("seats") %> <br>
</span>

<h3 style="text-align: center;margin-top: 40px;margin-bottom: 40px;">Payment Gateway</h3>
    <div class="row d-flex justify-content-center">
        
        <div class="col-md-7 col-md-offset-3 bg-white p-5 rounded shadow-sm">
            <div class="panel panel-default credit-card-box">
                <div class="panel-heading">
                    <div class="row">
                        <h3>Payment Details</h3>
                    </div>
                </div>
                <div class="panel-body">
                    <form role="form" action="/bsc/Payment" method="post" class="require-validation"
                          data-cc-on-file="false" data-stripe-publishable-key="pk_test_51Mu9GvJML1sZdHEFKVngLpK6np8lVup7m1dt4gB5mTQ6asrOPURFgI751M031rZYrL9uJisW90IwTNdmm9OqaKkd00M7vJtKbH" id="payment-form">

                        <div class='form-row row'>
                            <div class='col-xs-12 col-md-6 form-group required'>
                                <label class='control-label'>Name on Card</label>
                                <input class='form-control' size='4' type='text'>
                            </div>
                            <div class='col-xs-12 col-md-6 form-group required'>
                                <label class='control-label'>Card Number</label>
                                <input autocomplete='off' class='form-control card-number' size='20' type='text'>
                            </div>
                        </div>
                        <div class='form-row row'>
                            <div class='col-xs-12 col-md-4 form-group cvc required'>
                                <label class='control-label'>CVC</label>
                                <input autocomplete='off' class='form-control card-cvc' placeholder='ex. 311' size='4' type='text'>
                            </div>
                            <div class='col-xs-12 col-md-4 form-group expiration required'>
                                <label class='control-label'>Expiration Month</label>
                                <input class='form-control card-expiry-month' placeholder='MM' size='2' type='text'>
                            </div>
                            <div class='col-xs-12 col-md-4 form-group expiration required'>
                                <label class='control-label'>Expiration Year</label>
                                <input class='form-control card-expiry-year' placeholder='YYYY' size='4' type='text'>
                            </div>
                            
                        </div>
                        <div class="d-flex justify-content-center">
                        	
                                <button class="btn btn-warning btn-sm px-5 rounded-pill fw-bold" type="submit"><b>Pay Now</b></button>
                            
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>

<script type="text/javascript" src="https://js.stripe.com/v2/"></script>
<script type="text/javascript">
    $(function () {
        var $form = $(".require-validation");
        $('form.require-validation').bind('submit', function (e) {
            var $form = $(".require-validation"),
                inputSelector = ['input[type=email]', 'input[type=password]', 'input[type=text]', 'input[type=file]', 'textarea'].join(', '),
                $inputs = $form.find('.required').find(inputSelector),
                $errorMessage = $form.find('div.error'),
                valid = true;
            $errorMessage.addClass('hide');
            $('.has-error').removeClass('has-error');
            $inputs.each(function (i, el) {
                var $input = $(el);
                if ($input.val() === '') {
                    $input.parent().addClass('has-error');
                    $errorMessage.removeClass('hide');
                    e.preventDefault();
                }
            });
            if (!$form.data('cc-on-file')) {
                e.preventDefault();
                Stripe.setPublishableKey($form.data('stripe-publishable-key'));
                Stripe.createToken({
                    number: $('.card-number').val(),
                    cvc: $('.card-cvc').val(),
                    exp_month: $('.card-expiry-month').val(),
                    exp_year: $('.card-expiry-year').val()
                }, stripeResponseHandler);
            }
        });

        function stripeResponseHandler(status, response) {
            if (response.error) {
                $('.error')
                    .removeClass('hide')
                    .find('.alert')
                    .text(response.error.message);
            } else {
                /* token contains id, last4, and card type */
                var token = response['id'];
                $form.find('input[type=text]').empty();
                $form.append("<input type='hidden' name='stripeToken' value='" + token + "'/>");
                $form.get(0).submit();
            }
        }
    });
</script>
</html>