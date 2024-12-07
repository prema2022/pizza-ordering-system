package net.pizza.controller;

import java.io.IOException;
import java.util.List;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import net.pizza.dao.PizzaDao;
import net.pizza.model.Pizza;

@WebServlet("/ManagePizzasServlet")
public class ManagePizzasServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PizzaDao pizzaDao;

    public void init() {
        pizzaDao = new PizzaDao();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Pizza> pizzas = pizzaDao.getAllPizzas();
        request.setAttribute("pizzas", pizzas);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/managePizzas.jsp");
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}