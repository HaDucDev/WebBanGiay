package Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.ProductModel;
import Model.UserModel;

public class UserMapper implements IRowMapper<UserModel> {
	
	@Override
	public UserModel mapRow(ResultSet resultSet) {
		try {	
			UserModel user = new UserModel();
			user.setId(resultSet.getInt("id"));
			user.setFullname(resultSet.getString("fullname"));
			user.setAvatar(resultSet.getString("avatar"));
			user.setUsername(resultSet.getString("username"));
			user.setPassword(resultSet.getString("password"));
			user.setPhone(resultSet.getString("phone"));
			user.setAddress(resultSet.getString("address"));
			user.setCreatedate(resultSet.getString("createdate"));
			user.setRole(resultSet.getString("role"));
			return user;
		}catch(SQLException e) {
			return null;
		}
	}

}
