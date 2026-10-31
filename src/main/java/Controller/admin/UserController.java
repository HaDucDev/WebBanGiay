package Controller.admin;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.sql.Date;
import java.text.DateFormat;
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

import Model.UserModel;
import Service.IUserService;
import Service.impl.UserService;

@WebServlet(urlPatterns = {"/admin/user"})
@MultipartConfig
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IUserService roleService;
    public UserController() {
    	roleService = new UserService();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("users", roleService.getUserAll());
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user.jsp");
		rd.forward(request, response);
	}
	public static final String DATE_FORMAT_NOW = "dd-mm-yyyy";


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
	
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String roleuser = request.getParameter("role");
		
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		String createdate =  sdf.format(cal.getTime());
		
       
		
		
		
		UserModel role = new UserModel();
		role.setFullname(fullname);
		role.setUsername(username);
		role.setPassword(password);
		role.setRole(roleuser);
		role.setAddress(address);
		role.setPhone(phone);
		role.setCreatedate(createdate);
	
		
		if(action != null && action.equals("add")) {
			roleService.save(role);
			request.setAttribute("users", roleService.getUserAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user.jsp");
			rd.forward(request, response);
		}
		if(action != null && action.equals("edit")) {
			String iduser = request.getParameter("id");
			int id = Integer.parseInt(iduser);
			role.setId(id);
			roleService.update(role);
			request.setAttribute("users", roleService.getUserAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user.jsp");
			rd.forward(request, response);
		}
		if(action != null && action.equals("delete")) {
			String iduser = request.getParameter("id");
			int id = Integer.parseInt(iduser);
			roleService.delete(id);
			request.setAttribute("users", roleService.getUserAll());
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/user.jsp");
			rd.forward(request, response);
		}
		
	}
	


}
