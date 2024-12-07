<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="net.pizza.model.CartItem" %>
<%@ page import="net.pizza.model.Pizza" %>
<!DOCTYPE html>
<html>
<head>
    <title>Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2, h3 {
            text-align: center;
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

        form {
            width: 80%;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #333;
        }

        input[type="text"], input[type="email"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 1em;
        }

        textarea {
            resize: vertical;
        }

        button {
            display: block;
            width: 100%;
            padding: 10px;
            background-color: #ff6347;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border: none;
            border-radius: 4px;
            font-weight: bold;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #e55b3f;
        }
    </style>
</head>
<body>
    <h2>Checkout</h2>

    <%
        List<CartItem> cart = (List<CartItem>) request.getAttribute("cart");
        Double totalAmount = (Double) request.getAttribute("totalAmount");

        if (cart != null && !cart.isEmpty()) {
    %>
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
       
        <h3>Shipping Details</h3>
        <form action="<%= request.getContextPath() %>/OrderServlet" method="post">
            <label for="name">Name:</label>
            <input type="text" name="name" required>
            <label for="address">Address:</label>
            <textarea name="address" required></textarea>
            <label for="email">Email:</label>
            <input type="email" name="email" required>
            <label for="phoneNumber">Phone Number:</label>
            <input type="text" name="phoneNumber" required>
            <button type="submit">Continue to Payment</button>
        </form>
    <%
        } else {
    %>
        <p>Your cart is empty.</p>
    <%
        }
    %>
</body>
</html>