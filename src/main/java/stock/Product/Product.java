package stock.Product;

public class Product {
    private int productID;
    private String name;
    private String description;
    private double price;
    private String imagePath;

    // Constructor
    public Product(int productID, String name, String description, double price, String imagePath) {
        this.productID = productID;
        this.name = name;
        this.description = description;
        this.price = price;
        this.imagePath = imagePath;
    }

    // Getters and Setters
    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }
}

