<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Stripe Custom Form Example</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://js.stripe.com/v3/"></script>
</head>
<body>
<div class="container">
  <div class="row">
    <div class="col-md-6 offset-md-3">
      <h2 class="text-center mt-5">Stripe Custom Form Example</h2>

      <form id="payment-form">
        <div class="form-group">
          <label for="card-number">Card Number</label>
          <div id="card-number" class="form-control"></div>
        </div>
        <div class="form-group">
          <label for="card-expiry">Expiration Date</label>
          <div id="card-expiry" class="form-control"></div>
        </div>
        <div class="form-group">
          <label for="card-cvc">CVC</label>
          <div id="card-cvc" class="form-control"></div>
        </div>

        <button id="submit-button" class="btn btn-primary mt-3" type="submit">Pay</button>
      </form>
      <div id="payment-result" class="mt-3"></div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.7/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>

<script>
  const stripe = Stripe('pk_test_TYooMQauvdEDq54NiTphI7jx'); // 使用你的 Stripe 公钥
  const elements = stripe.elements();

  const cardNumber = elements.create('cardNumber');
  cardNumber.mount('#card-number');

  const cardExpiry = elements.create('cardExpiry');
  cardExpiry.mount('#card-expiry');

  const cardCvc = elements.create('cardCvc');
  cardCvc.mount('#card-cvc');

  const form = document.getElementById('payment-form');
  const submitButton = document.getElementById('submit-button');
  const paymentResult = document.getElementById('payment-result');

  form.addEventListener('submit', async (event) => {
    event.preventDefault();
    submitButton.disabled = true;

    const response = await fetch('/create-payment-intent', { method: 'POST' });
    const { clientSecret } = await response.json();

    const result = await stripe.confirmCardPayment(clientSecret, {
      payment_method: {
        card: cardNumber
      }
    });

    if (result.error) {
      paymentResult.innerText = 'Payment failed: ' + result.error.message;
      paymentResult.classList.add('text-danger');
      submitButton.disabled = false;
    } else {
      paymentResult.innerText = 'Payment successful!';

      paymentResult.classList.add('text-success');
      submitButton.disabled = false;


    }
  });
</script>