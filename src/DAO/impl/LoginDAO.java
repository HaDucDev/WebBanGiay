package DAO.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import DAO.ILoginDAO;

public class LoginDAO implements ILoginDAO{

	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/sellershopmvc";
			String user = "root";
			String password = "";
			return DriverManager.getConnection(url, user, password);		
		}catch(ClassNotFoundException | SQLException e) {
			return null;
		}
	}
	
	
	@Override
	public void LoginDAO() {
		
		
	}
	

}
