package DAO;

import java.util.List;

import Model.CartModel;
import Model.ProductModel;

public interface ICartDAO extends GenericDAO<CartModel> {
	List<CartModel> getCartAll();
	CartModel getOne(Long id);
	Long save(CartModel cartModel);
	void update(CartModel cartModel);
	void delete(int id);
	

}
