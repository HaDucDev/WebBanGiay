package DAO.impl;

import java.util.List;

import DAO.IUserDAO;
import Mapper.UserMapper;
import Model.UserModel;

public class UserDAO  extends AbstractDAO<UserModel> implements IUserDAO {

	@Override
	public UserModel findByAccountStatus(String username, String password) {
	   String sql = "Select * from user where username = ? and password = ?";
	   List<UserModel> user  = query(sql.toString(),new UserMapper(), username, password);

	   return user.isEmpty() ? null : user.get(0) ;
	}
	@Override
	public UserModel getUserDetail(int id) {
		return null;
	}

	@Override
	public List<UserModel> getUserAll() {
		String sql = "Select * from user";
		return query(sql, new UserMapper());
	
	}

	

	@Override
	public void update(UserModel userModel) {
		String sql = "UPDATE user SET fullname= ? , avatar = ? , username = ? , password = ? ,address = ?, phone = ? ,createdate =?,  role = ?  WHERE id =?"; 
		  insert(sql,userModel.getFullname(),  userModel.getAvatar(), userModel.getUsername(), userModel.getPassword(), userModel.getAddress(),userModel.getPhone(), userModel.getCreatedate(),  userModel.getRole(), userModel.getId() );
	}

	@Override
	public void delete(int id) {
		String sql = "DELETE FROM user WHERE id = ?";
		update(sql, id);
		
	}
	@Override
	public UserModel findOne(Long id) {
		String sql = "SELECT * FROM user Where id = ?";
		List<UserModel> user =  query(sql, new UserMapper(), id);
		return user.isEmpty() ? null :  user.get(0);
	}
	@Override
	public Long save(UserModel userModel) {
		String sql  = "INSERT INTO user(fullname,avatar,username,password,address,phone,createdate,role) VALUES(?,?,?,?,?,?,?,?) ";
		return insert(sql, userModel.getFullname(),  userModel.getAvatar(), userModel.getUsername(), userModel.getPassword(), userModel.getAddress(),userModel.getPhone(), userModel.getCreatedate(),  userModel.getRole());
	}

}
