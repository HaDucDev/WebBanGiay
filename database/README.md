# Database cho code hiện tại

Nếu đã có image MySQL `8.0.29` trong Docker Desktop, xem [hướng dẫn tạo container, import dữ liệu và kết nối Java](HUONG_DAN_MYSQL_DOCKER.md).

Đã có Compose và file BAT: mở Docker Desktop rồi bấm `START_MYSQL.bat` ở thư mục gốc. Script tạo `.env` nếu chưa có và sinh `src/main/resources/db.properties` từ cấu hình đó. Dùng `STOP_MYSQL.bat` để dừng; volume giữ nguyên dữ liệu. Nếu dùng MySQL riêng ngoài Compose, có thể tự tạo `db.properties` theo mẫu bên dưới.

## Đối chiếu SQL gốc

`../Web_Ban_Giay.sql` chưa dùng trực tiếp được với DAO/Mapper hiện tại. File gốc được giữ nguyên; script tương thích với code là [init.sql](init.sql).

| Thành phần | SQL gốc | Code hiện tại cần |
|---|---|---|
| Người dùng | `Account`, `Customer` tách riêng | `user` có thông tin cá nhân, tài khoản và `role` |
| Đơn hàng | `Order_` | `cart`, `cartitem` |
| Liên hệ | Không có | `contact` |
| Sản phẩm | `promotion_id`, `catagory_id` | `promotion`, `category`, thêm `thumbnail`, `createdate`, `type` |
| Khóa chính | `CHAR(10)` | Số nguyên tự tăng để dùng `getInt()` và generated keys |
| Khuyến mãi | Thiếu `img`, `alt_img` | Mapper đọc cả hai cột này |

Đổi mỗi tên database trong URL không sửa được các khác biệt trên. Dữ liệu cũ trong `Account`, `Customer`, `Product`... chưa được chuyển sang schema mới.

## Cấu hình chung

Database mặc định duy nhất là **`Web_Ban_Giay`**. `AbstractDAO` và `LoginDAO` đều dùng `utils.DatabaseConnection`, đọc chung [db.properties](../src/main/resources/db.properties):

```properties
driverName = com.mysql.cj.jdbc.Driver
url = jdbc:mysql://127.0.0.1:3307/Web_Ban_Giay?useSSL=false&useUnicode=true&characterEncoding=UTF-8
user = webgiay
password = <MYSQL_PASSWORD_trong_file_.env>
```

Sửa `user` và `password` theo MySQL trên máy sử dụng. Có thể ghi đè bằng `DB_URL`, `DB_USER`, `DB_PASSWORD`; mọi DAO vẫn dùng chung các giá trị đó. Mật khẩu trống cũng được hỗ trợ qua `DB_PASSWORD`.

Driver Maven là `com.mysql:mysql-connector-j:8.0.33`. Đã kiểm tra thực tế với JDK `1.8.0_77` và MySQL `8.0.29`.

## Khởi tạo thủ công khi dùng MySQL riêng

1. Chuẩn bị database mới/trống. Không import SQL gốc trước script mới.
2. Mở `database/init.sql` bằng MySQL Workbench để chạy, hoặc đăng nhập MySQL CLI:

   ```text
   mysql --default-character-set=utf8mb4 -h localhost -u root -p
   ```

   Trong MySQL CLI, chạy:

   ```sql
   SOURCE D:/vtlq-web/WebBanGiay/database/init.sql;
   ```

   Trên máy khác, thay đường dẫn bằng vị trí script thực tế.

3. Sửa cấu hình kết nối trong `src/main/resources/db.properties`.
4. Build lại bằng Maven và triển khai WAR lên Tomcat 9.

Script tạo 7 bảng: `category`, `user`, `promotion`, `product`, `cart`, `cartitem`, `contact`. Tên bảng dùng chữ thường để khớp truy vấn trên MySQL/Linux. Script không xóa database/bảng/dữ liệu; chạy lại trên schema tương thích sẽ giữ dữ liệu đã có.

Nếu đã import SQL gốc vào database cùng tên, script mới không tự chuyển đổi các bảng đó. Cần sao lưu dữ liệu và chuẩn bị schema trống hoặc thực hiện migration riêng.

## Dữ liệu mẫu

Script có 3 danh mục, 3 sản phẩm, 1 khuyến mãi và 2 tài khoản demo:

| Tài khoản | Mật khẩu | Quyền |
|---|---|---|
| `admin` | `admin123` | `admin` |
| `user` | `user123` | `user` |

Đây là dữ liệu mẫu mới cho môi trường phát triển, không phải dữ liệu chuyển từ SQL gốc. Mật khẩu mẫu phù hợp cách so sánh trực tiếp đang có trong `UserDAO`.

Cột ngày vẫn dùng chuỗi vì controller gửi định dạng `dd-mm-yyyy`. Giá là số nguyên vì checkout dùng `Integer.parseInt(...)`. Việc đổi logic ngày/tiền tệ là thay đổi riêng ngoài phạm vi thống nhất database.

## Kiểm thử

[DatabaseIntegrationTest](../src/test/java/integration/DatabaseIntegrationTest.java) kiểm tra hai đường kết nối dùng chung database, truy vấn dữ liệu mẫu, generated keys, CRUD và dữ liệu tiếng Việt trên MySQL thật.

Chỉ bật với database tạm được tạo từ `init.sql`, có nguyên bộ dữ liệu mẫu:

```powershell
$env:JAVA_HOME = 'D:\vtlq-web\jdk1.8.0_77'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
$env:DB_URL = 'jdbc:mysql://127.0.0.1:3307/Web_Ban_Giay?useSSL=false&useUnicode=true&characterEncoding=UTF-8'
$env:DB_USER = 'webgiay'
$env:DB_PASSWORD = '<mat_khau_database_tam>'
$env:DB_INTEGRATION_TEST = 'true'
mvn test
Remove-Item Env:DB_INTEGRATION_TEST
```

URL ví dụ dành cho database tạm trên máy local. Khi không đặt `DB_INTEGRATION_TEST=true`, ba kiểm thử này được bỏ qua để build thông thường không yêu cầu MySQL đang chạy.

Đã kiểm tra import script hai lần, 3 kiểm thử DAO và đóng gói WAR thành công. Các luồng web trên Tomcat, email và JSP còn thiếu cần được kiểm tra riêng.
