package net.pizza.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.pizza.dao.OrderDao;
import net.pizza.model.CartItem;
import net.pizza.model.Order;
import net.pizza.model.OrderItem;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private OrderDao orderDao;

    @Override
    public void init() {
        orderDao = new OrderDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String customerName = request.getParameter("name");
        String customerAddress = request.getParameter("address");
        String customerEmail = request.getParameter("email");
        String phoneNumber = request.getParameter("phoneNumber"); // New field

        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");
        Double totalAmountObj = (Double) session.getAttribute("totalAmount");

        if (cart == null || cart.isEmpty() || totalAmountObj == null) {
            response.sendRedirect(request.getContextPath() + "/CartServlet");
            return;
        }

        double totalAmount = totalAmountObj.doubleValue();

        Order order = new Order();
        order.setCustomerName(customerName);
        order.setCustomerAddress(customerAddress);
        order.setCustomerEmail(customerEmail);
        order.setPhoneNumber(phoneNumber); // Set phone number
        order.setTotalAmount(totalAmount);

        List<OrderItem> orderItems = new ArrayList<>();
        for (CartItem cartItem : cart) {
            OrderItem orderItem = new OrderItem();
            orderItem.setPizza(cartItem.getPizza());
            orderItem.setQuantity(cartItem.getQuantity());
            orderItem.setTotalPrice(cartItem.getTotalPrice());
            orderItems.add(orderItem);
        }
        order.setOrderItems(orderItems);

        String orderId = orderDao.placeOrder(order);
        request.setAttribute("orderId", orderId);
        request.setAttribute("cart", cart);
        request.setAttribute("totalAmount", totalAmount);

        session.removeAttribute("cart");
        session.removeAttribute("totalAmount");

        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/orderConfirmation.jsp");
        dispatcher.forward(request, response);
    }
}