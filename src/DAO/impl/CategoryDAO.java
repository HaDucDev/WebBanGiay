package DAO.impl;

import java.util.List;

import DAO.ICategoryDAO;
import Mapper.CategoryMapper;
import Mapper.ProductMapper;
import Model.CategoryModel;
import Model.ProductModel;

public class CategoryDAO  extends AbstractDAO<CategoryModel>  implements ICategoryDAO {
	
	@Override
	public List<CategoryModel> GetCategoryAlL() {
		String sql = "SELECT * FROM category";
		return query(sql, new CategoryMapper());
	}

	@Override
	public Long save(CategoryModel categoryModel) {
		String sql  = "INSERT INTO category(id, name) VALUES (?,?) ";
		return insert(sql, categoryModel.getId(), categoryModel.getName());
	}
//	@Override
//	public Long save(CategoryModel categoryModel) {
//		ResultSet resultSet = null;
//		Long id = null;
//		Connection  connection = null;
//		PreparedStatement  statement = null;
//		try {
//			String sql  = "INSERT INTO category(id_category, code, name) VALUES (?,?,?) ";
//           connection = getConnection();
//           connection.setAutoCommit(false);
//			statement = connection.prepareStatement(sql,  Statement.RETURN_GENERATED_KEYS);
//			statement.setLong(1,categoryModel.getId_category() );
//			statement.setString(2, categoryModel.getCode());
//			statement.setString(3, categoryModel.getName());
//			statement.executeUpdate();
//			resultSet = statement.getGeneratedKeys();
//			if(resultSet.next()) {
//				id =  resultSet.getLong(1);
//			}
//			connection.commit();
//			return id;
//		}catch(SQLException e) {
//			if(connection != null) {
//				try {
//					connection.rollback();
//				} catch (SQLException e1) {
//					e1.printStackTrace();
//				}
//			}
//			 e.printStackTrace();
//		}
//		finally {
//			try {
//				if(connection != null) {
//					connection.close();
//				}
//				if(statement != null) {
//					statement.close();
//				}
//				if(resultSet != null) {
//					resultSet.close();
//				}
//				}catch(SQLException e) {
//					return null;
//				}
//		}
//	 return null;
//	
//	}

		@Override
		public int getTotalItem() {
			String sql = "SELECT count(*) FROM category";
			return count(sql);
		}

		@Override
		public void update(CategoryModel categoryModel) {
			String sql = "UPDATE category SET name = ?  WHERE id =?"; 
			  insert(sql,   categoryModel.getName(), categoryModel.getId());
		}

		@Override
		public void delete(int id) {
			String sql = "DELETE FROM category WHERE id = ?";
			update(sql, id);
			
		}

		@Override
		public CategoryModel findOne(Long id) {
			String sql = "SELECT * FROM category Where id = ?";
			List<CategoryModel> category =  query(sql, new CategoryMapper(), id);
			return category.isEmpty() ? null :  category.get(0);
		}



}
