package DAO;

import java.util.ArrayList;
import java.util.List;

import Model.CategoryModel;
import Model.ProductModel;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
	   List<CategoryModel> GetCategoryAlL();
	   CategoryModel findOne(Long id);
	   Long save(CategoryModel categoryModel);
		void update(CategoryModel categoryModel);
		void delete(int id);
	   int getTotalItem();
}
