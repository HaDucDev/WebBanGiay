package Controller.user;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
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
				cartService.save(cart);
		
				Object objCart = session.getAttribute("cart");
				if (objCart != null) {
					
					
					Map<Integer, CartItemModel> map = (Map<Integer, CartItemModel>) objCart;
		
					for (CartItemModel cartItem : map.values()) {
						cartItem.setCart(cart);
						cartItem.setCart_id(cart.getId());
						String price = cartItem.getProduct().getPrice();
						int proid = cartItem.getProduct().getId();
						cartItem.setPro_id(proid);
						int totalPrice = cartItem.getQuantity() * Integer.parseInt(price);
						cartItem.setPrice(Integer.toString(totalPrice));
						SendMail sm = new SendMail();
		//				sm.sendMail(cart.getUser().getUsername(), "UNIFY", "Payment success. We will contact you soon ! ");
						cartItemService.save(cartItem);
						
					}
		
				}
		}
		else {
			RequestDispatcher rd = request.getRequestDispatcher("views/user/cart.jsp");
			rd.forward(request, response);
		}
		session.removeAttribute("cart");
		
		
		RequestDispatcher rd = request.getRequestDispatcher("views/user/checkout.jsp");
		rd.forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
