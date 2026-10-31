package DAO;

import java.util.ArrayList;
import java.util.List;

import Model.CategoryModel;

public interface ICategoryDAO extends GenericDAO<CategoryModel> {
	   List<CategoryModel> GetCategoryAlL();
	   Long save(CategoryModel categoryModel);
	   int getTotalItem();
}
