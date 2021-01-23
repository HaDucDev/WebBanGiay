package Service.impl;

import java.util.List;

import DAO.ICartDAO;
import DAO.impl.CartDAO;
import Model.CartModel;
import Model.ProductModel;
import Service.ICartService;

public class CartService implements ICartService {

	private ICartDAO cartDao;
	public CartService() {
		cartDao = new CartDAO();
	}
	


	@Override
	public List<CartModel> getCartAll() {
		return cartDao.getCartAll();
	}

	@Override
	public CartModel getOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public CartModel save(CartModel cartModel) {
		Long id = cartDao.save(cartModel);
		return cartDao.getOne(id);
	}

	
	@Override
	public void update(CartModel cartModel) {
		cartDao.update(cartModel);
	}

	@Override
	public void delete(int id) {
        cartDao.delete(id);		
	}

}
