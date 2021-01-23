package DAO.impl;

import DAO.IContactDAO;
import Model.ContactModel;

public class ContactDAO extends AbstractDAO<ContactModel> implements IContactDAO {

	@Override
	public Long save(ContactModel contactModel) {
		String sql = "Insert into contact(id, name,	email,	phone,	title,	message,	createByUser,	createByDate	)  values(?,?,?,?,?,?,?,?)";
		return insert(sql, contactModel.getId(), contactModel.getName(), contactModel.getEmail(), contactModel.getPhone(), contactModel.getTitle(),
				contactModel.getMessage(), contactModel.getCreateByUser(), contactModel.getCreateByDate());
	}

}
