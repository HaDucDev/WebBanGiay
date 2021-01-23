package Model;

import java.util.List;

public class OrderModel {
	private int id;
	private UserModel account;
	private List<CartItemModel> cartItems;
	private String status;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	
	public UserModel getAccount() {
		return account;
	}
	public void setAccount(UserModel account) {
		this.account = account;
	}
	public List<CartItemModel> getCartItems() {
		return cartItems;
	}
	public void setCartItems(List<CartItemModel> cartItems) {
		this.cartItems = cartItems;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	

}
