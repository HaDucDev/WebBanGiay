package Service;

import java.util.List;

import Model.CartItemModel;
import Model.CartModel;

public interface ICartItemService {
	List<CartItemModel> getAll();
	CartItemModel getOne(int id);
	Long save(CartItemModel cartItemModel);
	void update(CartItemModel cartItemModel);
	void delete(int id);
	List<CartItemModel> searchIdCart(int id);

}
