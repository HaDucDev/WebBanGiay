package Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.CategoryModel;

public class CategoryMapper implements IRowMapper<CategoryModel> {

	@Override
	public CategoryModel mapRow(ResultSet resultSet) {
		try {	
			CategoryModel category = new CategoryModel();
			category.setId(resultSet.getInt("id"));
			category.setCode(resultSet.getString("code"));
			category.setName(resultSet.getString("name"));
			return category;
		}catch(SQLException e) {
			return null;
		}
	}
}
