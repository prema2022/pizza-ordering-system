<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="net.pizza.model.CartItem" %>
<%@ page import="net.pizza.model.Pizza" %>
<!DOCTYPE html>
<html>
<head>
    <title>Your Cart</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h2 {
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

        .actions a {
            color: #ff6347;
            text-decoration: none;
            font-weight: bold;
        }

        .actions a:hover {
            text-decoration: underline;
        }

        .checkout-button {
            display: block;
            width: 200px;
            margin: 20px auto;
            padding: 10px;
            background-color: #ff6347;
            color: #fff;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .checkout-button:hover {
            background-color: #e55b3f;
        }

        .continue-shopping {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #ff6347;
            text-decoration: none;
            font-weight: bold;
        }

        .continue-shopping:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Your Cart</h2>

    <%
        // Retrieve cart and total amount from request attributes
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
                <th>Actions</th>
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
                    <td class="actions">
                        <a href="CartServlet?action=remove&pizzaId=<%= pizza.getPizzaId() %>">Remove</a>
                    </td>
                </tr>
            <%
                }
            %>
            <tr class="total-row">
                <td colspan="4" align="right"><strong>Total Amount:</strong></td>
                <td colspan="2"><strong>$<%= totalAmount %></strong></td>
            </tr>
        </table>
        <br/>
        <form action="<%= request.getContextPath() %>/CheckoutServlet" method="post">
            <button type="submit" class="checkout-button">Proceed to Checkout</button>
        </form>
    <%
        } else {
    %>
        <p>Your cart is empty.</p>
    <%
        }
    %>

    <br/>
    <a href="<%= request.getContextPath() %>/PizzaCatalogServlet" class="continue-shopping">Continue Shopping</a>
</body>
</html>