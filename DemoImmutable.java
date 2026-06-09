
final class Laptop{
    private final String model;
    private final int ram;
    private final double clockSpeed;
    public Laptop(String model, int ram, double clockSpeed) {
        this.model = model;
        this.ram = ram;
        this.clockSpeed = clockSpeed;
    }
    public String getModel() {
        return model;
    }
    public int getRam() {
        return ram;
    }
    public double getClockSpeed() {
        return clockSpeed;
    }

}

public class DemoImmutable {
    public static void main(String[] args) {
        Laptop laptop = new Laptop("Pavilion", 8, 2.9);
        
    }
}