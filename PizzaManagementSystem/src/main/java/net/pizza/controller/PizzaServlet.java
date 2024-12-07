package net.pizza.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import net.pizza.dao.PizzaDao;
import net.pizza.model.Pizza;

import java.io.IOException;
import java.util.List;

@WebServlet("/PizzaCatalogServlet")
public class PizzaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PizzaDao pizzaDao;

    @Override
    public void init() {
        pizzaDao = new PizzaDao();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Fetch the list of pizzas from the database
        List<Pizza> pizzas = pizzaDao.getAllPizzas();
       
        // Set the list of pizzas as a request attribute
        request.setAttribute("pizzas", pizzas);
       
        // Forward to pizzacatalog.jsp to render the menu
        RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/pizzaCatalog.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forwards POST requests to doGet for simplicity
        doGet(request, response);
    }
}