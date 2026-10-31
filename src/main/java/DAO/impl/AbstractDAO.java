package DAO.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.ResourceBundle;

import DAO.GenericDAO;
import Mapper.IRowMapper;

public class AbstractDAO<T> implements GenericDAO<T> {
	
	public Connection getConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/storeshoes";
			String user = "root";
			String password = "";
			return DriverManager.getConnection(url, user, password);
			
			
		}catch(ClassNotFoundException | SQLException e) {
			return null;
		}
	} 
	
	@Override
	public <T> List<T> query(String sql, IRowMapper<T> rowMapper, Object... parameters) {
		List<T> results = new ArrayList<>();
		Connection connection = null;
		PreparedStatement statement = null;
		ResultSet resultSet = null;
		
		try {
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			setParameter(statement, parameters);
			resultSet = statement.executeQuery();   
			while(resultSet.next()) {
				results.add(rowMapper.mapRow(resultSet));
			}
			return results;
		}catch(SQLException e) {
			return null;
		}
		finally {
			try {
				if(connection != null) {
					connection.close();
				}
				if(statement != null) {
					statement.close();
				}
				if(resultSet != null) {
					resultSet.close();
				}
				}catch(SQLException e) {
					return null;
				}
		}
	}

	private void setParameter(PreparedStatement statement, Object... parameters) {
		try {
			for(int i = 0 ;  i < parameters.length; i++) {
				Object parameter = parameters[i];
				int index = i + 1;
			  if(parameter instanceof Long ) {
				  statement.setLong(index, (Long)parameter);
			  }
			  else if(parameter instanceof String ) {
				  statement.setString(index, (String)parameter);
			  }
			  else if(parameter instanceof Integer ) {
				  statement.setInt(index, (Integer)parameter);
			  }
			  else if(parameter instanceof Timestamp ) {
				  statement.setTimestamp(index,(Timestamp) parameter);
			  }
			  else if(parameter == null ) {
				  statement.setNull(index, Types.NULL);
			  }
		}
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public void update(String sql, Object... parameters) {
		Connection  connection = null;
		PreparedStatement  statement = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql);
			setParameter(statement, parameters);
			statement.executeUpdate(); 
			connection.commit();
			
			
		}catch(SQLException e) {
			if(connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}
		finally {
			try {
				if(connection != null) {
					connection.close();
				}
				if(statement != null) {
					statement.close();
				}
			
			}catch(SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public Long insert(String sql, Object... parameters) {
		ResultSet resultSet = null;
		Long id = null;
		Connection  connection = null;
		PreparedStatement  statement = null;
		try {
			connection = getConnection();
			connection.setAutoCommit(false);
			statement = connection.prepareStatement(sql,  Statement.RETURN_GENERATED_KEYS);
			setParameter(statement, parameters);
			statement.executeUpdate(); 
			resultSet = statement.getGeneratedKeys();
			if(resultSet.next()) {
				id = resultSet.getLong(1);
			}
			connection.commit();
			return id;
			
		}catch(SQLException e) {
			if(connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}
		finally {
			try {
				if(connection != null) {
					connection.close();
				}
				if(statement != null) {
					statement.close();
				}
				if(resultSet != null) {
					resultSet.close();
				}
				}catch(SQLException e) {
					e.printStackTrace();
				}
		}
		return id;
		
	}

	@Override
	public int count(String sql, Object... parameters) {
		ResultSet resultSet = null;
		Connection  connection = null;
		PreparedStatement  statement = null;
		try {
			int count = 0;
			connection = getConnection();
			statement = connection.prepareStatement(sql);
			setParameter(statement, parameters);
			resultSet =  statement.executeQuery(); 
			while(resultSet.next()) {
              count = resultSet.getInt(1);
			
			}
			connection.commit();
			return count;
			
		}catch(SQLException e) {
			if(connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
			e.printStackTrace();
		}
		finally {
			try {
				if(connection != null) {
					connection.close();
				}
				if(statement != null) {
					statement.close();
				}
				if(resultSet != null) {
					resultSet.close();
				}
				}catch(SQLException e) {
					e.printStackTrace();
					return 0;
				}
		}
		return 0;
	
	}

}
