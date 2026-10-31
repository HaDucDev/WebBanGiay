package Controller.user;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = {"/register"})
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public RegisterController() {   }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
//		String username = request.getParameter("username");
// 		String password = request.getParameter("password");
// 		String role = request.getParameter("role");
// 		
// 		String first_name = request.getParameter("first_name");
// 		String last_name = request.getParameter("last_name");
// 		String birth_date = request.getParameter("birth_date");
// 		String address = request.getParameter("address");
// 		String city = request.getParameter("city");
// 		String country = request.getParameter("country");
// 		String country_code = request.getParameter("country_code");
// 		String phone = request.getParameter("phone");
// 		String createByDate = request.getParameter("createByDate");
//		
// 		AccountModel accountModel = new AccountModel();
// 		UserModel userModel = new UserModel();
// 		
// 		accountModel.setUsername(username);
// 		accountModel.setPassword(password);
// 		accountModel.setRole(role);
// 		
// 		userModel.setFirst_name(first_name);
// 		userModel.setLast_name(last_name);
// 		userModel.setBirth_date(birth_date);
// 		userModel.setAddress(address);
// 		userModel.setCity(city); 
// 		userModel.setCountry(country);
// 		userModel.setCountry_code(country_code);
// 		userModel.setPhone(phone);
// 		userModel.setCreateByDate(createByDate);
// 		
// 		accountService.addAccount(accountModel);
// 		userService.addUser(userModel);

		RequestDispatcher rd = request.getRequestDispatcher("views/user/register.jsp");
		rd.forward(request, response);
	}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		doGet(request, response);
//		AccountModel accountModel = FormUtil.toModel(AccountModel.class, request);
//        UserModel userModel = FormUtil.toModel(UserModel.class, request);
 	
// 		String username = request.getParameter("username");
// 		String password = request.getParameter("password");
// 		String role = request.getParameter("role");
// 		
// 		
// 
// 		
// 		String first_name = request.getParameter("first_name");
// 		String last_name = request.getParameter("last_name");
// 		String birth_date = request.getParameter("birth_date");
// 		String address = request.getParameter("address");
// 		String city = request.getParameter("city");
// 		String country = request.getParameter("country");
// 		String county_code = request.getParameter("county_code");
// 		String phone = request.getParameter("phone");
// 		String createByDate = request.getParameter("createByDate");
// 		
//
//		
// 		AccountModel accountModel = new AccountModel();
// 		UserModel userModel = new UserModel();
// 		
// 		accountModel.setUsername(username);
// 		accountModel.setPassword(password);
// 		accountModel.setRole(role);
// 		
// 		userModel.setFirst_name(first_name);
// 		userModel.setLast_name(last_name);
// 		userModel.setBirth_date(birth_date);
// 		userModel.setAddress(address);
// 		userModel.setCity(city); 
// 		userModel.setCountry(country);
// 		userModel.setCounty_code(county_code);
// 		userModel.setPhone(phone);
// 		userModel.setCreateByDate(createByDate);
 		
// 		accountService.addAccount(accountModel);
// 		userService.addUser(userModel);
 		
 		
// 		AccountModel model = FormUtil.toModel(AccountModel.class, request);
 		
//    	AccountModel accoutModel = F ormUtil.toModel(AccountModel.class, request);
//    	accoutModel = accountService.addAccount(model.getUsername(),model.getPassword());

 		RequestDispatcher rd = request.getRequestDispatcher("views/user/Register/index.jsp");
		rd.forward(request, response);
 		
 		
 		
 		
 		

        
 		
 		
	}

}
