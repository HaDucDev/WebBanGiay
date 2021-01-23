package DAO.impl;

import java.util.List;

import DAO.ICartItemDAO;
import Mapper.CartItemMapper;
import Mapper.CartMapper;
import Model.CartItemModel;
import Model.CartModel;

public class CartItemDAO extends AbstractDAO<CartItemModel> implements ICartItemDAO {

	@Override
	public List<CartItemModel> getAll() {
		String sql  = "select * from cartitem";
		return query(sql,new CartItemMapper());
	}


	@Override
	public Long save(CartItemModel cartItemModel) {
		String sql  = "INSERT INTO cartitem(cart_id, pro_id, quantity, price) VALUES(?,?,?,?) ";
		return insert(sql, cartItemModel.getCart_id(), cartItemModel.getPro_id(), cartItemModel.getQuantity(), cartItemModel.getPrice());
	}

	@Override
	public void update(CartItemModel cartItemModel) {
		
		String sql = "UPDATE cartitem SET cart_id = ? , pro_id = ?, quantity = ? , price = ?  WHERE id =?"; 
		  insert(sql, cartItemModel.getCart_id(), cartItemModel.getPro_id(), cartItemModel.getQuantity(), cartItemModel.getPrice(), cartItemModel.getId());
	
		
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM cartitem WHERE id = ?";
		update(sql, id);
		
	}


	@Override
	public CartItemModel getOne(int id) {
		String sql  = "Select * from cartitem where id = ?";
		List<CartItemModel> cartItem =  query(sql, new CartItemMapper(), id);
		return cartItem.isEmpty() ? null :  cartItem.get(0);
	}


	@Override
	public List<CartItemModel> searchIdCart(int id) {
		String sql  = "Select * from cartitem where cart_id = ?";
		return query(sql, new CartItemMapper(), id);
		
	}

}
