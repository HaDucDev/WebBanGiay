package DAO;

import java.util.List;

import Model.ProductModel;

public interface IProductDAO extends GenericDAO<ProductModel> {
	ProductModel findOne(Long id);
	List<ProductModel> getProductAll();
	List<ProductModel> getTopProducts();
	List<ProductModel> getNewProducts();
	List<ProductModel> findProductId();
	Long save(ProductModel productModel);
	void update(ProductModel updateProductModel);
	void delete(int id);
	
	//category
	List<ProductModel> getMenShoes();
	List<ProductModel> getWomenShoes();
	List<ProductModel> getChildrenShoes();
	
	//product detail
	ProductModel getProductDetail(int id);
	
}
