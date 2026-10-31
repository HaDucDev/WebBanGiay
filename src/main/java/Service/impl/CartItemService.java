package Service.impl;

import java.util.List;

import DAO.ICartItemDAO;
import DAO.impl.CartItemDAO;
import Model.CartItemModel;
import Model.CartModel;
import Service.ICartItemService;

public class CartItemService implements ICartItemService{
	private ICartItemDAO cartItemDao;
	
	public CartItemService() {
		cartItemDao = new CartItemDAO();
	}

	@Override
	public List<CartItemModel> getAll() {
		return cartItemDao.getAll();
	}



	@Override
	public Long save(CartItemModel cartItemModel) {
		Long id = cartItemDao.save(cartItemModel);
		return null;
	}

	@Override
	public void update(CartItemModel cartItemModel) {
		cartItemDao.update(cartItemModel);		
	}

	@Override
	public void delete(int id) {
		cartItemDao.delete(id);
		
	}

	@Override
	public CartItemModel getOne(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public  List<CartItemModel>  searchIdCart(int id) {
		return cartItemDao.searchIdCart(id);
	}

}
