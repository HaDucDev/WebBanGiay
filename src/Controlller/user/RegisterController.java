package Controlller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.UserModel;
import Service.IUserService;
import Service.impl.UserService;

/**
 * Servlet implementation class RegisterController
 */
@WebServlet("/register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IUserService userService;

    public RegisterController() {
    	userService = new UserService();

    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher rd = request.getRequestDispatcher("/views/user/index.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	
	public static final String DATE_FORMAT_NOW = "dd-mm-yyyy";

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if(action != null && action.equals("register")) {
			
			String name = request.getParameter("name");
			String username = request.getParameter("username");
			String password = request.getParameter("password");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
		

			Calendar cal = Calendar.getInstance();
			SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
			String createdate =  sdf.format(cal.getTime());
			
	       
			
			
			
			UserModel role = new UserModel();
			role.setFullname(name);
			role.setUsername(username);
			role.setPassword(password);
			role.setRole("user");
			role.setAddress(address);
			role.setPhone(phone);
			role.setCreatedate(createdate);
			UserModel models = userService.save(role);
			if(models != null) {
				request.setAttribute("resultregister", "Đăng kí thành công ! " );
			}
			else {
				request.setAttribute("resultregister", "Đăng kí thất bại ! " );
			}
			RequestDispatcher rd = request.getRequestDispatcher("/views/login.jsp");
			rd.forward(request, response);
		}  
	}

}
