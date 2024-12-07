package net.pizza.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import net.pizza.model.CartItem;

@WebServlet("/NavigateToPayment")
public class ProcessPaymentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    private void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String orderId = request.getParameter("orderId");
        double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));

        request.setAttribute("orderId", orderId);
        request.setAttribute("totalAmount", totalAmount);

        // Forward to payment.jsp
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/payment.jsp");
        dispatcher.forward(request, response);
    }
}