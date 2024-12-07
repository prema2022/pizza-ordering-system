package net.pizza.dao;

import net.pizza.model.Order;
import net.pizza.model.OrderItem;
import net.pizza.model.Pizza;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private String jdbcURL = "jdbc:mysql://localhost:3306/pizza_ordering_system?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "root";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }

    public String placeOrder(Order order) {
        String orderId = null;
        String insertOrderSQL = "INSERT INTO orders (customer_name, customer_address, customer_email, phone_number, total_amount) VALUES (?, ?, ?, ?, ?)";
        String insertOrderItemSQL = "INSERT INTO order_items (order_id, pizza_id, quantity) VALUES (?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement orderStmt = connection.prepareStatement(insertOrderSQL, Statement.RETURN_GENERATED_KEYS)) {

            orderStmt.setString(1, order.getCustomerName());
            orderStmt.setString(2, order.getCustomerAddress());
            orderStmt.setString(3, order.getCustomerEmail());
            orderStmt.setString(4, order.getPhoneNumber()); // New field
            orderStmt.setDouble(5, order.getTotalAmount());

            int affectedRows = orderStmt.executeUpdate();
            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }

            try (ResultSet generatedKeys = orderStmt.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getString(1);
                } else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }

            try (PreparedStatement orderItemStmt = connection.prepareStatement(insertOrderItemSQL)) {
                for (OrderItem item : order.getOrderItems()) {
                    orderItemStmt.setString(1, orderId);
                    orderItemStmt.setInt(2, item.getPizza().getPizzaId());
                    orderItemStmt.setInt(3, item.getQuantity());
                    orderItemStmt.addBatch();
                }
                orderItemStmt.executeBatch();
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orderId;
    }

    public List<Order> getAllOrdersWithItems() {
        List<Order> orders = new ArrayList<>();
        String orderQuery = "SELECT * FROM orders";
        String orderItemsQuery = "SELECT oi.*, p.name, p.price, p.image_url " +
                                 "FROM order_items oi " +
                                 "JOIN pizzas p ON oi.pizza_id = p.pizza_id " +
                                 "WHERE oi.order_id = ?";

        try (Connection connection = getConnection();
             PreparedStatement orderStmt = connection.prepareStatement(orderQuery);
             PreparedStatement orderItemsStmt = connection.prepareStatement(orderItemsQuery)) {

            ResultSet orderRs = orderStmt.executeQuery();

            while (orderRs.next()) {
                Order order = new Order();
                order.setOrderId(orderRs.getString("order_id"));
                order.setCustomerName(orderRs.getString("customer_name"));
                order.setCustomerAddress(orderRs.getString("customer_address"));
                order.setCustomerEmail(orderRs.getString("customer_email"));
                order.setPhoneNumber(orderRs.getString("phone_number")); // New field
                order.setTotalAmount(orderRs.getDouble("total_amount"));

                // Retrieve items for each order
                List<OrderItem> orderItems = new ArrayList<>();
                orderItemsStmt.setString(1, order.getOrderId());
                ResultSet itemsRs = orderItemsStmt.executeQuery();

                while (itemsRs.next()) {
                    OrderItem item = new OrderItem();
                    Pizza pizza = new Pizza();
                    pizza.setPizzaId(itemsRs.getInt("pizza_id"));
                    pizza.setName(itemsRs.getString("name"));
                    pizza.setPrice(itemsRs.getDouble("price"));
                    pizza.setImageUrl(itemsRs.getString("image_url"));
                    item.setPizza(pizza);
                    item.setQuantity(itemsRs.getInt("quantity"));
                    item.setTotalPrice(itemsRs.getDouble("price") * item.getQuantity());
                    orderItems.add(item);
                }

                order.setOrderItems(orderItems);
                orders.add(order);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders; // Ensure the method returns a List<Order>
    }
}