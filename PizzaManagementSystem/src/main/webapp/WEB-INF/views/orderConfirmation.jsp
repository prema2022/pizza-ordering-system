<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="net.pizza.model.CartItem" %>
<%@ page import="net.pizza.model.Pizza" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        p {
            color: #555;
            font-size: 1.1em;
            margin: 10px 0;
        }

        strong {
            color: #333;
        }

        table {
            width: 80%;
            border-collapse: collapse;
            margin: 20px auto;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }

        img {
            width: 100px;
            height: 80px;
            object-fit: cover;
            border-radius: 4px;
        }

        .total-row {
            background-color: #f9f9f9;
            font-weight: bold;
        }

        .continue-shopping {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #ff6347;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .continue-shopping:hover {
            background-color: #e55b3f;
        }

        .payment-button {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .payment-button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <h2>Order Confirmation</h2>

    <%
        String orderId = (String) request.getAttribute("orderId");
        List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
        Double totalAmount = (Double) request.getAttribute("totalAmount");

        if (orderId != null && cart != null && !cart.isEmpty()) {
    %>
        <p>Thank you for your order! Your order ID is <strong><%= orderId %></strong>.</p>
       
        <table>
            <tr>
                <th>Image</th>
                <th>Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Total</th>
            </tr>
            <%
                for (CartItem item : cart) {
                    Pizza pizza = item.getPizza();
            %>
                <tr>
                    <td><img src="<%= request.getContextPath() + "/" + pizza.getImageUrl() %>" alt="<%= pizza.getName() %>"/></td>
                    <td><%= pizza.getName() %></td>
                    <td>$<%= pizza.getPrice() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td>$<%= item.getTotalPrice() %></td>
                </tr>
            <%
                }
            %>
            <tr class="total-row">
                <td colspan="4" align="right"><strong>Total Amount:</strong></td>
                <td><strong>$<%= totalAmount %></strong></td>
            </tr>
        </table>

        <p>We appreciate your business.</p>
    <%
        } else {
    %>
        <p>Your Payment is Successful</p>
    <%
        }
    %>
    <form action="<%= request.getContextPath() %>/NavigateToPayment" method="post">
        <input type="hidden" name="orderId" value="<%= orderId %>">
        <input type="hidden" name="totalAmount" value="<%= totalAmount %>">
        <button type="submit" class="payment-button">Continue to Payment</button>
    </form>
    <a href="<%= request.getContextPath() %>/PizzaCatalogServlet" class="continue-shopping">Continue Shopping</a>
</body>
</html>