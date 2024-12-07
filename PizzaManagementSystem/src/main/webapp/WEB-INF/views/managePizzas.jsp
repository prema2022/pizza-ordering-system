<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="net.pizza.model.Pizza" %>
<%@ page import="net.pizza.dao.PizzaDao" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Pizzas</title>
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

        a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #ff6347;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        a:hover {
            background-color: #e55b3f;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
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

        .actions a {
            color: #ff6347;
            text-decoration: none;
            margin-right: 10px;
            font-weight: bold;
        }

        .actions a:hover {
            text-decoration: underline;
        }

        .actions a:last-child {
            margin-right: 0;
        }

        .no-pizzas {
            text-align: center;
            color: #555;
            font-size: 1.2em;
            margin-top: 20px;
        }

        .delete-button {
            color: #fff;
            background-color: #e74c3c;
            padding: 5px 10px;
            border-radius: 4px;
            text-decoration: none;
            transition: background-color 0.3s ease;
            border: none;
            cursor: pointer;
        }

        .delete-button:hover {
            background-color: #c0392b;
        }
    </style>
</head>
<body>
    <h2>Manage Pizzas</h2>
    <a href="<%= request.getContextPath() %>/AddPizzaServlet">Add New Pizza</a>
    <br/><br/>

    <%
        // Instantiate PizzaDao and fetch all pizzas
        PizzaDao pizzaDao = new PizzaDao();
        List<Pizza> pizzas = pizzaDao.getAllPizzas();

        if (pizzas != null && !pizzas.isEmpty()) {
    %>
    <table>
        <tr>
            <th>ID</th>
            <th>Image</th>
            <th>Name</th>
            <th>Description</th>
            <th>Price</th>
            <th>Actions</th>
        </tr>
        <% for (Pizza pizza : pizzas) { %>
            <tr>
                <td><%= pizza.getPizzaId() %></td>
                <td><img src="<%= request.getContextPath() + "/" + pizza.getImageUrl() %>" alt="<%= pizza.getName() %>"/></td>
                <td><%= pizza.getName() %></td>
                <td><%= pizza.getDescription() %></td>
                <td>$<%= pizza.getPrice() %></td>
                <td class="actions">
                    <form action="PizzaAdminServlet" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete">
                        <input type="hidden" name="pizzaId" value="<%= pizza.getPizzaId() %>">
                        <button type="submit" class="delete-button" onclick="return confirm('Are you sure you want to delete this pizza?');">Delete</button>
                    </form>
                </td>
            </tr>
        <% } %>
    </table>
    <% 
        } else { 
    %>
        <p class="no-pizzas">No pizzas available.</p>
    <% 
        } 
    %>

</body>
</html>