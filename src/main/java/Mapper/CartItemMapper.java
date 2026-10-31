package Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.CartItemModel;
import Model.CartModel;
import Model.ProductModel;

public class CartItemMapper  implements IRowMapper<CartItemModel> {

	@Override
	public CartItemModel mapRow(ResultSet resultSet) {
		try {
			
			CartItemModel  cartItemModel = new CartItemModel();
			cartItemModel.setId(resultSet.getInt("id"));
			cartItemModel.setQuantity(resultSet.getInt("quantity"));
			cartItemModel.setPro_id(resultSet.getInt("pro_id"));
			cartItemModel.setCart_id(resultSet.getInt("cart_id"));
			cartItemModel.setPrice(resultSet.getString("price"));
			
			return cartItemModel;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return null;
	}

}
