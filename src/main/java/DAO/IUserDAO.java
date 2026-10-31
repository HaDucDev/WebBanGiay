package DAO;

import java.util.List;

import Model.ProductModel;
import Model.UserModel;

public interface IUserDAO extends GenericDAO<UserModel>{
	UserModel getUserDetail(int id);
	UserModel findOne(Long id);
	  List<UserModel> getUserAll();
	  Long save(UserModel userModel);
	  void update(UserModel userModel);
	  void delete(int id);
  	UserModel findByAccountStatus(String username, String password);

}
