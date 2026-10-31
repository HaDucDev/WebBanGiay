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
@MultipartConfig(location="/admin/user", 
fileSizeThreshold=1024*1024, 
maxFileSize=1024*1024*50)
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
		
	
		String avatar = request.getParameter("avatar");
		String fullname = request.getParameter("fullname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String phone = request.getParameter("phone");
		String roleuser = request.getParameter("role");
		
		
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
		String createdate =  sdf.format(cal.getTime());
		
       

        System.out.print(createdate + "--date--" );
        
		
		
//		Part part  = request.getServletPath("ile");
//		String fileName = extractFileName(part);
//		String savePath = "C:\\Users\\vinht\\eclipse-workspace\\Icommerceshoes\\src\\main\\webapp\\assets\\user\\images\\"+ File.separator + fileName ;
//		File fileSaveDir = new File(savePath);
		
//		part.write(savePath)+ File.separator;
		
		UserModel role = new UserModel();
		role.setAvatar(avatar);
		role.setFullname(fullname);
		role.setUsername(username);
		role.setPassword(password);
		role.setRole(roleuser);
		role.setAddress(address);
		role.setPhone(phone);
		role.setCreatedate(createdate);
	
		
		if(action != null && action.equals("add")) {
			roleService.save(role);
			response.sendRedirect("/Icommerceshoes/admin/user");
		}
		if(action != null && action.equals("edit")) {
			String iduser = request.getParameter("id");
			int id = Integer.parseInt(iduser);
			role.setId(id);
			roleService.update(role);
			response.sendRedirect("/Icommerceshoes/admin/user");
		}
		if(action != null && action.equals("delete")) {
			String iduser = request.getParameter("id");
			int id = Integer.parseInt(iduser);
			roleService.delete(id);
			response.sendRedirect("/Icommerceshoes/admin/user");
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
