package Model;

public class CartModel {
	
	
	private int id;
	private UserModel account;
	private int u_id;
	private String buydate;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public UserModel getUser() {
		return account;
	}
	public void setAccount(UserModel account) {
		this.account = account;
	}

 	public int getU_id() {
		return u_id;
	}
	public void setU_id(int u_id) {
		this.u_id = u_id;
	}
	public String getBuydate() {
		return buydate;
	}
	public void setBuydate(String buydate) {
		this.buydate = buydate;
	}

}
