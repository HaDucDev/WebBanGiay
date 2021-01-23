package Service;

import java.util.List;

import Model.CategoryModel;
import Model.ProductModel;

public interface IProductService {
    List<ProductModel> getProductAll();
	List<ProductModel> getProductCategory(String category);
	List<ProductModel> getProductGiayNam(String category);
	List<ProductModel> getProductGiayNu(String category);
	List<ProductModel> getProductGiayTreEm(String category);

	List<ProductModel> getCategory(String category);
    List<ProductModel> getTopProducts();
    List<ProductModel> getNewProducts();
    List<ProductModel> findProductId();
    ProductModel save(ProductModel productModel);
    ProductModel update(ProductModel updateProductModel);
	void delete(int id);
	
	//category
	List<ProductModel> getMenShoes();
	List<ProductModel> getWomenShoes();
	List<ProductModel> getChildrenShoes();
	//product detail
	ProductModel getProductDetail(int id);
    	
}
