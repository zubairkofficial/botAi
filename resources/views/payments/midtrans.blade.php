<html>

<head>
    <title>Midtrans Payment</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    @if (!empty($_SERVER['HTTPS']))
        <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests" />
    @endif
    <style>
        .loader {
            border: 16px solid #f3f3f3;
            border-radius: 50%;
            border-top: 16px solid #3498db;
            width: 120px;
            height: 120px;
            -webkit-animation: spin 2s linear infinite;
            /* Safari */
            animation: spin 2s linear infinite;
            margin: auto;
        }

        /* Safari */
        @-webkit-keyframes spin {
            0% {
                -webkit-transform: rotate(0deg);
            }

            100% {
                -webkit-transform: rotate(360deg);
            }
        }

        @keyframes spin {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(360deg);
            }
        }
    </style>
</head>

<body>
    <button id="checkout-button" style="display: none;"></button>
    <div class="loader"></div>
    <br>
    <br>
    <p style="width: 250px; margin: auto;">Don't close the tab. The payment is being processed . . .</p>

    <script type="text/javascript"
        @if (getSetting('midtrans_sandbox') == '0') src="https://app.midtrans.com/snap/snap.js" @else src="https://app.sandbox.midtrans.com/snap/snap.js" @endif
        data-client-key="{{ env('MIDTRANS_CLIENT_KEY') }}"></script>

    <script type="text/javascript">
        // Create an instance of the Stripe object with your publishable API key 
        var checkoutButton = document.getElementById('checkout-button');

        checkoutButton.addEventListener('click', function() {
            // Create a new Checkout Session using the server-side endpoint you
            // created in step 3.
            // Trigger snap popup. @TODO: Replace TRANSACTION_TOKEN_HERE with your transaction token
            window.snap.pay('{{ $snapToken }}', {
                onSuccess: function(result) {
                    console.log(result);
                    window.location.href = '{{ route('midtrans.callback') }}';
                },
                onPending: function(result) {
                    /* You may add your own implementation here */
                    alert("wating your payment!");
                    console.log(result);
                },
                onError: function(result) {
                    /* You may add your own implementation here */
                    alert("payment failed!");
                    console.log(result);
                },
                onClose: function() {
                    /* You may add your own implementation here */
                    alert('you closed the popup without finishing the payment');
                }
            })
        });

        document.getElementById("checkout-button").click();
    </script>



</body>

</html>
