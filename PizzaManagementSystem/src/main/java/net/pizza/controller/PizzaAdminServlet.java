package net.pizza.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import net.pizza.dao.PizzaDao;
import net.pizza.model.Pizza;

@WebServlet("/PizzaAdminServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class PizzaAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PizzaDao pizzaDao;

    public void init() {
        pizzaDao = new PizzaDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "add":
                    addPizza(request, response);
                    break;
                case "delete":
                    deletePizza(request, response);
                    break;
                default:
                    listPizzas(request, response);
                    break;
            }
        } catch (SQLException ex) {
            throw new ServletException(ex);
        }
    }

    // Handle Add Pizza
    private void addPizza(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        Part filePart = request.getPart("image"); // Retrieves <input type="file" name="image">

        // Define upload path
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        // Get the file name and save it to uploads folder
        String fileName = getFileName(filePart);
        String filePath = "uploads/" + fileName;
        filePart.write(uploadPath + File.separator + fileName);

        // Create Pizza object
        Pizza newPizza = new Pizza();
        newPizza.setName(name);
        newPizza.setDescription(description);
        newPizza.setPrice(price);
        newPizza.setImageUrl(filePath);

        // Add pizza to the database
        pizzaDao.addPizza(newPizza);
        response.sendRedirect(request.getContextPath() + "/ManagePizzasServlet");
    }


    // Handle Delete Pizza
    private void deletePizza(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int pizzaId = Integer.parseInt(request.getParameter("pizzaId"));
        pizzaDao.deletePizza(pizzaId);
        response.sendRedirect(request.getContextPath() + "/ManagePizzasServlet");
    }

    // List Pizzas (for redirection or listing)
    private void listPizzas(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        // Optionally implement if you have a separate listing servlet
    }

    // Utility method to get file name from Part
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("Content-Disposition header= " + contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return "";
    }
}