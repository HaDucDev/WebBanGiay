package DAO.impl;

import java.util.List;

import DAO.IProductDAO;
import Mapper.CategoryMapper;
import Mapper.ProductMapper;
import Model.CategoryModel;
import Model.ProductModel;

public class ProductDAO extends AbstractDAO<ProductModel>  implements IProductDAO {

	@Override
	public List<ProductModel> findProductId() {
		String sql = "SELECT * FROM product";
		return query(sql, new ProductMapper());
	}

	@Override
	public List<ProductModel> getProductAll() {
		String sql = "SELECT * FROM product";
		return query(sql, new ProductMapper());
	}
	
	@Override
	public Long save(ProductModel productModel) {
		String sql  = "INSERT INTO product(name, price,thumbnail, description, promotion, category,createdate) VALUES (?,?,?,?,?,?,?)";
		return insert(sql, productModel.getName(), productModel.getPrice(), productModel.getThumbnail(), 
				productModel.getDescription(), productModel.getPromotion(),
				productModel.getCategory(),productModel.getCreatedate());
	}

	@Override
	public ProductModel findOne(Long id) {
		String sql = "SELECT * FROM product Where id = ?";
		List<ProductModel> product =  query(sql, new ProductMapper(), id);
		return product.isEmpty() ? null :  product.get(0);
	}

	@Override
	public void update(ProductModel productModel) {
		String sql = "UPDATE product SET name = ? , price = ?, thumbnail = ?,description = ?, promotion = ? , category = ?, createdate = ?  WHERE id =?"; 
		  insert(sql,   productModel.getName(), productModel.getPrice(), productModel.getThumbnail(), 
					 productModel.getDescription(), productModel.getPromotion(),
					productModel.getCategory(),productModel.getCreatedate(), productModel.getId());
	}


	@Override
	public void delete(int id) {
		
		String sql = "DELETE FROM product WHERE id = ?";
		update(sql, id);
		
	}


	@Override
	public List<ProductModel> getTopProducts() {
		String sql = "Select * from product where type = 'topproduct'";
		return query(sql, new ProductMapper());
	}


	@Override
	public List<ProductModel> getNewProducts() {
		String sql = "Select * from product where type ='newproduct'";
		return query(sql, new ProductMapper());
	}


	@Override
	public List<ProductModel> getMenShoes() {
		String sql = "Select * from product where id = ? ";
		return query(sql,new ProductMapper(), 1);
	}
	
	@Override
	public List<ProductModel> getCategory(String category) {
		
		String sql = "Select * id category where category = ? ";
		List<CategoryModel> categorys =  query(sql, new CategoryMapper(), category);
		int id =  categorys.isEmpty() ? null :  categorys.get(0).getId();
		
		String sqls = "Select * from product where category = ? ";
		return query(sqls,new ProductMapper(), id);
	}


	@Override
	public List<ProductModel> getWomenShoes() {
		String sql = "Select * from product where id = ?";
		return query(sql, new ProductMapper(), 2);
	}


	@Override
	public List<ProductModel> getChildrenShoes() {
		String sql = "Select * from product where id = ? ";
		return query(sql, new ProductMapper(), 3);
	}


	@Override
	public ProductModel getProductDetail(int id) {
		System.out.println(id + "id");
		String sql = "SELECT * FROM product Where id = ?";
		List<ProductModel> product =  query(sql, new ProductMapper(), id);
		return product.isEmpty() ? null :  product.get(0);
	}

	@Override
	public List<ProductModel> getProductCategory(String category) {

		if(category.equals("giaynam")) {
		
			String sql = "SELECT * FROM product where category = ?";
			return query(sql, new ProductMapper(), 1);
		}
		else if(category.equals("giaynu")) {
			String sql = "SELECT * FROM product where category = ?";
			return query(sql, new ProductMapper(), 2);
		}
		else if(category.equals("giaytreem")) {
			String sql = "SELECT * FROM product where category = ?";
			return query(sql, new ProductMapper(), 3);
		}
		return null;
	}

	@Override
	public List<ProductModel> getProductGiayNam(String category) {
		String sql = "SELECT * FROM product where category = ?";
		return query(sql, new ProductMapper(), 1);
	}

	@Override
	public List<ProductModel> getProductGiayNu(String category) {
		String sql = "SELECT * FROM product where category = ?";
		return query(sql, new ProductMapper(), 2);
	}

	@Override
	public List<ProductModel> getProductGiayTreEm(String category) {
		String sql = "SELECT * FROM product where category = ?";
		return query(sql, new ProductMapper(), 3);
	}






	



}
