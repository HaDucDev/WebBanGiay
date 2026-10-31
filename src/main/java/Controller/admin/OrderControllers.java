package Controller.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.CartItemModel;
import Model.CartModel;
import Model.PromotionModel;
import Service.ICartItemService;
import Service.ICartService;
import Service.impl.CartItemService;
import Service.impl.CartService;

@WebServlet(urlPatterns = {"/admin/order"})

public class OrderControllers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
 
	private ICartService cartService;
	private ICartItemService cartItemService;
    public OrderControllers() {
        cartService = new CartService();
        cartItemService = new CartItemService();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		if(action != null && action.equals("cart-detail")) {
			String idcart = request.getParameter("id");
			int id = Integer.parseInt(idcart);
			  System.out.println(cartItemService.searchIdCart(id) + "------"+idcart + "--asda");
			request.setAttribute("carts",cartService.getCartAll() );
			request.setAttribute("cartitems",cartItemService.searchIdCart(id));
	        System.out.println(cartItemService.searchIdCart(id) + "asdfasd");


     
			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order.jsp");
				rd.forward(request, response);
		}else {
		
			request.setAttribute("carts",cartService.getCartAll() );
			request.setAttribute("cartitems",cartItemService.getAll() );

			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order.jsp");
				rd.forward(request, response);
		}
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

		 if(action != null && action.equals("delete-cart")) {
			String idpromotion = request.getParameter("id");
			int id = Integer.parseInt(idpromotion);
			cartService.delete(id);
			request.setAttribute("carts",cartService.getCartAll() );
			request.setAttribute("cartitems",cartItemService.getAll() );

			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order.jsp");
				rd.forward(request, response);
		}
    
		else if(action != null && action.equals("edit-cart-item")) {
			String idcart = request.getParameter("id");
			
			String cartid = request.getParameter("cartid");
			String productid = request.getParameter("proid");
			String price = request.getParameter("price");
			String quantity = request.getParameter("quantity");
			
           CartItemModel cartItem = new CartItemModel();
           int id = Integer.parseInt(idcart);
			cartItem.setId(id);
           cartItem.setCart_id(Integer.parseInt(cartid));
           cartItem.setPro_id(Integer.parseInt(productid));
           cartItem.setPrice(price);
           cartItem.setQuantity(Integer.parseInt(quantity));
			
			cartItemService.update(cartItem);
			request.setAttribute("carts",cartService.getCartAll() );
			request.setAttribute("cartitems",cartItemService.getAll() );

			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order.jsp");
				rd.forward(request, response);
		}
		else if(action != null && action.equals("delete-cart-item")) {
			String idpromotion = request.getParameter("id");
			int id = Integer.parseInt(idpromotion);
			cartItemService.delete(id);
			request.setAttribute("carts",cartService.getCartAll() );
			request.setAttribute("cartitems",cartItemService.getAll() );

			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order.jsp");
			rd.forward(request, response);
		}
		else {
		
			   System.out.println( "votrang dau");
			   
			request.setAttribute("carts",cartService.getCartAll() );
			request.setAttribute("cartitems",cartItemService.getAll() );

			RequestDispatcher rd = request.getRequestDispatcher("/views/admin/order.jsp");
				rd.forward(request, response);
		}
		
	}

}
