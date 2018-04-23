package supermarket;

public class Commodity {
	private int id;
	private String name;
	private double price;
	private String picture;
	public Commodity(int id,String name,double price,String picture)
	{
		this.id=id;
		this.name=name;
		this.price=price;
		this.picture=picture;
	}
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public double getPrice() {
		return price;
	}
	public String getPicture() {
		return picture;
	}
	@Override
	public String toString() {
		return "Commodity [id=" + id + ", name=" + name + ", price=" + price
				+ ", picture=" + picture + "]";
	}
}
