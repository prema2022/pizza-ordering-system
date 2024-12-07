<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Pizza</title>
    <style type="text/css">
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

        .add-pizza-form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .add-pizza-form label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
            color: #333;
        }

        .add-pizza-form input[type="text"],
        .add-pizza-form input[type="number"],
        .add-pizza-form textarea,
        .add-pizza-form input[type="file"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1em;
        }

        .add-pizza-form textarea {
            resize: vertical;
        }

        .add-pizza-form button {
            padding: 10px 20px;
            background-color: #ff6347;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 1em;
            transition: background-color 0.3s ease;
        }

        .add-pizza-form button:hover {
            background-color: #e65100;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            color: #ff6347;
            text-decoration: none;
            font-weight: bold;
        }

        .back-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <h2>Add New Pizza</h2>
    <form action="PizzaAdminServlet?action=add" method="post" enctype="multipart/form-data" class="add-pizza-form">
        <input type="hidden" name="action" value="add">
        <label for="name">Name:</label>
        <input type="text" name="name" required>
        
        <label for="description">Description:</label>
        <textarea name="description" rows="5" required></textarea>
        
        <label for="price">Price:</label>
        <input type="number" name="price" step="0.01" required>
        
        <label for="image">Upload Image:</label>
        <input type="file" name="image" accept="image/*" required>
        
        <button type="submit">Add Pizza</button>
    </form>
    <br/>
    <a href="<%= request.getContextPath() %>/ManagePizzasServlet" class="back-link">Back to Manage Pizzas</a>
</body>
</html>