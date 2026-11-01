package Controller.user;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.CartItemModel;
import Model.CartModel;
import Model.UserModel;
import Service.ICartItemService;
import Service.ICartService;
import Service.impl.CartItemService;
import Service.impl.CartService;

@WebServlet(urlPatterns = {"/checkout"})
public class CheckoutController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final ICartService cartService = new CartService();
    private final ICartItemService cartItemService = new CartItemService();

    @Override
    @SuppressWarnings("unchecked")
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        UserModel user = (UserModel) session.getAttribute("USERMODEL");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login?action=login");
            return;
        }
        Map<Integer, CartItemModel> items =
                (Map<Integer, CartItemModel>) session.getAttribute("cart");
        if (items == null || items.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        BigDecimal total = BigDecimal.ZERO;
        for (CartItemModel item : items.values()) {
            total = total.add(item.getTotalPrice());
        }

        CartModel cart = new CartModel();
        cart.setU_id(user.getId());
        cart.setBuydate(new SimpleDateFormat("dd-MM-yyyy").format(new Date()));
        cart = cartService.save(cart);
        for (CartItemModel item : items.values()) {
            item.setCart(cart);
            item.setCart_id(cart.getId());
            item.setPro_id(item.getProduct().getId());
            item.setPrice(item.getTotalPrice().toPlainString());
            cartItemService.save(item);
        }

        request.setAttribute("order", cart);
        request.setAttribute("orderItems", new ArrayList<CartItemModel>(items.values()));
        request.setAttribute("orderTotal", total);
        session.removeAttribute("cart");
        request.getRequestDispatcher("/views/user/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
