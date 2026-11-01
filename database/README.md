# Database cho website hiện tại

File khởi tạo duy nhất là [Web_Ban_Giay.sql](Web_Ban_Giay.sql), đặt trong thư mục `database` cùng BAT, `mysql.ps1`, `compose.yaml`, `.env.example`, tài liệu. Bản SQL lịch sử đã chuyển sang `XYZ/database/legacy`. Compose dùng `./Web_Ban_Giay.sql` tương đối với thư mục này và chạy file khi volume MySQL còn trống. `database/init.sql` đã được bỏ để tránh có hai nguồn schema/dữ liệu mẫu.

## Schema và dữ liệu được dùng

Giữ schema tương thích với DAO/Mapper hiện tại: 7 bảng `category`, `user`, `promotion`, `product`, `cart`, `cartitem`, `contact`. Tên database vẫn là **Web_Ban_Giay**.

Dữ liệu được chuyển từ bản SQL cũ, tên sản phẩm/danh mục/mô tả bằng tiếng Anh và giá **USD**, theo giao diện hiện có:

| Dữ liệu | Số bản ghi | Cách chuyển |
|---|---:|---|
| Danh mục | 11 | Giữ 3 nhóm giày cũ, thêm Dresses, Women's Tops, Men's Tops, Women's Trousers, Men's Trousers & Shorts, Jeans, Skirts, Costumes |
| Sản phẩm | 46 | Giữ 9 mẫu giày; thêm 37 sản phẩm quần áo đặt tên theo ảnh thật có sẵn |
| Khuyến mãi | 10 | KM1–KM10 → ID 1–10; mã ABC1–ABC10; phần trăm lưu dạng số |
| Tài khoản | 12 | Giữ 2 tài khoản demo; đưa 10 tài khoản cũ vào bảng `user` với quyền `user` |
| Đơn hàng/liên hệ | 0 | Bắt đầu trống để thử luồng hiện tại |

`Customer`, `Order_`, `Type` từ SQL cũ chưa được nhập: dữ liệu khách hàng/đơn hàng có số cột không khớp, ngày không chuẩn, liên kết khách hàng–tài khoản không được khai báo và có tham chiếu SP10 không tồn tại. Không ghép khách hàng với tài khoản chỉ dựa vào thứ tự dòng. Bản gốc được giữ nguyên tại [XYZ/database/legacy/Web_Ban_Giay.original.sql](../XYZ/database/legacy/Web_Ban_Giay.original.sql), chỉ để đối chiếu.

## Giá USD và ảnh

Giữ giá gốc theo USD: `14 → 14.00`, `9.8 → 9.80`, `34.8 → 34.80`; không nhân sang VNĐ. Hai cột `product.price` và `cartitem.price` dùng `DECIMAL(12,2) UNSIGNED`.

Java tính tổng dòng hàng bằng `BigDecimal`; JSP dùng thẻ `shop:price` để hiển thị thống nhất như `$9.80`. Ví dụ 3 đôi giá $9.80 có tổng $29.40. Các tổng $59/$61 gán cứng của giỏ hàng đã được thay bằng dữ liệu thực tế. Checkout lưu tổng dòng hàng có phần lẻ và hiển thị các sản phẩm vừa đặt.

Các phần trăm khuyến mãi được giữ làm dữ liệu; luồng tính giá hiện tại chưa tự áp dụng giảm giá. Tổng đơn hiện là tổng giá niêm yết × số lượng, thuế 0 và giao hàng miễn phí trong bản demo.

Catalog dùng 39 ảnh có sẵn cho sản phẩm giày và quần áo phù hợp. ID 1 và 3 dùng ảnh minh họa giày; 7 mẫu giày cũ chưa có ảnh để `thumbnail = NULL`, hiển thị “Photo coming soon”. ID 10–46 là quần áo có tên/mô tả khớp ảnh; giá là giá mẫu USD. Toàn bộ ảnh gốc được giữ nguyên. Xem [báo cáo kiểm tra ảnh](../docs/IMAGE_AUDIT.md) và [danh mục ảnh có thể lọc](../docs/IMAGE_CATALOG.html).

## Tạo mới bằng Docker

Theo lựa chọn hiện tại, hãy tạo lại database từ đầu; không chạy script mới lên schema cũ để mong tự nâng cấp kiểu giá.

1. Tự dừng/xóa container và volume database cũ của project khi không cần dữ liệu trong đó nữa.
2. Mở Docker Desktop.
3. Mở thư mục `database`, bấm [START_MYSQL.bat](START_MYSQL.bat).
4. MySQL chạy `database/Web_Ban_Giay.sql` khi volume trống. Console sẽ in số dòng của từng bảng.
5. Trong Eclipse: F5 → Project → Clean → Stop/Start Tomcat → Ctrl+F5 ở trình duyệt.

Chỉ xóa container rồi chạy lại sẽ vẫn dùng dữ liệu cũ nếu named volume `webbangiay-mysql-data` còn tồn tại. File Start không tự xóa/reset volume. Xem [hướng dẫn Docker](HUONG_DAN_MYSQL_DOCKER.md) để biết lệnh tạo lại đúng phạm vi project.

## Khởi tạo với MySQL riêng

Chuẩn bị database mới/trống, mở file SQL chính trong Workbench, hoặc đăng nhập MySQL CLI rồi chạy:

```sql
SOURCE D:/vtlq-web/WebBanGiay/database/Web_Ban_Giay.sql;
```

Trên máy khác, thay đường dẫn bằng vị trí project thực tế. Script không có lệnh xóa database hoặc bảng; nó dành cho khởi tạo mới, không phải migration của schema cũ.

## Kết nối

`AbstractDAO` và `LoginDAO` dùng chung `utils.DatabaseConnection`, đọc `src/main/resources/db.properties`:

```properties
driverName = com.mysql.cj.jdbc.Driver
url = jdbc:mysql://127.0.0.1:3307/Web_Ban_Giay?useSSL=false&useUnicode=true&characterEncoding=UTF-8
user = webgiay
password = <MYSQL_PASSWORD_trong_file_.env>
```

Start BAT sinh file này từ `database/.env`; mẫu cấu hình là `database/.env.example`. Có thể ghi đè bằng `DB_URL`, `DB_USER`, `DB_PASSWORD` trong môi trường Tomcat. Tài khoản website khác tài khoản MySQL.

| Tài khoản website | Mật khẩu | Quyền |
|---|---|---|
| admin | admin123 | admin |
| user | user123 | user |
| AN | 123456 | user |

Mười tài khoản cũ giữ nguyên mật khẩu trong SQL gốc; tên đăng nhập được liệt kê trong file SQL chính. Chúng đều có quyền khách hàng.

## Kiểm thử

`mvn test` chạy kiểm thử tính tiền không cần MySQL. Ba kiểm thử DAO được cập nhật cho 46 sản phẩm/11 danh mục/10 khuyến mãi và bộ lọc danh mục động, giá có phần lẻ, ảnh có thật và đăng nhập tài khoản cũ. Chỉ bật kiểm thử DAO trên database tạm/trống được tạo từ file SQL chính:

```powershell
$env:JAVA_HOME = 'D:\vtlq-web\jdk1.8.0_77'
$env:DB_URL = 'jdbc:mysql://127.0.0.1:3307/Web_Ban_Giay?useSSL=false&useUnicode=true&characterEncoding=UTF-8'
$env:DB_USER = 'webgiay'
$env:DB_PASSWORD = '<mat_khau_database_tam>'
$env:DB_INTEGRATION_TEST = 'true'
mvn test
Remove-Item Env:DB_INTEGRATION_TEST
```

Các kiểm thử DAO có tạo/cập nhật/xóa dữ liệu thử và dọn các dòng của chính chúng sau khi chạy. Khi không đặt `DB_INTEGRATION_TEST=true`, chúng được bỏ qua; build thông thường không đòi MySQL đang chạy.

Build thông thường không truy cập database. Có thể kiểm tra số dòng sau khi tự tạo mới: 11 danh mục, 46 sản phẩm, 39 thumbnail có ảnh và 7 thumbnail NULL. Database/container/volume đang dùng không được sửa hoặc xóa trong lần cập nhật mã nguồn này.
