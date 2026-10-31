package Controller.admin;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.CategoryModel;
import Model.UserModel;
import Service.ICategoryService;
import Service.impl.CategoryService;

/**
 * Servlet implementation class CategoryControler
 */
@WebServlet("/admin/category")
public class CategoryControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    private ICategoryService category;
    public CategoryControler() {
      category = new CategoryService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/category.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		
	
	
		String name = request.getParameter("name");
	
		
		
       
		
		
		
		CategoryModel cate = new CategoryModel();
		
	   cate.setName(name);
		
		
		if(action != null && action.equals("add")) {
			category.save(cate);
			response.sendRedirect("/ECommerce/admin/category");
		}
		if(action != null && action.equals("edit")) {
			String id = request.getParameter("id");
			cate.setId(Integer.parseInt(id));
			category.update(cate);
			response.sendRedirect("/ECommerce/admin/category");
		}
		if(action != null && action.equals("delete")) {
			String idcate = request.getParameter("id");
			int id = Integer.parseInt(idcate);
			category.delete(id);
			response.sendRedirect("/ECommerce/admin/category");
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
