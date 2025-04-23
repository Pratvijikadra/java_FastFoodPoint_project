import java.io.InputStream;

public class MenuItem {
    private int foodId;
    private String name;
    private String category;
    private double price;
    private InputStream imageStream;

    public MenuItem(int foodId, String name, String category, double price, InputStream imageStream) {
        this.foodId = foodId;
        this.name = name;
        this.category = category;
        this.price = price;
        this.imageStream = imageStream;
    }

    public int getFoodId() {
        return foodId;
    }

    public String getName() {
        return name;
    }

    public String getCategory() {
        return category;
    }

    public double getPrice() {
        return price;
    }

    public InputStream getImageStream() {
        return imageStream;
    }
}
