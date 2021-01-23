package Controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.ProductModel;
import Service.IProductService;
import Service.impl.ProductService;

@WebServlet(urlPatterns = {"/admin/product"})
@MultipartConfig
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
		
		
		String category = request.getParameter("category");
		if(category != null) {			
			request.setAttribute("products", productService.getProductCategory(category) );
			System.out.println( productService.getProductCategory(category));
		
		}else {
			request.setAttribute("products", productService.getProductAll() );

		}
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product.jsp");
		rd.forward(request, response);
		
	}

	public static final String DATE_FORMAT_NOW = "dd-mm-yyyy";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductModel productModel = new ProductModel();
	
		String action = request.getParameter("action");
		
		
		if(action != null && action.equals("category")) {
			String category = request.getParameter("category");
			request.setAttribute("products", productService.getProductCategory(category) );
		}
		if(action != null && action.equals("add")) {
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			Part thumbnail = request.getPart("thumbnail");
			String description = request.getParameter("description");
			String promotion = request.getParameter("promotion");
			String category = request.getParameter("category");
		
			System.out.println(thumbnail + "thumnail");
			
			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
			String createdate =  sdf.format(cal.getTime());
			

		
			
			
			String fileName = extractFileName(thumbnail);
			String savePath = "D:\\Eclipse-workspace\\demoupload"+ File.separator + fileName ;
			File fileSaveDir = new File(savePath);
			thumbnail.write(savePath + File.separator);
			

			productModel.setName(name);
		    productModel.setPrice(price);
		    productModel.setThumbnail(fileName);
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
			request.setAttribute("products", productService.getProductAll() );

		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product.jsp");
		rd.forward(request, response);
			
		}
		else if (action != null && action.equals("delete")){
			String id_product = request.getParameter("id");
			int  id = Integer.parseInt(id_product);
			productService.delete(id);		
			request.setAttribute("products", productService.getProductAll() );

		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product.jsp");
		rd.forward(request, response);
			
		}
		
		else {
			request.setAttribute("products", productService.getProductAll() );

		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/product.jsp");
		rd.forward(request, response);
		}
		

		
		
		
		
	}
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String s : items) {
			if(s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=") + 2, s.length() - 1);
			}
		}
		return "";
	}
	

}
