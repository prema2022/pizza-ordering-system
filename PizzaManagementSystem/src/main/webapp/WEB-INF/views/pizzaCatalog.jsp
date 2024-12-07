<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="net.pizza.model.Pizza" %>

<!DOCTYPE html>
<html>
<head>
    <title>Pizza Menu</title>
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

        .pizza-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 20px;
        }

        .pizza-item {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 20px;
            width: 300px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .pizza-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .pizza-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            border-radius: 8px;
        }

        .pizza-item h3 {
            margin: 15px 0 10px;
            font-size: 1.5em;
            color: #333;
        }

        .pizza-item p {
            margin: 10px 0;
            color: #666;
        }

        .pizza-item form {
            margin-top: 15px;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .pizza-item input[type="number"] {
            width: 50px;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .pizza-item button {
            background-color: #ff6347;
            color: #fff;
            border: none;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .pizza-item button:hover {
            background-color: #e55b3f;
        }

        .view-cart {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #ff6347;
            text-decoration: none;
            font-weight: bold;
        }

        .view-cart:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Pizza Menu</h2>
   
    <%
        // Retrieve the list of pizzas from the request attribute
        List<Pizza> pizzas = (List<Pizza>) request.getAttribute("pizzas");
       
        // Check if the pizzas list is not null and not empty
        if (pizzas != null && !pizzas.isEmpty()) {
    %>
            <div class="pizza-container">
                <% for (Pizza pizza : pizzas) { %>
                    <div class="pizza-item">
                        <img src="<%= request.getContextPath() + "/" + pizza.getImageUrl() %>" alt="<%= pizza.getName() %>">
                        <h3><%= pizza.getName() %></h3>
                        <p><%= pizza.getDescription() %></p>
                        <p>Price: $<%= pizza.getPrice() %></p>
                        <form action="CartServlet" method="post">
                            <input type="hidden" name="pizzaId" value="<%= pizza.getPizzaId() %>">
                            <input type="number" name="quantity" value="1" min="1">
                            <button type="submit">Add to Cart</button>
                        </form>
                    </div>
                <% } %>
            </div>
    <%
        } else {
    %>
        <p>No pizzas available.</p>
    <%
        }
    %>
   
    <a href="<%= request.getContextPath() %>/CartServlet" class="view-cart">View Cart</a>
</body>
</html>