package net.pizza.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import net.pizza.dao.PizzaDao;
import net.pizza.model.CartItem;
import net.pizza.model.Pizza;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        int pizzaId = Integer.parseInt(request.getParameter("pizzaId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        
        PizzaDao pizzaDAO = new PizzaDao();
        Pizza pizza = pizzaDAO.getPizzaById(pizzaId);

        CartItem cartItem = new CartItem(pizza, quantity);
        cart.add(cartItem);

        response.sendRedirect(request.getContextPath() + "/CartServlet");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new ArrayList<>();
            session.setAttribute("cart", cart);
        }

        String action = request.getParameter("action");
        if ("remove".equals(action)) {
            int pizzaId = Integer.parseInt(request.getParameter("pizzaId"));
            cart.removeIf(item -> item.getPizza().getPizzaId() == pizzaId);
        }

        double totalAmount = cart.stream().mapToDouble(CartItem::getTotalPrice).sum();

        request.setAttribute("cart", cart);
        request.setAttribute("totalAmount", totalAmount);

        request.getRequestDispatcher("/WEB-INF/views/viewCart.jsp").forward(request, response);
    }
}