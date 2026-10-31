package Controller.admin;

import java.awt.List;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.CartItemModel;
import Service.ICartItemService;
import Service.ICartService;
import Service.IProductService;
import Service.IUserService;
import Service.impl.CartItemService;
import Service.impl.CartService;
import Service.impl.ProductService;
import Service.impl.UserService;

@WebServlet(urlPatterns = {"/admin", "/admin/dashboard"})

public class DashboardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private IProductService product;
	private IUserService userService;
	private ICartService cartService;
	private ICartItemService cartitemService;
	
    public DashboardController() {
    	product = new ProductService();
    	userService = new UserService();
    	cartService = new CartService();
    	cartitemService = new CartItemService();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setAttribute("users", userService.getUserAll());
		request.setAttribute("products",product.getProductAll());
		request.setAttribute("carts", cartService.getCartAll());
		ArrayList<CartItemModel> list = (ArrayList<CartItemModel>) cartitemService.getAll();
	
//		int priceTotal = 0;
//		for(int  i = 0; i < list.size() ; i++) {
//			System.out.println(list.toArray()[i].price + "datssa");
//
//		}
//		 
//		System.out.println(list + "data");
		
		
		request.setAttribute("cartitems", cartitemService.getAll());
		
		
		RequestDispatcher rd = request.getRequestDispatcher("/views/admin/index.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
