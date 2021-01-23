package Service.impl;

import DAO.IContactDAO;
import DAO.impl.ContactDAO;
import Model.ContactModel;
import Service.IContactService;

public class ContactService implements IContactService {

	private IContactDAO contactDao ;
	public ContactService() {
		contactDao = new ContactDAO();
	}
	
	@Override
	public ContactModel save(ContactModel contactModel) {
		Long id =contactDao.save(contactModel);
		return null;
	}
 
}
