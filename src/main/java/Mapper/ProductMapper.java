package Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;
import Model.ProductModel;

public class ProductMapper implements IRowMapper<ProductModel> {
	@Override
	public ProductModel mapRow(ResultSet resultSet) {
	
		try {	
			ProductModel product = new ProductModel();
			product.setId(resultSet.getInt("id"));
			product.setName(resultSet.getString("name"));
			product.setPrice(resultSet.getString("price"));
			product.setThumbnail(resultSet.getString("thumbnail"));
			product.setDescription(resultSet.getString("description"));
			product.setPromotion(resultSet.getString("promotion"));
			product.setCategory(resultSet.getInt("category"));
			product.setCreatedate(resultSet.getString("createdate"));
			
			return product;
		}catch(SQLException e) {
			return null;
		}
	}
}
