# Kiểm tra ảnh và catalog cửa hàng

**Cập nhật vị trí:** 186 ảnh/SVG chưa dùng đã chuyển vào `XYZ/src/main/webapp`, giữ nguyên nội dung; 89 ảnh/SVG đang được tham chiếu vẫn ở webapp. Số 275 file trong báo cáo gồm cả phần đang dùng và phần lưu trữ. Gallery đã cập nhật đường dẫn và vẫn xem được toàn bộ ảnh. Xem [chi tiết di chuyển](../XYZ/README.md).

Mở [IMAGE_CATALOG.html](IMAGE_CATALOG.html) để xem toàn bộ ảnh local, tìm theo đường dẫn hoặc tên sản phẩm và lọc những ảnh đã được dùng trong catalog.

## Kết quả kiểm kê

Đã kiểm tra nội dung của toàn bộ 274 file ảnh gốc trong `src/main/webapp`, gom bản trùng bằng SHA-256 và xem đủ 128 ảnh JPG/PNG/GIF khác nhau. 58 SVG gốc là tài nguyên font/glyph, không phải ảnh sản phẩm. Giữ nguyên mọi file ảnh gốc; chỉ bổ sung SVG ảnh chờ.

| Phạm vi | Số lượng |
|---|---:|
| File ảnh gốc | 274 |
| Nội dung ảnh gốc khác nhau | 157 |
| JPG/PNG/GIF gốc | 216 file / 128 nội dung |
| SVG font gốc | 58 file / 29 nội dung |
| Bản trùng trong ảnh gốc | 117 |
| SVG ảnh chờ bổ sung | 1 |
| Tổng hiện tại | 275 file / 158 nội dung |
| Ảnh khác nhau được gán cho sản phẩm | 39 |

Cửa hàng hiện bán nhiều nhóm hàng. Ảnh váy, áo và quần được dùng cho các sản phẩm quần áo tương ứng; không gán chúng cho sản phẩm giày. Hai ảnh giày hiện có được dùng minh họa cho ID 1 và 3. Bảy mẫu giày cũ chưa có ảnh phù hợp vẫn dùng “Photo coming soon”.

## Dữ liệu mới

[database/Web_Ban_Giay.sql](../database/Web_Ban_Giay.sql) là nguồn khởi tạo duy nhất: **46 sản phẩm, 11 danh mục**, tên/mô tả tiếng Anh và giá USD. Giữ 9 sản phẩm giày cũ, bổ sung 37 sản phẩm quần áo dựa trên ảnh có sẵn. Giá quần áo là giá mẫu để thử ứng dụng, không phải báo giá thị trường.

| Danh mục | Sản phẩm | Có ảnh |
|---|---:|---:|
| Men's Shoes | 3 | 2 |
| Women's Shoes | 3 | 0 |
| Kids' Shoes | 3 | 0 |
| Dresses | 7 | 7 |
| Women's Tops | 5 | 5 |
| Men's Tops | 4 | 4 |
| Women's Trousers | 11 | 11 |
| Men's Trousers & Shorts | 6 | 6 |
| Jeans | 2 | 2 |
| Skirts | 1 | 1 |
| Costumes | 1 | 1 |

## Bảng gán ảnh

Mọi đường dẫn bên dưới tính từ `src/main/webapp`. Tên hàng được đặt theo quần áo nhìn thấy trong ảnh; mô tả ghi rõ bán món nào, tránh hiểu rằng cả bộ đồ/phụ kiện đều đi kèm.

| ID | Sản phẩm | Giá USD | Ảnh |
|---|---|---:|---|
| 1 | Men's Air-Cushioned Trainers | $14.00 | [images/image1.jpg](../src/main/webapp/images/image1.jpg) |
| 2 | Men's Leather Slip-On Loafers | $9.80 | Ảnh chờ |
| 3 | UDANY Men's Premium Leather Shoes | $34.80 | [images/reference/userTu/images/3.jpg](../src/main/webapp/images/reference/userTu/images/3.jpg) |
| 4 | Women's Mesh Sneakers | $186.00 | Ảnh chờ |
| 5 | SODOHA Women's Office Shoes | $42.40 | Ảnh chờ |
| 6 | Women's Pointed-Toe Flats | $7.70 | Ảnh chờ |
| 7 | Biti's Kids' Woven-Strap Trainers | $42.40 | Ảnh chờ |
| 8 | CrownUK Kids' Low-Top Sneakers | $16.80 | Ảnh chờ |
| 9 | Crown Space Girls' Ballet Flats | $16.80 | Ảnh chờ |
| 10 | White Strapless Party Dress | $49.90 | [assets/user/images/shop/product7.jpg](../src/main/webapp/assets/user/images/shop/product7.jpg) |
| 11 | Red Floral Cheongsam | $59.90 | [assets/user/images/shop/product9.jpg](../src/main/webapp/assets/user/images/shop/product9.jpg) |
| 12 | Pink Bunny Costume | $34.90 | [assets/user/images/shop/product8.jpg](../src/main/webapp/assets/user/images/shop/product8.jpg) |
| 13 | Navy Open-Front Cardigan | $29.90 | [assets/user/images/home/product1.jpg](../src/main/webapp/assets/user/images/home/product1.jpg) |
| 14 | Men's Color-Block Polo Shirt | $24.90 | [assets/user/images/home/product2.jpg](../src/main/webapp/assets/user/images/home/product2.jpg) |
| 15 | Black Sleeveless Dress | $39.90 | [assets/user/images/home/product3.jpg](../src/main/webapp/assets/user/images/home/product3.jpg) |
| 16 | Royal Blue Long-Sleeve Top | $22.90 | [assets/user/images/home/product5.jpg](../src/main/webapp/assets/user/images/home/product5.jpg) |
| 17 | White V-Neck T-Shirt | $12.90 | [assets/user/images/home/product6.jpg](../src/main/webapp/assets/user/images/home/product6.jpg) |
| 18 | Taupe Sleeveless Top | $18.90 | [assets/user/images/shop/product10.jpg](../src/main/webapp/assets/user/images/shop/product10.jpg) |
| 19 | Men's Blue Polo Shirt | $24.90 | [assets/user/images/shop/product12.jpg](../src/main/webapp/assets/user/images/shop/product12.jpg) |
| 20 | Pink Printed Palazzo Trousers | $29.90 | [images/reference/userTu/images/pi.png](../src/main/webapp/images/reference/userTu/images/pi.png) |
| 21 | Black and White Geometric Trousers | $28.90 | [images/reference/userTu/images/pi1.png](../src/main/webapp/images/reference/userTu/images/pi1.png) |
| 22 | Red Polka-Dot Trousers | $26.90 | [images/reference/userTu/images/pi2.png](../src/main/webapp/images/reference/userTu/images/pi2.png) |
| 23 | Red Maxi Skirt | $32.90 | [images/reference/userTu/images/pi3.png](../src/main/webapp/images/reference/userTu/images/pi3.png) |
| 24 | Plum Relaxed Joggers | $27.90 | [images/reference/userTu/images/si.jpg](../src/main/webapp/images/reference/userTu/images/si.jpg) |
| 25 | Blue and White Wide-Leg Trousers | $29.90 | [images/reference/userTu/images/pi5.png](../src/main/webapp/images/reference/userTu/images/pi5.png) |
| 26 | Pastel Printed Trousers | $25.90 | [images/reference/userTu/images/pi6.png](../src/main/webapp/images/reference/userTu/images/pi6.png) |
| 27 | Light-Wash Skinny Jeans | $34.90 | [images/reference/userTu/images/pi7.png](../src/main/webapp/images/reference/userTu/images/pi7.png) |
| 28 | Black Wide-Leg Trousers | $32.90 | [images/reference/userTu/images/pi8.png](../src/main/webapp/images/reference/userTu/images/pi8.png) |
| 29 | Men's Charcoal Trousers | $39.90 | [images/reference/userTu/images/pi9.png](../src/main/webapp/images/reference/userTu/images/pi9.png) |
| 30 | Navy Slim Trousers | $31.90 | [images/reference/userTu/images/pi10.png](../src/main/webapp/images/reference/userTu/images/pi10.png) |
| 31 | Black Ankle Trousers | $29.90 | [images/reference/userTu/images/pi11.png](../src/main/webapp/images/reference/userTu/images/pi11.png) |
| 32 | Men's Light Grey Trousers | $37.90 | [images/reference/userTu/images/pi12.png](../src/main/webapp/images/reference/userTu/images/pi12.png) |
| 33 | Navy Maxi Dress | $44.90 | [images/reference/userTu/images/ce.jpg](../src/main/webapp/images/reference/userTu/images/ce.jpg) |
| 34 | Red Sleeveless Dress | $36.90 | [images/reference/userTu/images/ce1.jpg](../src/main/webapp/images/reference/userTu/images/ce1.jpg) |
| 35 | Floral Shift Dress | $32.90 | [images/reference/userTu/images/ce2.jpg](../src/main/webapp/images/reference/userTu/images/ce2.jpg) |
| 36 | Men's Black Crew-Neck T-Shirt | $16.90 | [images/reference/userTu/images/pr.jpg](../src/main/webapp/images/reference/userTu/images/pr.jpg) |
| 37 | Men's Red Graphic T-Shirt | $18.90 | [images/reference/userTu/images/pr2.jpg](../src/main/webapp/images/reference/userTu/images/pr2.jpg) |
| 38 | Teal Double-Breasted Tunic | $39.90 | [images/reference/userTu/images/pr3.jpg](../src/main/webapp/images/reference/userTu/images/pr3.jpg) |
| 39 | Multicolor Striped Trousers | $28.90 | [images/reference/userTu/images/t1.jpg](../src/main/webapp/images/reference/userTu/images/t1.jpg) |
| 40 | Men's Camouflage Cargo Shorts | $29.90 | [images/reference/userTu/images/t2.jpg](../src/main/webapp/images/reference/userTu/images/t2.jpg) |
| 41 | Men's Tan Cargo Shorts | $27.90 | [images/reference/userTu/images/t3.jpg](../src/main/webapp/images/reference/userTu/images/t3.jpg) |
| 42 | Men's Cream Chinos | $34.90 | [images/reference/userTu/images/t5.jpg](../src/main/webapp/images/reference/userTu/images/t5.jpg) |
| 43 | Men's Sand Chinos | $34.90 | [images/reference/userTu/images/t6.jpg](../src/main/webapp/images/reference/userTu/images/t6.jpg) |
| 44 | Cream Printed Cropped Trousers | $26.90 | [images/reference/userTu/images/t10.jpg](../src/main/webapp/images/reference/userTu/images/t10.jpg) |
| 45 | Indigo Skinny Jeans | $34.90 | [images/reference/userTu/images/t11.jpg](../src/main/webapp/images/reference/userTu/images/t11.jpg) |
| 46 | Black Cap-Sleeve Dress | $42.90 | [assets/user/images/product-details/1.jpg](../src/main/webapp/assets/user/images/product-details/1.jpg) |

## Những ảnh khác được giữ lại

- `product-details/1.jpg` là váy đen tay ngắn (ID 46), khác váy đen không tay ở `home/product3.jpg` (ID 15).
- `shop/product7.jpg`, `product8.jpg`, `product9.jpg` lần lượt là váy trắng, trang phục bunny hồng và cheongsam đỏ; đã dùng cho ID 10, 12, 11.
- `si.jpg`, `si1.jpg`, `si2.jpg` và `pi4.png` thể hiện cùng mẫu quần màu mận. Dùng ảnh lớn `si.jpg` cho ID 24 và `si1.jpg` cho banner; giữ các góc khác, không tạo nhiều sản phẩm chỉ vì khác góc chụp.
- `home/product4.jpg`, các ảnh `similar*.jpg` và `recommend*.jpg` là ảnh khác/crop của những mẫu đã có. Giữ lại để dùng sau, không nhân bản mặt hàng từ ảnh crop.
- Các ảnh `t*.jpg`, `ce*.jpg`, `pr*.jpg` còn dùng được nhưng có độ phân giải thấp. Những mẫu có nội dung rõ đã được dùng; CSS giữ tỉ lệ và hạn chế phóng lớn. Khi có ảnh lớn hơn có thể thay thumbnail.
- `image1.jpg` ở gốc webapp trùng `images/image1.jpg`; hai đường dẫn không phải hai sản phẩm.
- `giaythethaonam.jpg` thực tế là ảnh đồng hồ/phong cách nam. Không dùng nó làm ảnh giày.
- Giữ ảnh người mẫu cho banner, ảnh cửa hàng cho nội dung biên tập, avatar/logo/icon/font cho giao diện tương ứng. Các ảnh còn lại vẫn có trong gallery, không bị xóa.

## Giao diện dùng dữ liệu

Sidebar lấy 11 danh mục từ database. Bộ lọc nhận code danh mục qua tham số `action`; thêm danh mục trong DB không phải sửa danh sách ba nhóm giày gán cứng. Shop phân trang thật, 12 sản phẩm/trang; liên kết trang giữ bộ lọc. Trang chủ hiển thị sản phẩm nổi bật và hàng mới. Chi tiết dùng tên/ảnh/mô tả thực và gợi ý cùng danh mục, bỏ ảnh carousel/review mẫu gán cứng.

Form thêm/sửa sản phẩm quản trị tải danh mục động và lưu đường dẫn ảnh có sẵn. Có thể điền `images/reference/userTu/images/pi.png`; để trống thì dùng ảnh chờ. Form này không tải file từ máy lên server.

## Áp dụng dữ liệu

Người dùng tự tạo mới MySQL theo [hướng dẫn database](../database/README.md). Chỉ sửa SQL hoặc restart Tomcat không thay dữ liệu trong volume cũ. `INSERT IGNORE` không ghi đè ID đã có.

Sau khi tạo volume mới và chạy `database/START_MYSQL.bat`, kiểm tra:

```sql
SELECT COUNT(*) FROM category; -- 11
SELECT COUNT(*) FROM product; -- 46
SELECT COUNT(thumbnail) FROM product; -- 39
SELECT c.name, COUNT(p.id) AS products
FROM category c LEFT JOIN product p ON p.category = c.id
GROUP BY c.id, c.name ORDER BY c.id;
```

Sau đó F5 project → Project → Clean → Stop/Start Tomcat → Ctrl+F5 trên trình duyệt. Lần sửa này không thay đổi database/container/volume đang chạy.

## Kiểm tra bản sửa

- Maven package bằng JDK 8 thành công; 3 kiểm thử tính tiền chạy qua. Ba kiểm thử DAO được cập nhật nhưng chưa bật vì người dùng sẽ tự tạo lại MySQL.
- Tomcat chạy thử riêng dùng service giả lập từ đúng dữ liệu SQL mới: 46 trang chi tiết, 11 bộ lọc danh mục, 4 trang Shop không trùng/thiếu ID, trang chủ 15 thẻ hàng, form quản trị đủ 11 danh mục, giỏ hàng và xác nhận đơn đều render được. Các URL danh mục/ID/trang không hợp lệ trả lỗi phù hợp.
- 39 ảnh sản phẩm, ảnh chờ và các CSS/JS kiểm tra trả đúng nội dung file trên đĩa; tài nguyên không tồn tại trả 404. Tổng tiền vẫn đúng $9.80 × 3 = $29.40.
- Gallery giữ đủ 275 file / 158 nhóm nội dung và JavaScript hợp lệ. Đây là kiểm tra render/HTTP và nội dung ảnh, chưa xác nhận trực quan bố cục trong trình duyệt hoặc chạy DAO trên MySQL mới.
