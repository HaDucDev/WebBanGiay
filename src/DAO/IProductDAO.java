package DAO;

import java.util.List;

import Model.CategoryModel;
import Model.ProductModel;

public interface IProductDAO extends GenericDAO<ProductModel> {
	ProductModel findOne(Long id);
	List<ProductModel> getProductCategory(String category);
	List<ProductModel> getCategory(String category);
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
	
	
	List<ProductModel> getProductGiayNam(String category);
	List<ProductModel> getProductGiayNu(String category);
	List<ProductModel> getProductGiayTreEm(String category);

	
}
