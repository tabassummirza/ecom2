<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../base.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <title>Order Page</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <style>
        /* Enhanced CSS styling with animations and transitions */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }

        .container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            animation: fadeIn 1s ease;
        }

        .fade {
            opacity: 0;
            height: 0;
            transition: opacity 0.5s, height 0.5s ease-in-out;
        }

        .fade.show {
            opacity: 1;
            height: auto;
        }

        .slide-in {
            transform: translateY(-20px);
            opacity: 0;
            transition: transform 0.4s ease, opacity 0.4s ease;
        }

        .slide-in.show {
            transform: translateY(0);
            opacity: 1;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* Styling for Billing Address */
        p {
            font-weight: bold;
            color: #444;
        }

        label {
            font-weight: 500;
            color: #555;
        }

        input, select {
            border-radius: 5px;
            border: 1px solid #ddd;
            padding: 10px;
            font-size: 14px;
        }

        input:focus, select:focus {
            outline: none;
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.25);
        }

        .btn {
            padding: 12px 16px;
            border-radius: 5px;
            font-size: 16px;
            font-weight: bold;
        }

        .bg-primary {
            background-color: #007bff !important;
            transition: background-color 0.3s;
        }

        .bg-primary:hover {
            background-color: #0056b3 !important;
        }

        .btn-deliver {
            background-color: #28a745;
            color: #fff;
            transition: background-color 0.3s;
        }

        .btn-deliver:hover {
            background-color: #218838;
        }

        /* Transition effect for payment type */
        #payment-section {
            overflow: hidden;
            max-height: 0;
            opacity: 0;
            transition: max-height 0.5s ease-out, opacity 0.5s ease-out;
        }

        #payment-section.show {
            max-height: 500px;
            opacity: 1;
            transition: max-height 0.5s ease-in, opacity 0.5s ease-in;
        }
    </style>
</head>
<body>
    <section>
        <div class="container mt-5 p-5">
            <form action="${pageContext.request.contextPath}/user/save-order" method="post" id="orders" novalidate>
                <div class="row">
                    <div class="col-md-6">
                        <div class="mb-3">
                            <p class="text-center fs-4">Billing Address</p>
                            <hr>
                            <div class="row">
                                <div class="col p-1">
                                    <label for="firstName">First Name</label>
                                    <input type="text" id="firstName" name="firstName" required class="form-control mt-1">
                                </div>
                                <div class="col p-1">
                                    <label for="lastName">Last Name</label>
                                    <input type="text" id="lastName" name="lastName" required class="form-control mt-1">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col p-1">
                                    <label for="email">Email</label>
                                    <input type="email" id="email" name="email" required class="form-control">
                                </div>
                                <div class="col p-1">
                                    <label for="mobileNo">Mobile Number</label>
                                    <input type="text" id="mobileNo" name="mobileNo" required class="form-control ms-2">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col p-1">
                                    <label for="address">Address</label>
                                    <input type="text" id="address" name="address" required class="form-control">
                                </div>
                                <div class="col p-1">
                                    <label for="city">City</label>
                                    <input type="text" id="city" name="city" required class="form-control ms-2">
                                </div>
                            </div>
                            <div class="row">
                                <div class="col p-1">
                                    <label for="state">State</label>
                                    <input type="text" id="state" name="state" required class="form-control">
                                </div>
                                <div class="col p-1">
                                    <label for="pincode">Pincode</label>
                                    <input type="number" id="pincode" name="pincode" required class="form-control ms-2">
                                </div>
                            </div>
                            <!-- Deliver Here Button -->
                            <div class="text-center mt-4">
                                <button type="button" id="deliver-here" class="btn btn-deliver">Deliver Here</button>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-6 slide-in" id="payment-section">
                        <p class="text-center fs-4">Payment Type</p>
                        <hr>
                        <div class="card">
                            <div class="card-body">
                                <table class="table table-borderless">
                                    <tbody>
                                        <tr>
                                            <td>Price</td>
                                            <td>:</td>
                                            <td>&#8377; ${orderPrice}</td>
                                        </tr>
                                        <tr>
                                            <td>Delivery Fee</td>
                                            <td>:</td>
                                            <td>&#8377; 50</td>
                                        </tr>
                                        <tr>
                                            <td>Tax</td>
                                            <td>:</td>
                                            <td>&#8377; 10</td>
                                        </tr>
                                        <tr class="border-top">
                                            <td>Total Price</td>
                                            <td>:</td>
                                            <td>&#8377; ${totalOrderPrice}</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div class="card shadow p-3 mb-5 mt-2 bg-body-tertiary rounded">
                            <div class="card-body">
                                <div class="mb-3">
                                    <label for="paymentType" class="form-label">Select Payment Type</label>
                                    <select required id="paymentType" name="paymentType" class="form-control">
                                        <option value="">--select--</option>
                                        <option value="COD">Cash On Delivery</option>
                                        <option value="ONLINE">Online Payment</option>
                                    </select>
                                </div>
                                <button type="button" id="razorpay-button" class="btn bg-primary text-white col-md-12" style="display:none;">Pay with Razorpay</button>
                                <button type="submit" id="place-order" class="btn bg-primary text-white col-md-12">Place Order</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </section>

    <script type="text/javascript">
    // Toggle Payment Section on Deliver Here button click
    document.getElementById('deliver-here').addEventListener('click', function () {
        const paymentSection = document.getElementById('payment-section');
        paymentSection.classList.toggle('show');
    });

    // Show or hide Razorpay button based on payment type selection
    document.getElementById('paymentType').addEventListener('change', function () {
        const paymentType = this.value;
        const razorpayButton = document.getElementById('razorpay-button');
        const placeOrderButton = document.getElementById('place-order');

        if (paymentType === 'ONLINE') {
            razorpayButton.style.display = 'block';
            placeOrderButton.style.display = 'none';
        } else {
            razorpayButton.style.display = 'none';
            placeOrderButton.style.display = 'block';
        }
    });



    // Trigger Razorpay Checkout

    document.getElementById('razorpay-button').addEventListener('click', function (e) {

    e.preventDefault();



    const totalOrderPrice = ${totalOrderPrice}; // Ensure this is a valid number

    const options = {

    "key": "rzp_test_kOZuSgBkSmpz5o", // Replace with your Razorpay Key ID

    "amount": totalOrderPrice * 100, // Razorpay accepts amount in paise (multiply by 100)

    "currency": "INR",

    "name": "E-Commerce Website",

    "description": "Order Payment",

    "handler": function (response) {

    // After payment is successful, submit form with Razorpay response ID

    const form = document.getElementById('orders');

    const input = document.createElement('input');

    input.type = 'hidden';

    input.name = 'razorpayPaymentId';

    input.value = response.razorpay_payment_id;

    form.appendChild(input);

    form.submit();

    },

    "prefill": {

    "name": document.getElementsByName('firstName')[0].value + ' ' + document.getElementsByName('lastName')[0].value,

    "email": document.getElementsByName('email')[0].value,

    "contact": document.getElementsByName('mobileNo')[0].value

    },

    "theme": {

    "color": "#3399cc"

    }

    };



    const rzp1 = new Razorpay(options);

    rzp1.open();

    });

    </script>
</body>
</html>
