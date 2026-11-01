package Controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProductModel;
import Model.CategoryModel;
import java.util.List;
import Service.IProductService;
import Service.ICategoryService;
import Service.impl.ProductService;
import Service.impl.CategoryService;


@WebServlet(urlPatterns = {"/product-detail"})
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	private IProductService productService;
	private ICategoryService categoryService = new CategoryService();
	
    public ProductDetailController() {
        productService = new ProductService();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int productId;
		try {
			productId = Integer.parseInt(request.getParameter("id"));
		} catch (NumberFormatException e) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		ProductModel productDetail = productService.getProductDetail(productId);
		if (productDetail == null) {
			response.sendError(HttpServletResponse.SC_NOT_FOUND);
			return;
		}
		request.setAttribute("productDetail", productDetail);
		List<CategoryModel> categories = categoryService.GetCategoryAll();
		request.setAttribute("categories", categories);
		for (CategoryModel category : categories) {
			if (category.getId() == productDetail.getCategory()) {
				request.setAttribute("selectedCategory", category);
				request.setAttribute("relatedProducts", productService.getProductsByCategory(category.getCode()));
				break;
			}
		}
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/user/productdetail.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
