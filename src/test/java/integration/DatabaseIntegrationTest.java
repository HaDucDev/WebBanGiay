package integration;

import static org.junit.Assert.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.math.BigDecimal;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

import org.junit.Assume;
import org.junit.Before;
import org.junit.Test;

import DAO.impl.AbstractDAO;
import DAO.impl.CartDAO;
import DAO.impl.CartItemDAO;
import DAO.impl.CategoryDAO;
import DAO.impl.ContactDAO;
import DAO.impl.LoginDAO;
import DAO.impl.ProductDAO;
import DAO.impl.UserDAO;
import Mapper.ContactMapper;
import Mapper.PromotionMapper;
import Model.CartItemModel;
import Model.CartModel;
import Model.CategoryModel;
import Model.ContactModel;
import Model.ProductModel;
import Model.PromotionModel;
import Model.UserModel;

/** Run only against a disposable database initialized with database/Web_Ban_Giay.sql. */
public class DatabaseIntegrationTest {

    @Before
    public void requireDisposableDatabase() {
        Assume.assumeTrue("Set DB_INTEGRATION_TEST=true to enable database tests",
                Boolean.parseBoolean(System.getenv("DB_INTEGRATION_TEST")));
    }

    @Test
    public void bothConnectionPathsUseTheSameDatabase() throws Exception {
        try (Connection main = new AbstractDAO<Object>().getConnection();
                Connection login = new LoginDAO().getConnection()) {
            assertEquals("Web_Ban_Giay", main.getCatalog());
            assertEquals(main.getCatalog(), login.getCatalog());
        }
    }

    @Test
    public void seedDataWorksWithApplicationQueriesAndMappers() {
        CategoryDAO categories = new CategoryDAO();
        List<CategoryModel> categoryList = categories.GetCategoryAlL();
        assertNotNull(categoryList);
        assertEquals(11, categoryList.size());
        assertEquals(11, categories.getTotalItem());
        assertTrue(categoryList.stream().anyMatch(c -> "Women's Shoes".equals(c.getName())));

        ProductDAO products = new ProductDAO();
        List<ProductModel> productList = products.getProductAll();
        assertNotNull(productList);
        assertEquals(46, productList.size());
        for (ProductModel product : productList) {
            assertNotNull(product);
            assertTrue(new BigDecimal(product.getPrice()).signum() > 0);
            if (product.getThumbnail() != null) {
                assertTrue(Files.isRegularFile(Paths.get("src/main/webapp", product.getThumbnail())));
            }
            assertNotNull(products.getProductDetail(product.getId()));
        }
        assertFalse(products.getTopProducts().isEmpty());
        assertFalse(products.getNewProducts().isEmpty());
        assertFalse(products.getMenShoes().isEmpty());
        assertFalse(products.getWomenShoes().isEmpty());
        assertFalse(products.getChildrenShoes().isEmpty());
        assertEquals("9.80", products.getProductDetail(2).getPrice());
        assertEquals("Men's Air-Cushioned Trainers", products.getProductDetail(1).getName());
        assertEquals("images/image1.jpg", products.getProductDetail(1).getThumbnail());
        assertEquals("images/reference/userTu/images/3.jpg", products.getProductDetail(3).getThumbnail());
        assertEquals(39, productList.stream().filter(p -> p.getThumbnail() != null).count());
        for (CategoryModel category : categoryList) {
            List<ProductModel> filtered = products.getProductsByCategory(category.getCode());
            assertFalse(filtered.isEmpty());
            assertTrue(filtered.stream().allMatch(p -> p.getCategory() == category.getId()));
        }
        assertTrue(products.getProductsByCategory("not-a-category").isEmpty());
        assertTrue(products.getProductsByCategory("dresses' OR 1=1 --").isEmpty());
        assertEquals("White Strapless Party Dress", products.getProductDetail(10).getName());
        assertEquals("assets/user/images/shop/product7.jpg", products.getProductDetail(10).getThumbnail());
        assertNull(products.getProductDetail(2).getThumbnail());
        assertTrue(Files.isRegularFile(Paths.get("src/main/webapp/assets/user/images/product-placeholder.svg")));

        UserDAO users = new UserDAO();
        UserModel admin = users.findByAccountStatus("admin", "admin123");
        assertNotNull(admin);
        assertEquals("admin", admin.getRole());
        assertNull(users.findByAccountStatus("admin", "incorrect-password"));
        assertEquals("user", users.findByAccountStatus("AN", "123456").getRole());

        List<PromotionModel> promotions = new AbstractDAO<PromotionModel>()
                .query("SELECT * FROM promotion", new PromotionMapper());
        assertNotNull(promotions);
        assertEquals(10, promotions.size());
        assertNotNull(promotions.get(0));
        assertEquals("10", promotions.get(0).getPercent());
    }

    @Test
    public void userProductCartAndContactCrudMatchTheSchema() throws Exception {
        UserDAO users = new UserDAO();
        ProductDAO products = new ProductDAO();
        CartDAO carts = new CartDAO();
        CartItemDAO items = new CartItemDAO();
        Long userId = null;
        Long productId = null;
        Long cartId = null;
        Long itemId = null;
        Long contactId = null;
        try {
            UserModel user = new UserModel();
            user.setUsername("db-test-" + System.nanoTime());
            user.setPassword("test-only");
            user.setFullname("Người dùng thử nghiệm");
            user.setAddress("Địa chỉ thử nghiệm");
            user.setPhone("0900000000");
            user.setRole("user");
            user.setCreatedate("31-10-2026");
            userId = users.save(user);
            assertNotNull(userId);
            assertEquals(user.getFullname(), users.findOne(userId).getFullname());
            user.setId(userId.intValue());
            user.setFullname("Tên đã cập nhật");
            users.update(user);
            assertEquals(user.getFullname(), users.findOne(userId).getFullname());

            ProductModel product = new ProductModel();
            product.setName("Sản phẩm thử nghiệm");
            product.setPrice("9.80");
            product.setThumbnail("images/image1.jpg");
            product.setDescription("Mô tả tiếng Việt");
            product.setPromotion("0");
            product.setCategory(1);
            product.setCreatedate("31-10-2026");
            productId = products.save(product);
            assertNotNull(productId);
            product.setId(productId.intValue());
            product.setPrice("12.34");
            products.update(product);
            assertEquals("12.34", products.findOne(productId).getPrice());

            CartModel cart = new CartModel();
            cart.setU_id(userId.intValue());
            cart.setBuydate("31-10-2026");
            cartId = carts.save(cart);
            assertNotNull(cartId);
            cart.setId(cartId.intValue());
            assertEquals(userId.intValue(), carts.getOne(cartId).getU_id());

            CartItemModel item = new CartItemModel();
            item.setCart(cart);
            item.setCart_id(cartId.intValue());
            item.setPro_id(productId.intValue());
            item.setQuantity(2);
            item.setPrice("24.68");
            itemId = items.save(item);
            assertNotNull(itemId);
            assertEquals(cartId.intValue(), items.getOne(itemId.intValue()).getCart_id());
            assertEquals("24.68", items.getOne(itemId.intValue()).getPrice());
            item.setId(itemId.intValue());
            item.setQuantity(3);
            item.setPrice("37.02");
            items.update(item);
            assertEquals(3, items.searchIdCart(cartId.intValue()).getQuantity());

            ContactModel contact = new ContactModel();
            contact.setName("Khách thử nghiệm");
            contact.setEmail("demo@example.test");
            contact.setPhone("0900000000");
            contact.setTitle("Liên hệ thử nghiệm");
            contact.setMessage("Nội dung tiếng Việt");
            contact.setCreateByUser(user.getUsername());
            contact.setCreateByDate("31-10-2026");
            contactId = new ContactDAO().save(contact);
            assertNotNull(contactId);
            List<ContactModel> saved = new AbstractDAO<ContactModel>().query(
                    "SELECT * FROM contact WHERE id = ?", new ContactMapper(), contactId);
            assertEquals(1, saved.size());
            assertEquals(contact.getMessage(), saved.get(0).getMessage());
        } finally {
            deleteFixture("contact", contactId);
            deleteFixture("cartitem", itemId);
            deleteFixture("cart", cartId);
            deleteFixture("product", productId);
            deleteFixture("user", userId);
        }
    }

    private void deleteFixture(String table, Long id) throws Exception {
        if (id == null) {
            return;
        }
        try (Connection connection = new AbstractDAO<Object>().getConnection();
                PreparedStatement statement = connection.prepareStatement(
                        "DELETE FROM `" + table + "` WHERE id = ?")) {
            statement.setLong(1, id);
            statement.executeUpdate();
        }
    }
}
