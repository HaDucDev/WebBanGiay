package Controlller.user;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CartItemModel;
import Model.ProductModel;
import Service.ICartService;
import Service.IProductService;
import Service.impl.CartService;
import Service.impl.ProductService;

@WebServlet(urlPatterns = {"/cart"})

public class CartController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ICartService cart;
	private IProductService productService;
    public CartController() {
      	cart = new CartService();
      	productService = new ProductService();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		int quantity =1 ;
		
     
        if(request.getParameter("quantity") != null) {
        	quantity = Integer.parseInt(request.getParameter("quantity"));
        }
	      if(action != null && action.equals("add") ) {
	    	  
			String pId = request.getParameter("id");
			ProductModel product = productService.getProductDetail(Integer.parseInt(pId));
			CartItemModel cartItem = new CartItemModel();
			cartItem.setQuantity(quantity);
			cartItem.setPrice(product.getPrice());
			cartItem.setProduct(product);
			HttpSession httpSession = request.getSession();
			Object obj = httpSession.getAttribute("cart");
			System.out.println(obj+ "obj");
			if (obj == null) {
				
				Map<Integer, CartItemModel> map = new HashMap<Integer, CartItemModel>();
				map.put(cartItem.getProduct().getId(), cartItem);
				httpSession.setAttribute("cart", map);
				RequestDispatcher rd = request.getRequestDispatcher("/views/user/cart.jsp");
				rd.forward(request, response);

			} else {
				Map<Integer, CartItemModel> map = (Map<Integer, CartItemModel>) obj;

				CartItemModel existedCartItem = map.get(Integer.valueOf(pId));

				if (existedCartItem == null) {
					map.put(product.getId(), cartItem);
				} else {
					existedCartItem.setQuantity(existedCartItem.getQuantity() + quantity);
				}

				httpSession.setAttribute("cart", map);
			}
	      }
	      if(action != null && action.equals("sub") ) {
	    	  
				String pId = request.getParameter("id");
				ProductModel product = productService.getProductDetail(Integer.parseInt(pId));
				CartItemModel cartItem = new CartItemModel();
				cartItem.setQuantity(quantity);
				cartItem.setPrice(product.getPrice());
				cartItem.setProduct(product);
				HttpSession httpSession = request.getSession();
				Object obj = httpSession.getAttribute("cart");
				System.out.println(obj+ "obj");
				if (obj == null) {
					
					Map<Integer, CartItemModel> map = new HashMap<Integer, CartItemModel>();
					map.put(cartItem.getProduct().getId(), cartItem);
					httpSession.setAttribute("cart", map);
					RequestDispatcher rd = request.getRequestDispatcher("/views/user/cart.jsp");
					rd.forward(request, response);

				} else {
					Map<Integer, CartItemModel> map = (Map<Integer, CartItemModel>) obj;

					CartItemModel existedCartItem = map.get(Integer.valueOf(pId));

					if (existedCartItem == null) {
						map.put(product.getId(), cartItem);
					} else {
						existedCartItem.setQuantity(existedCartItem.getQuantity() - quantity);
					}

					httpSession.setAttribute("cart", map);
				}
		      }
	      else if(action != null && action.equals("remove")) {
	    	  HttpSession httpSession = request.getSession();
	  		Object obj = httpSession.getAttribute("cart");
	  		String pId = request.getParameter("id");
	  		if (obj != null) {
	  			Map<Integer, CartItemModel> map = (Map<Integer, CartItemModel>) obj; 
	  			map.remove(Integer.parseInt(pId));
	  			httpSession.setAttribute("cart", map);
	  		}	  
	      }
	      HttpSession httpSession = request.getSession();
	      Object obj = httpSession.getAttribute("cart");
	      RequestDispatcher rd = request.getRequestDispatcher("/views/user/cart.jsp");
			rd.forward(request, response);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
