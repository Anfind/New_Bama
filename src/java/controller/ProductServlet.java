package controller;

import dao.ProductDAO;
import model.Product;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class ProductServlet extends HttpServlet {
    private ProductDAO productDAO;

    @Override
    public void init() throws ServletException {
        productDAO = new ProductDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listProducts(request, response);
                break;
            case "detail":
                showProductDetail(request, response);
                break;
            case "category":
                listProductsByCategory(request, response);
                break;
            case "search":
                searchProducts(request, response);
                break;
            default:
                listProducts(request, response);
                break;
        }
    }

    private void listProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Product> products = productDAO.getAllProducts();
        request.setAttribute("products", products);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }

    private void showProductDetail(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String productIdStr = request.getParameter("id");

        if (productIdStr == null || productIdStr.trim().isEmpty()) {
            response.sendRedirect("product?action=list");
            return;
        }

        try {
            int productId = Integer.parseInt(productIdStr);
            Product product = productDAO.getProductById(productId);

            if (product != null) {
                request.setAttribute("product", product);
                request.getRequestDispatcher("/product-detail.jsp").forward(request, response);
            } else {
                response.sendRedirect("product?action=list");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect("product?action=list");
        }
    }

    private void listProductsByCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String category = request.getParameter("category");

        if (category == null || category.trim().isEmpty()) {
            listProducts(request, response);
            return;
        }

        List<Product> products = productDAO.getProductsByCategory(category);
        request.setAttribute("products", products);
        request.setAttribute("currentCategory", category);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }

    private void searchProducts(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String keyword = request.getParameter("keyword");

        if (keyword == null || keyword.trim().isEmpty()) {
            listProducts(request, response);
            return;
        }

        List<Product> products = productDAO.searchProducts(keyword);
        request.setAttribute("products", products);
        request.setAttribute("searchKeyword", keyword);
        request.getRequestDispatcher("/products.jsp").forward(request, response);
    }
}
