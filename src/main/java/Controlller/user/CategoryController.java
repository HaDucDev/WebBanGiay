package Controlller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Service.IProductService;
import Service.impl.ProductService;

@WebServlet(urlPatterns = {"/category"})

public class CategoryController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
	private IProductService productService;
    public CategoryController() {
         productService = new ProductService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("action");
		  System.out.print(productService.getMenShoes() + "giay nam");
		if(action != null && action.equals("giay-nam")) {
			   request.setAttribute("products", productService.getProductGiayNam("giaynam"));
				RequestDispatcher rd = request.getRequestDispatcher("/views/user/category.jsp");
				rd.forward(request, response);
				
		}
		else if(action != null && action.equals("giay-nu")) {
			   request.setAttribute("products", productService.getProductGiayNu("giaynu"));
				RequestDispatcher rd = request.getRequestDispatcher("/views/user/category.jsp");
				rd.forward(request, response);
		}
		else {
			 request.setAttribute("products", productService.getProductGiayTreEm("giaytreem"));
				RequestDispatcher rd = request.getRequestDispatcher("/views/user/category.jsp");
				rd.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}