package Service;

import java.util.List;

import Model.CartModel;
import Model.ProductModel;

public interface ICartService {
	List<CartModel> getCartAll();
	CartModel getOne(int id);
	CartModel save(CartModel cartModel);
	void update(CartModel cartModel);
	void delete(int id);

}
