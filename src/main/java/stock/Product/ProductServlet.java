package stock.Product;

//import jakarta.servlet.*;
//import jakarta.servlet.http.*;
import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.SQLException;

@WebServlet("/ProductServlet")
public class ProductServlet extends HttpServlet {
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<Product> products = ProductDBUtil.getAllProducts();
            System.out.println("Hello "); // Debug line
            request.setAttribute("productList", products);
            RequestDispatcher dispatcher = request.getRequestDispatcher("Product.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        try {
            switch (action) {
                case "create":
                    createProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    listProducts(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void createProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String imagePath = request.getParameter("image_path");

        Product newProduct = new Product(0, name, description, price, imagePath);
        ProductDBUtil.insertProduct(newProduct);
        response.sendRedirect("ProductServlet");
    }
    
    

    private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        String imagePath = request.getParameter("image_path");

        Product updatedProduct = new Product(productID, name, description, price, imagePath);
        ProductDBUtil.updateProduct(updatedProduct);
        response.sendRedirect("ProductServlet");
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int productID = Integer.parseInt(request.getParameter("productID"));
        ProductDBUtil.deleteProduct(productID);
        response.sendRedirect("ProductServlet");
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException, ServletException {
        List<Product> productList = ProductDBUtil.getAllProducts();
        System.out.println("Hello ");
        request.setAttribute("productList", productList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("Product.jsp");
        dispatcher.forward(request, response);
    }
}
