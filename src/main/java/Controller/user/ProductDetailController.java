package Controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProductModel;
import Service.IProductService;
import Service.impl.ProductService;


@WebServlet(urlPatterns = {"/product-detail"})
public class ProductDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	private IProductService productService;
	
    public ProductDetailController() {
        productService = new ProductService();
       
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		String id_product = request.getParameter("id");
		request.setAttribute("productDetail", productService.getProductDetail(Integer.parseInt(id_product)));
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/user/productdetail.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
