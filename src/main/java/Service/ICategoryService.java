package Service;

import java.util.List;

import Model.CategoryModel;
import Model.ProductModel;

public interface ICategoryService {
	List<CategoryModel> GetCategoryAll();
	CategoryModel save(CategoryModel categoryModel);
	CategoryModel update(CategoryModel updateProductModel);
	void delete(int id);
	int getTotalItem();

}
