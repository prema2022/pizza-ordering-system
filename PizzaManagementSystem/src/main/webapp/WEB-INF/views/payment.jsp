<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<html>
<head>
<style type="text/css">
@import url('https://fonts.googleapis.com/css?family=Montserrat:400,700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Montserrat', sans-serif;
}

body {
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background-color: #E6E6FA; /* Light purple background */
    padding: 30px 10px;
}

.card {
    max-width: 500px;
    margin: auto;
    color: black;
    border-radius: 20px;
    background-color: #fff;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    padding: 20px;
}

p {
    margin: 0px;
}

.container .h8 {
    font-size: 30px;
    font-weight: 800;
    text-align: center;
    color: #333;
    padding: 20px 0;
}

.btn.btn-primary {
    width: 100%;
    height: 70px;
    display: flex;
    align-items: center;
    justify-content: center;
    padding: 0 15px;
    background-color: #ff6347; /* Orange color */
    border: none;
    transition: 0.5s;
    color: #fff;
    font-weight: bold;
    border-radius: 4px;
}

.btn.btn.btn-primary:hover {
    background-color: #e55b3f; /* Darker orange on hover */
    color: #fff;
    text-decoration: none;
}

.btn.btn-primary:hover .fas.fa-arrow-right {
    transform: translate(15px);
    transition: transform 0.2s ease-in;
}

.form-control {
    color: #333;
    background-color: #f9f9f9;
    border: 2px solid #ddd;
    height: 60px;
    padding-left: 20px;
    vertical-align: middle;
    border-radius: 4px;
    width: 100%;
    margin-bottom: 20px;
}

.form-control:focus {
    color: #333;
    background-color: #fff;
    border: 2px solid #2d4dda;
    box-shadow: none;
}

.text {
    font-size: 14px;
    font-weight: 600;
    color: #555;
    margin-bottom: 5px;
}

::placeholder {
    font-size: 14px;
    font-weight: 600;
    color: #aaa;
}

.row {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
}

.col-12, .col-6 {
    padding: 0 15px;
}
</style>
<script type="text/javascript">
    function submitForm() {
        document.getElementById("paymentForm").submit();
    }

    function showPaymentSuccess() {
        alert("Your payment is successful!");
        window.location.href = "<%= request.getContextPath() %>/PizzaCatalogServlet";
    }
</script>
</head>
<body>
<div class="container p-0">
    <div class="card px-4">
        <p class="h8 py-3">Payment Details for Order ID: <%= request.getAttribute("orderId") %></p>
        <div class="row gx-3">
            <div class="col-12">
                <div class="d-flex flex-column">
                    <p class="text mb-1">Person Name</p>
                    <input class="form-control mb-3" type="text" placeholder="Your Name">
                </div>
            </div>
            <div class="col-12">
                <div class="d-flex flex-column">
                    <p class="text mb-1">Card Number</p>
                    <input class="form-control mb-3" type="text" placeholder="1234 5678 435678">
                </div>
            </div>
            <div class="col-6">
                <div class="d-flex flex-column">
                    <p class="text mb-1">Expiry</p>
                    <input class="form-control mb-3" type="text" placeholder="MM/YYYY">
                </div>
            </div>
            <div class="col-6">
                <div class="d-flex flex-column">
                    <p class="text mb-1">CVV/CVC</p>
                    <input class="form-control mb-3 pt-2" type="password" placeholder="***">
                </div>
            </div>
            <div class="col-12">
                <form id="paymentForm" action="<%= request.getContextPath() %>/OrderServlet" method="post">
                    <div class="btn btn-primary mb-3" onclick="showPaymentSuccess()">
                        <span class="ps-3">Pay $<%= request.getAttribute("totalAmount") %></span>
                        <span class="fas fa-arrow-right"></span>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>