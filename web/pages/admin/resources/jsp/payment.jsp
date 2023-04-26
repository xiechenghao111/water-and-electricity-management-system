<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment</title>
  <script src="https://js.stripe.com/v3/"></script>
  <style>
    /* Add your custom styles here */
  </style>
</head>
<body>
<form id="payment-form">
  <div id="card-element">
    <!-- Elements will create input elements here -->
  </div>
  <button id="submit">Pay</button>
  <div id="payment-result"></div>
</form>

<script>
  const stripe = Stripe('<pk_test_51MnmJyI3NJ8AqXYJjXR0vd0UeyiiddPh6m5PZztK8gDEWmK8WqwaBA6KG0b95NirEZrG9wUGmrbMSorSMZl4wd0v000BWj4PKV>');
  const elements = stripe.elements();
  const cardElement = elements.create('card');
  cardElement.mount('#card-element');

  const form = document.getElementById('payment-form');
  const resultContainer = document.getElementById('payment-result');

  form.addEventListener('submit', async (e) => {
    e.preventDefault();
    const { paymentIntent, error } = await stripe.createPaymentIntent({
      amount: 1000, // Replace this with the desired amount in cents
      currency: 'usd',
    });

    if (error) {
      resultContainer.textContent = `Error: ${error.message}`;
    } else {
      const result = await stripe.confirmCardPayment(paymentIntent.client_secret, {
        payment_method: {
          card: cardElement,
          billing_details: {
            name: 'Test User', // Replace this with the actual user's name
          },
        },
      });

      if (result.error) {
        resultContainer.textContent = `Error: ${result.error.message}`;
      } else {
        resultContainer.textContent = 'Payment successful!';
      }
    }
  });
</script>
</body>
</html>
