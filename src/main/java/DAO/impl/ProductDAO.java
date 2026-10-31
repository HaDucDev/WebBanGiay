package DAO.impl;

import java.util.List;

import DAO.IProductDAO;
import Mapper.ProductMapper;
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
		String sql = "Select * from product where type = 'new product'";
		return query(sql, new ProductMapper());
	}


	@Override
	public List<ProductModel> getMenShoes() {
		String sql = "Select * from product, category where product.category = category.id and category.code = 'giay-nam' ";
		return query(sql,new ProductMapper());
	}


	@Override
	public List<ProductModel> getWomenShoes() {
		String sql = "Select * from product, category where product.category = category.id and category.code = 'giay-nu' ";
		return query(sql, new ProductMapper());
	}


	@Override
	public List<ProductModel> getChildrenShoes() {
		String sql = "Select * from product, category where product.category = category.id and category.code = 'giay-tre-em' ";
		return query(sql, new ProductMapper());
	}


	@Override
	public ProductModel getProductDetail(int id) {
		System.out.println(id + "id");
		String sql = "SELECT * FROM product Where id = ?";
		List<ProductModel> product =  query(sql, new ProductMapper(), id);
		return product.isEmpty() ? null :  product.get(0);
	}




	



}
