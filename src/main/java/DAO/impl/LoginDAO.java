package DAO.impl;

import java.sql.Connection;
import java.sql.SQLException;

import DAO.ILoginDAO;
import utils.DatabaseConnection;

public class LoginDAO implements ILoginDAO{

	
	public Connection getConnection() throws SQLException {
		return DatabaseConnection.getConnection();
	}
	
	@Override
	public void LoginDAO() {
		
		
	}
	

}
