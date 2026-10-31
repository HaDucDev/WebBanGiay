package Controller.admin;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.ProductModel;
import Service.IProductService;
import Service.impl.ProductService;

@WebServlet(urlPatterns = {"/admin/product"})

public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private IProductService productService;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductController() {
    	productService = new ProductService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("products", productService.getProductAll() );
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product.jsp");
		rd.forward(request, response);
	}

	public static final String DATE_FORMAT_NOW = "dd-mm-yyyy";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel productModel = new ProductModel();
	
		String action = request.getParameter("action");
		
		
		
		if(action != null && action.equals("add")) {
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String thumbnail = request.getParameter("thumbnail");
			String description = request.getParameter("description");
			String promotion = request.getParameter("promotion");
			String category = request.getParameter("category");
		
			
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
			String createdate =  sdf.format(cal.getTime());


			productModel.setName(name);
		    productModel.setPrice(price);
		    productModel.setDescription(description);
		    productModel.setPromotion(promotion);
		    productModel.setCategory(Integer.parseInt(category));
		    productModel.setCreatedate(createdate);
		
			productService.save(productModel);
			response.sendRedirect("/Icommerceshoes/admin/product");
		}
		else if(action != null && action.equals("edit")){
			

			String id_product = request.getParameter("id");
			int  id = Integer.parseInt(id_product);

			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String thumbnail = request.getParameter("thumbnail");
	
			String description = request.getParameter("description");
			String promotion = request.getParameter("promotion");
			String category = request.getParameter("category");
		
			
			
			String createdate =  request.getParameter("createdate");


			productModel.setName(name);
		    productModel.setPrice(price);
		    productModel.setThumbnail(thumbnail);

		    productModel.setDescription(description);
		    productModel.setPromotion(promotion);
		    productModel.setCategory(Integer.parseInt(category));
		    productModel.setCreatedate(createdate);

		    
			productModel.setId(id);
		   
			productService.update(productModel);
			response.sendRedirect("/Icommerceshoes/admin/product");
			
		}
		else if (action != null && action.equals("delete")){
			String id_product = request.getParameter("id");
			int  id = Integer.parseInt(id_product);
			productService.delete(id);		
			response.sendRedirect("/Icommerceshoes/admin/product");
			
		}
		else {
			response.sendRedirect("/Icommerceshoes/admin/product");
		}

		
		
		
		
	}
	

}
