package Service;

import java.util.List;

import Model.ProductModel;
import Model.UserModel;

public interface IUserService {
	UserModel findByAccountStatus(String username, String password);
	UserModel save(UserModel roleModel);
	UserModel getUserDetail(int id);
	List<UserModel> getUserAll();
	UserModel update(UserModel roleModel);
	void delete(int id);
}
