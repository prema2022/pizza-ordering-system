<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="net.pizza.model.Order" %>
<%@ page import="net.pizza.model.OrderItem" %>
<%@ page import="net.pizza.model.Pizza" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin - Customer Orders</title>
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

        .button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ff6347;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .button:hover {
            background-color: #e55b3f;
        }

        .order-container {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .order-container h3 {
            margin-top: 0;
            color: #333;
        }

        .order-container p {
            margin: 10px 0;
            color: #555;
        }

        .item-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .item-table th, .item-table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .item-table th {
            background-color: #f2f2f2;
            font-weight: bold;
            color: #333;
        }

        .item-table img {
            width: 80px;
            height: 50px;
            object-fit: cover;
            border-radius: 4px;
        }

        hr {
            border: 0;
            height: 1px;
            background: #ddd;
            margin: 20px 0;
        }
    </style>
</head>
<body>

    <h2> <a href="<%= request.getContextPath() %>/ManagePizzasServlet" class="button">Manage Pizza </a> </h2>
    <h2>Customer Orders</h2>

    <%
        List<Order> orders = (List<Order>) request.getAttribute("orders");
        if (orders != null && !orders.isEmpty()) {
            for (Order order : orders) {
    %>
        <div class="order-container">
            <h3>Order ID: <%= order.getOrderId() %></h3>
            <p>Customer Name: <%= order.getCustomerName() %></p>
            <p>Customer Address: <%= order.getCustomerAddress() %></p>
            <p>Customer Email: <%= order.getCustomerEmail() %></p>
            <p>Phone Number: <%= order.getPhoneNumber() %></p>
            <p>Total Amount: $<%= order.getTotalAmount() %></p>

            <h4>Order Items</h4>
            <table class="item-table">
                <tr>
                    <th>Image</th>
                    <th>Pizza Name</th>
                    <th>Price</th>
                    <th>Quantity</th>
                    <th>Total Price</th>
                </tr>
                <%
                    for (OrderItem item : order.getOrderItems()) {
                        Pizza pizza = item.getPizza();
                %>
                <tr>
                    <td><img src="<%= request.getContextPath() + "/" + pizza.getImageUrl() %>" alt="<%= pizza.getName() %>" /></td>
                    <td><%= pizza.getName() %></td>
                    <td>$<%= pizza.getPrice() %></td>
                    <td><%= item.getQuantity() %></td>
                    <td>$<%= item.getTotalPrice() %></td>
                </tr>
                <%
                    }
                %>
            </table>
            <hr>
        </div>
    <%
            }
        } else {
    %>
        <p>No orders found.</p>
    <%
        }
    %>
</body>
</html>