# Stripe Alipay Demo App

## Overview
This project is a demonstration of how to use Stripe to accept Ant Financial's Alipay payments. Unlike credit card payments where the the only action needed is input of the credit card info, Alipay has a few extra steps. Here's an overview of the workflow:

1. Customer performs an action that initiates the transaction, e.g. checkout.
2. On the backend, we create a source object using the Stripe API that contains our credentials and info on the transaction e.g. amount.
3. The API returns a source object which includes a redirect URL. The redirect URL contains a Alipay generated QR code which has the details of this transaction. 
4. The customer scans the QR code using their Alipay mobile app. This app tells Alipay that the customer is authorizing a payment from their account to our account. 
5. The source now becomes chargeable. We can setup a webhook (from Stripe dashboard) to ping our server with this notification.
6. When the source is chargeable, we make a charge request using the Stripe API.
7. Voila, the money is now in your account!

## Getting this Demo to work

1. Get your Stripe API keys and set them in your ENV variables see the stripe initializer file for details.
2. I have this demo running as a heroku project. This is necessary to get the webhook to hit your server.
3. Setup your Stripe webhook to point to the `actual_charge` endpoint e.g. `http://heroku.herokuapp.com/actual_charge`
3. Navigate to `create_source` to initiate the transaction
