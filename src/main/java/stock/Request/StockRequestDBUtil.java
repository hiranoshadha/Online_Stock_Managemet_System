package stock.Request;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StockRequestDBUtil {
    private Connection connection;

    public StockRequestDBUtil(Connection connection) {
        this.connection = connection;
    }

    public List<StockRequest> getAllRequests() throws SQLException {
        List<StockRequest> requestList = new ArrayList<>();
        String query = "SELECT * FROM stock_request";

        try (Statement stmt = connection.createStatement();
             ResultSet rs = stmt.executeQuery(query)) {

            while (rs.next()) {
                StockRequest stockRequest = new StockRequest();
                stockRequest.setStockID(rs.getInt("stockID"));
                stockRequest.setProductID(rs.getInt("productID"));
                stockRequest.setName(rs.getString("name"));
                stockRequest.setDescription(rs.getString("description"));
                stockRequest.setQty(rs.getInt("qty"));
                requestList.add(stockRequest);
            }
        }

        return requestList;
    }

    public void addStockRequest(StockRequest stockRequest) throws SQLException {
        String query = "INSERT INTO stock_request (productID, name, description, qty) VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, stockRequest.getProductID());
            pstmt.setString(2, stockRequest.getName());
            pstmt.setString(3, stockRequest.getDescription());
            pstmt.setInt(4, stockRequest.getQty());
            pstmt.executeUpdate();
        }
    }

    public void updateStockRequest(StockRequest stockRequest) throws SQLException {
        String query = "UPDATE stock_request SET productID = ?, name = ?, description = ?, qty = ? WHERE stockID = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, stockRequest.getProductID());
            pstmt.setString(2, stockRequest.getName());
            pstmt.setString(3, stockRequest.getDescription());
            pstmt.setInt(4, stockRequest.getQty());
            pstmt.setInt(5, stockRequest.getStockID());
            pstmt.executeUpdate();
        }
    }

    public void deleteStockRequest(int stockID) throws SQLException {
        String query = "DELETE FROM stock_request WHERE stockID = ?";

        try (PreparedStatement pstmt = connection.prepareStatement(query)) {
            pstmt.setInt(1, stockID);
            pstmt.executeUpdate();
        }
    }
}
