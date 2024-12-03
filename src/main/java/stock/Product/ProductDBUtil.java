package stock.Product;

import stock.DBConnect.DBConnect;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ProductDBUtil {

    // Fetch all products from the database
    public static List<Product> getAllProducts() throws SQLException {
        List<Product> productList = new ArrayList<>();
        Connection con = DBConnect.getConnection();  // Use DBConnect for connection
        Statement stmt = con.createStatement();
        String query = "SELECT * FROM stock";
        ResultSet rs = stmt.executeQuery(query);

        while (rs.next()) {
            Product product = new Product(
                rs.getInt("productID"),
                rs.getString("name"),
                rs.getString("description"),
                rs.getDouble("price"),
                rs.getString("image_path")
            );
            productList.add(product);
        }
        rs.close();
        stmt.close();
        con.close();
        return productList;
    }

    // Insert a new product into the database
    public static boolean insertProduct(Product product) throws SQLException {
        Connection con = DBConnect.getConnection();  // Use DBConnect for connection
        String query = "INSERT INTO stock (name, description, price, image_path) VALUES (?, ?, ?, ?)";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, product.getName());
        pstmt.setString(2, product.getDescription());
        pstmt.setDouble(3, product.getPrice());
        pstmt.setString(4, product.getImagePath());
        int rowsInserted = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return rowsInserted > 0;
    }

    // Update an existing product
    public static boolean updateProduct(Product product) throws SQLException {
        Connection con = DBConnect.getConnection();  // Use DBConnect for connection
        String query = "UPDATE stock SET name = ?, description = ?, price = ?, image_path = ? WHERE productID = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, product.getName());
        pstmt.setString(2, product.getDescription());
        pstmt.setDouble(3, product.getPrice());
        pstmt.setString(4, product.getImagePath());
        pstmt.setInt(5, product.getProductID());
        int rowsUpdated = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return rowsUpdated > 0;
    }

    // Delete a product from the database
    public static boolean deleteProduct(int productID) throws SQLException {
        Connection con = DBConnect.getConnection();  // Use DBConnect for connection
        String query = "DELETE FROM stock WHERE productID = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, productID);
        int rowsDeleted = pstmt.executeUpdate();
        pstmt.close();
        con.close();
        return rowsDeleted > 0;
    }
    
    public static Product getProductById(int productID) throws SQLException {
        Connection con = DBConnect.getConnection();  // Use DBConnect for connection
        String query = "SELECT * FROM stock WHERE productID = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setInt(1, productID);
        ResultSet rs = pstmt.executeQuery();

        Product product = null;
        if (rs.next()) {
            product = new Product(
                rs.getInt("productID"),
                rs.getString("name"),
                rs.getString("description"),
                rs.getDouble("price"),
                rs.getString("image_path")
            );
        }
        rs.close();
        pstmt.close();
        con.close();
        return product;
    }
}
