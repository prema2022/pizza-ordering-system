package net.pizza.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;

import jakarta.servlet.RequestDispatcher;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

/**
 * Servlet implementation class Login
 */
@WebServlet("/userlogin")
public class UserLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserLoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Forward the request to the login.jsp page
    	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/userlogin.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String customer_name = request.getParameter("username");
        String paskey = request.getParameter("pswrd");
        HttpSession session = request.getSession();
        jakarta.servlet.RequestDispatcher dispatcher = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/pizza_ordering_system?useSSL=false", "root", "root");
            java.sql.PreparedStatement pst = con.prepareStatement("select * from customerlogin where customer_name = ? and paskey = ?");
            pst.setString(1, customer_name);
            pst.setString(2, paskey);
            
            java.sql.ResultSet rs = pst.executeQuery();
            
            if (rs.next()) {
                session.setAttribute("name", rs.getString("customer_name"));
                // Redirect to AdminOrderServlet
                response.sendRedirect(request.getContextPath() + "/PizzaCatalogServlet");
            } else {
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("WEB-INF/views/userlogin.jsp");
            }
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}