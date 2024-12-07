package net.pizza.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UserRegisterServlet
 */
@WebServlet("/Userregister")
public class UserRegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the registration page
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/newuserregister.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form parameters
        String customer_name = request.getParameter("username");
        String paskey = request.getParameter("pswrd");
        String paskey1 = request.getParameter("pswrd1");

        RequestDispatcher dispatcher = null;
        Connection con = null;

        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish a connection to the database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pizza_ordering_system?useSSL=false", "root", "root");

            // Prepare the SQL statement
            String sql = "INSERT INTO customerlogin (customer_name, paskey, paskey1) VALUES (?, ?, ?)";
            java.sql.PreparedStatement pst = con.prepareStatement(sql);

            // Set parameters for the prepared statement
            pst.setString(1, customer_name);
            pst.setString(2, paskey);
            pst.setString(3, paskey1);

            // Debugging: Print the SQL statement and parameters
            System.out.println("SQL: " + sql);
            System.out.println("Parameters: " + customer_name + ", " + paskey + ", " + paskey1);

            // Execute the insert statement
            int row = pst.executeUpdate();

            // Debugging: Print the result of the executeUpdate method
            System.out.println("Rows affected: " + row);

            // Set the request dispatcher
            dispatcher = request.getRequestDispatcher("/WEB-INF/views/newuserregister.jsp");

            // Check if the insertion was successful
            if (row > 0) {
                request.setAttribute("status", "success");
            } else {
                request.setAttribute("status", "failed");
            }

            // Forward the request and response to the dispatcher
            dispatcher.forward(request, response);

        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            // Handle exceptions by setting an error status
            request.setAttribute("status", "error");
            dispatcher = request.getRequestDispatcher("/WEB-INF/views/newuserregister.jsp");
            dispatcher.forward(request, response);
        } finally {
            // Close the database connection
            try {
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}