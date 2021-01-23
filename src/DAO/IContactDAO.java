package DAO;

import Model.ContactModel;

public interface IContactDAO extends GenericDAO<ContactModel> {
      Long save(ContactModel contacModel);
}
