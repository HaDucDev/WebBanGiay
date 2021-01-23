package Controlller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.ICartDAO;
import DAO.impl.CartDAO;
import Model.CartItemModel;
import Model.CartModel;
import Model.UserModel;
import Service.ICartItemService;
import Service.ICartService;
import Service.IProductService;
import Service.impl.CartItemService;
import Service.impl.CartService;
import Service.impl.ProductService;
import utils.SendMail;

@WebServlet(urlPatterns = {"/checkout"})

public class CheckoutController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private IProductService productService;
	private ICartService cartService;
	private ICartItemService cartItemService;
	private ICartDAO cartDao;
    public CheckoutController() {
        productService = new ProductService();
        cartService = new CartService();
        cartItemService = new CartItemService();
        cartDao = new CartDAO();
    }
	
	
	public static final String DATE_FORMAT_NOW = "dd-mm-yyyy";


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("USERMODEL");
		UserModel user = (UserModel) obj;
		if(user != null) {
				CartModel cart = new CartModel();
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
				String date =  sdf.format(cal.getTime());
				cart.setU_id(user.getId());
				cart.setBuydate(date);
				CartModel carts = cartService.save(cart);
				
				System.out.println(carts.getId() + "--cart id----");
		
				Object objCart = session.getAttribute("cart");
				if (objCart != null && carts != null) {
					
					Map<Integer, CartItemModel> map = (Map<Integer, CartItemModel>) objCart;

					for (CartItemModel cartItem : map.values()) {
						cartItem.setCart(cart);
						cartItem.setCart_id(carts.getId());
						String price = cartItem.getProduct().getPrice();
						int proid = cartItem.getProduct().getId();
						cartItem.setPro_id(proid);
						int totalPrice = cartItem.getQuantity() * Integer.parseInt(price);
						cartItem.setPrice(Integer.toString(totalPrice));
						SendMail sm = new SendMail();
						System.out.println(user.getUsername()+ "sdf");
    	    			sm.sendMail(user.getUsername(), "UNIFY", "Payment success. We will contact you soon ! ");
						cartItemService.save(cartItem);
						
					}
		
				}
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("views/user/index.jsp");
			rd.forward(request, response);
		}
		session.removeAttribute("cart");
		response.sendRedirect(request.getContextPath() + "/");
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
