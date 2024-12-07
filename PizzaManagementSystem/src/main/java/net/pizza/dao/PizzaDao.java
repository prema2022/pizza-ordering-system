package net.pizza.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import net.pizza.model.Pizza;

public class PizzaDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/pizza_ordering_system?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    private static final String SELECT_ALL_PIZZAS = "SELECT * FROM Pizzas";
    private static final String INSERT_PIZZA_SQL = "INSERT INTO Pizzas (name, description, price, image_url) VALUES (?, ?, ?, ?)";
    private static final String SELECT_PIZZA_BY_ID = "SELECT * FROM Pizzas WHERE pizza_id = ?";
    private static final String UPDATE_PIZZA_SQL = "UPDATE Pizzas SET name = ?, description = ?, price = ?, image_url = ? WHERE pizza_id = ?";
    private static final String DELETE_PIZZA_SQL = "DELETE FROM Pizzas WHERE pizza_id = ?";

    // Constructor
    public PizzaDao() {}

    // Get Database Connection
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Ensure MySQL JDBC Driver is loaded
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException e) {
            // Handle SQL Exception
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // Handle Class Not Found Exception
            e.printStackTrace();
        }
        return connection;
    }

    // Retrieve All Pizzas
    public List<Pizza> getAllPizzas() {
        List<Pizza> pizzas = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_PIZZAS);
             ResultSet rs = preparedStatement.executeQuery()) {

            while (rs.next()) {
                int id = rs.getInt("pizza_id");
                String name = rs.getString("name");
                String description = rs.getString("description");
                double price = rs.getDouble("price");
                String imageUrl = rs.getString("image_url");
                Pizza pizza = new Pizza();
                pizza.setPizzaId(id);
                pizza.setName(name);
                pizza.setDescription(description);
                pizza.setPrice(price);
                pizza.setImageUrl(imageUrl);
                pizzas.add(pizza);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return pizzas;
    }

    // Add New Pizza
    public boolean addPizza(Pizza pizza) {
        boolean rowInserted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_PIZZA_SQL)) {
            preparedStatement.setString(1, pizza.getName());
            preparedStatement.setString(2, pizza.getDescription());
            preparedStatement.setDouble(3, pizza.getPrice());
            preparedStatement.setString(4, pizza.getImageUrl());
            rowInserted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowInserted;
    }

    // Select Pizza by ID
    public Pizza getPizzaById(int id) {
        Pizza pizza = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_PIZZA_BY_ID)) {
            preparedStatement.setInt(1, id);
            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name");
                    String description = rs.getString("description");
                    double price = rs.getDouble("price");
                    String imageUrl = rs.getString("image_url");
                    pizza = new Pizza();
                    pizza.setPizzaId(id);
                    pizza.setName(name);
                    pizza.setDescription(description);
                    pizza.setPrice(price);
                    pizza.setImageUrl(imageUrl);
                }
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return pizza;
    }

    // Delete Pizza
    public boolean deletePizza(int id) {
        boolean rowDeleted = false;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(DELETE_PIZZA_SQL)) {
            preparedStatement.setInt(1, id);
            rowDeleted = preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return rowDeleted;
    }

    // Utility method to print SQL Exceptions
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException)e).getSQLState());
                System.err.println("Error Code: " + ((SQLException)e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while(t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}