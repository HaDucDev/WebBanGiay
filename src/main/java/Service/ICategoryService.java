package Service;

import java.util.List;

import Model.CategoryModel;

public interface ICategoryService {
	List<CategoryModel> GetCategoryAll();
	CategoryModel save(CategoryModel categoryModel);
	int getTotalItem();

}
