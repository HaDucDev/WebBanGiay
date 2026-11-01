package Controller.user;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/** Routes the existing informational templates from the shop menu. */
@WebServlet(urlPatterns = {"/blog", "/blog-single", "/contact", "/error"})
public class ContentController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String view;
        switch (request.getServletPath()) {
        case "/blog":
            view = "/views/user/blog.jsp";
            break;
        case "/blog-single":
            view = "/views/user/blogsingle.jsp";
            break;
        case "/contact":
            view = "/views/user/contact.jsp";
            break;
        default:
            view = "/views/error.jsp";
            break;
        }
        request.getRequestDispatcher(view).forward(request, response);
    }
}
