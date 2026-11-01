package Controller.user;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Model.CategoryModel;
import Model.ProductModel;
import Service.ICategoryService;
import Service.IProductService;
import Service.impl.CategoryService;
import Service.impl.ProductService;

@WebServlet(urlPatterns = {"/category"})
public class CategoryController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final int PAGE_SIZE = 12;
    private final IProductService products = new ProductService();
    private final ICategoryService categories = new CategoryService();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<CategoryModel> categoryList = categories.GetCategoryAll();
        String code = request.getParameter("action");
        CategoryModel selected = null;
        if (code != null && !code.isEmpty()) {
            for (CategoryModel category : categoryList) {
                if (code.equals(category.getCode())) {
                    selected = category;
                    break;
                }
            }
            if (selected == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
        }
        List<ProductModel> result = selected == null ? products.getProductAll()
                : products.getProductsByCategory(selected.getCode());
        int page = 1;
        try {
            if (request.getParameter("page") != null) {
                page = Integer.parseInt(request.getParameter("page"));
            }
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        int pageCount = Math.max(1, (result.size() + PAGE_SIZE - 1) / PAGE_SIZE);
        if (page < 1 || page > pageCount) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }
        int start = (page - 1) * PAGE_SIZE;
        request.setAttribute("categories", categoryList);
        request.setAttribute("selectedCategory", selected);
        request.setAttribute("categoryTitle", selected == null ? "All Products" : selected.getName());
        request.setAttribute("products", result.subList(start, Math.min(start + PAGE_SIZE, result.size())));
        request.setAttribute("productCount", result.size());
        request.setAttribute("currentPage", page);
        request.setAttribute("pageCount", pageCount);
        request.getRequestDispatcher("/views/user/category.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
