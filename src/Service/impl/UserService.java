package Service.impl;

import java.util.List;

import DAO.IUserDAO;
import DAO.impl.UserDAO;
import Model.UserModel;
import Service.IUserService;

public class UserService  implements IUserService {

	private IUserDAO userDao;
	
	@Override
	public UserModel findByAccountStatus(String username, String password) {
		return userDao.findByAccountStatus(username, password);
	}
	
	public UserService() {
		userDao = new UserDAO();
	}
	


	@Override
	public UserModel getUserDetail(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<UserModel> getUserAll() {
		return userDao.getUserAll();
	}

	@Override
	public UserModel save(UserModel roleModel) {
		Long id_product =  userDao.save(roleModel);
		return userDao.findOne(id_product);
	}

	@Override
	public UserModel update(UserModel roleModel) {
		userDao.update(roleModel);
		return userDao.findOne((long) roleModel.getId());
	}

	@Override
	public void delete(int id) {
		userDao.delete(id);
	}

}
