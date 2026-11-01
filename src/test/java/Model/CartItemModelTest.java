package Model;

import static org.junit.Assert.assertEquals;
import java.math.BigDecimal;
import org.junit.Test;

public class CartItemModelTest {
    private CartItemModel item(String price, int quantity) {
        ProductModel product = new ProductModel();
        product.setPrice(price);
        CartItemModel item = new CartItemModel();
        item.setProduct(product);
        item.setQuantity(quantity);
        return item;
    }

    @Test
    public void retainsCentsWhenMultiplyingLegacyDollarPrices() {
        assertEquals(new BigDecimal("29.40"), item("9.80", 3).getTotalPrice());
        assertEquals(new BigDecimal("84.80"), item("42.40", 2).getTotalPrice());
    }

    @Test
    public void calculatesDecimalMoneyWithoutBinaryFloatingPointArtifacts() {
        assertEquals(new BigDecimal("0.30"), item("0.10", 3).getTotalPrice());
        assertEquals(new BigDecimal("29.97"), item("9.99", 3).getTotalPrice());
    }

    @Test
    public void supportsIntegerDollarPricesWithTwoDecimalPlaces() {
        assertEquals(new BigDecimal("28.00"), item("14", 2).getTotalPrice());
    }
}
