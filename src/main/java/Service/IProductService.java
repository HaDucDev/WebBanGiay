package Service;

import java.util.List;

import Model.ProductModel;

public interface IProductService {
    List<ProductModel> getProductAll();
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
