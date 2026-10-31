package Mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import Model.CategoryModel;
import Model.ContactModel;

public class ContactMapper  implements IRowMapper<ContactModel>{

	@Override
	public ContactModel mapRow(ResultSet resultSet) {
		try {	
			ContactModel contact = new ContactModel();
			contact.setId(resultSet.getInt("id"));
			contact.setName(resultSet.getString("name"));
			contact.setEmail(resultSet.getString("email"));
			contact.setPhone(resultSet.getString("phone"));
			contact.setTitle(resultSet.getString("title"));
			contact.setMessage(resultSet.getString("message"));
			contact.setCreateByUser(resultSet.getString("createByUser"));
			contact.setCreateByDate(resultSet.getString("createByDate"));
			return contact;
		}catch(SQLException e) {
			return null;
		}
	}

}
