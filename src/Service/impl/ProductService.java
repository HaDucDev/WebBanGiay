package Service.impl;

import java.util.List;

import DAO.IProductDAO;
import DAO.impl.ProductDAO;
import Model.CategoryModel;
import Model.ProductModel;
import Service.IProductService;

public class ProductService implements IProductService {

	private IProductDAO productDao;
	
	public ProductService() {
		productDao = new ProductDAO();
	}
	@Override
	public List<ProductModel> getProductAll() {
		return productDao.getProductAll();
	}
	
	@Override
	public List<ProductModel> findProductId() {
	
		return productDao.findProductId();
	}

	@Override
	public ProductModel save(ProductModel productModel) {
		Long id_product =  productDao.save(productModel);
		return productDao.findOne(id_product);
	}
	
	@Override
	public ProductModel update(ProductModel updateProductModel) {
//		ProductModel oldProduct  	= productDao.findOne((long) updateProductModel.getId_product());
		productDao.update(updateProductModel);
		return productDao.findOne((long) updateProductModel.getId());
	}

	@Override
	public void delete(int id) {
			productDao.delete(id);
	}
	@Override
	public List<ProductModel> getTopProducts() {
		return productDao.getTopProducts();
	}
	@Override
	public List<ProductModel> getNewProducts() {
		return productDao.getNewProducts();
	}
	@Override
	public List<ProductModel> getMenShoes() {
	    return productDao.getMenShoes();
	}
	@Override
	public List<ProductModel> getWomenShoes() {
		return productDao.getWomenShoes();
	}
	@Override
	public List<ProductModel> getChildrenShoes() {
		return productDao.getChildrenShoes();
	}
	@Override
	public ProductModel getProductDetail(int id) {
		return productDao.getProductDetail(id);
	}
	@Override
	public List<ProductModel> getCategory(String category) {
		return productDao.getCategory(category);
	}
	@Override
	public List<ProductModel> getProductCategory(String category) {
		return productDao.getProductCategory(category);
	}
	@Override
	public List<ProductModel> getProductGiayNam(String category) {
		return productDao.getProductGiayNam(category);
	}
	@Override
	public List<ProductModel> getProductGiayNu(String category) {
		return productDao.getProductGiayNu(category);
	}
	@Override
	public List<ProductModel> getProductGiayTreEm(String category) {
		return productDao.getProductGiayTreEm(category);
	}

	






}
