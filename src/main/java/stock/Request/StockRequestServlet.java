package stock.Request;

import stock.DBConnect.DBConnect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/StockRequestServlet")
public class StockRequestServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        try {
            conn = DBConnect.getConnection();
            StockRequestDBUtil dbUtil = new StockRequestDBUtil(conn);
            List<StockRequest> requestList = dbUtil.getAllRequests();
            request.setAttribute("requestList", requestList);
            request.getRequestDispatcher("StockRequest.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        Connection conn = null;

        try {
            conn = DBConnect.getConnection();
            StockRequestDBUtil dbUtil = new StockRequestDBUtil(conn);

            if ("add".equals(action)) {
                StockRequest stockRequest = new StockRequest();
                stockRequest.setProductID(Integer.parseInt(request.getParameter("productID")));
                stockRequest.setName(request.getParameter("name"));
                stockRequest.setDescription(request.getParameter("description"));
                stockRequest.setQty(Integer.parseInt(request.getParameter("qty")));
                dbUtil.addStockRequest(stockRequest);
            } else if ("update".equals(action)) {
                StockRequest stockRequest = new StockRequest();
                stockRequest.setStockID(Integer.parseInt(request.getParameter("stockID")));
                stockRequest.setProductID(Integer.parseInt(request.getParameter("productID")));
                stockRequest.setName(request.getParameter("name"));
                stockRequest.setDescription(request.getParameter("description"));
                stockRequest.setQty(Integer.parseInt(request.getParameter("qty")));
                dbUtil.updateStockRequest(stockRequest);
            } else if ("delete".equals(action)) {
                int stockID = Integer.parseInt(request.getParameter("stockID"));
                dbUtil.deleteStockRequest(stockID);
            }

            response.sendRedirect("StockRequestServlet"); // Redirect to doGet to refresh the list
        } catch (SQLException e) {
            e.printStackTrace();
            throw new ServletException("Database error", e);
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
