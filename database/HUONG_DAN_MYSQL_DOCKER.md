# MySQL Docker Compose: bấm file BAT để chạy

Mở Docker Desktop, đợi Docker Engine sẵn sàng, rồi nhấp đúp **START_MYSQL.bat** ở thư mục gốc project.

## 1. Các file

| File | Tác dụng |
|---|---|
| [START_MYSQL.bat](../START_MYSQL.bat) | Kiểm tra image, tạo/chạy MySQL, chờ dữ liệu sẵn sàng và cập nhật cấu hình Java |
| [STOP_MYSQL.bat](../STOP_MYSQL.bat) | Dừng MySQL, giữ nguyên volume và dữ liệu |
| [compose.yaml](../compose.yaml) | Khai báo MySQL 8.0.29, cổng, volume và script khởi tạo |
| [.env.example](../.env.example) | Mẫu được chép thành .env trong lần chạy đầu |
| [scripts/mysql.ps1](../scripts/mysql.ps1) | Xử lý các bước kiểm tra/khởi động của BAT |
| [init.sql](init.sql) | Schema và dữ liệu mẫu tương thích với code hiện tại |

Các file BAT tìm project theo vị trí của chính chúng, nên có thể nhấp đúp trong Explorer hoặc chạy từ thư mục khác.

## 2. START_MYSQL.bat thực hiện các bước nào?

1. Kiểm tra Docker Engine và Docker Compose.
2. Tạo .env từ .env.example nếu chưa có; giữ nguyên cấu hình local đã tồn tại.
3. Kiểm tra tên container/volume. Nếu trùng tài nguyên không thuộc Compose project này, dừng và báo lỗi để tránh dùng nhầm dữ liệu.
4. Kiểm tra image mysql:8.0.29: có sẵn thì dùng lại, thiếu mới tải.
5. Dùng Compose tạo hoặc mở lại container, network và volume.
6. Chờ MySQL healthy và kiểm tra đủ 7 bảng.
7. Sinh src/main/resources/db.properties từ cấu hình trong .env. File Java cũ được sao lưu trong Temp nếu nội dung thay đổi.
8. In số bản ghi và thông tin kết nối. Bấm phím bất kỳ để đóng cửa sổ; MySQL vẫn chạy nền.

Khi volume còn trống, MySQL tự chạy init.sql. Những lần sau dùng dữ liệu đã có, không import/reset dữ liệu mẫu mỗi lần bấm Start.

## 3. Cấu hình mặc định

| Thông số | Giá trị |
|---|---|
| Compose project | webbangiay |
| Image | mysql:8.0.29 |
| Container | webbangiay-mysql |
| Database | Web_Ban_Giay |
| Kết nối từ Windows | 127.0.0.1:3307 |
| Cổng trong container | 3306 |
| Volume | webbangiay-mysql-data |
| Tài khoản MySQL cho Java | webgiay |
| Mật khẩu mẫu của tài khoản MySQL | WebGiayLocal_123! |
| Mật khẩu mẫu MySQL root | RootLocal_123! |

.env chứa cấu hình local và được Git bỏ qua. src/main/resources/db.properties được sinh từ cấu hình đó, cũng được Git bỏ qua.

Nếu cần đổi thông số trước lần khởi tạo đầu, chép .env.example thành .env và chỉnh:

~~~dotenv
MYSQL_PORT=3307
MYSQL_USER=webgiay
MYSQL_PASSWORD=WebGiayLocal_123!
MYSQL_ROOT_PASSWORD=RootLocal_123!
~~~

Mật khẩu trên là ví dụ cho môi trường local. MYSQL_USER dùng chữ cái, chữ số, gạch dưới và không đặt là root.

## 4. Kiểm tra dữ liệu

Mở PowerShell tại project:

~~~powershell
Set-Location -LiteralPath 'D:\vtlq-web\WebBanGiay'
docker compose ps
docker compose logs --tail 50 mysql
docker compose exec mysql mysql --default-character-set=utf8mb4 -uwebgiay -p Web_Ban_Giay
~~~

Nhập mật khẩu MySQL trong .env, mặc định WebGiayLocal_123!, rồi chạy:

~~~sql
SHOW TABLES;
SELECT COUNT(*) AS so_danh_muc FROM category;
SELECT id, name, price FROM product;
SELECT id, username, role FROM user;
~~~

Ban đầu có 7 bảng, 3 danh mục, 3 sản phẩm, 1 khuyến mãi, 2 tài khoản website. Các bảng cart, cartitem, contact ban đầu trống. Thoát client bằng exit;.

Nếu dùng Workbench/DBeaver: host 127.0.0.1, port 3307, user webgiay, password trong .env, database Web_Ban_Giay.

## 5. Kết nối code và chạy web

Sau khi Start thành công, db.properties có URL/cổng/tài khoản phù hợp với .env:

~~~properties
driverName = com.mysql.cj.jdbc.Driver
url = jdbc:mysql://127.0.0.1:3307/Web_Ban_Giay?useSSL=false&useUnicode=true&characterEncoding=UTF-8
user = webgiay
password = WebGiayLocal_123!
~~~

Khi đổi cấu hình, chỉnh .env và chạy lại Start để đồng bộ file Java. Nếu tiến trình Tomcat đã có DB_URL, DB_USER hoặc DB_PASSWORD trong môi trường, các biến đó vẫn ưu tiên hơn db.properties.

Build bằng JDK 8 rồi deploy WAR mới:

~~~powershell
$env:JAVA_HOME = 'D:\vtlq-web\jdk1.8.0_77'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
mvn clean package
~~~

Build/deploy lại và restart Tomcat sau khi đổi thông số kết nối. BAT MySQL quản lý database; Tomcat được chạy riêng bằng plugin đã cấu hình trong Eclipse.

Tài khoản website:

| Tài khoản | Mật khẩu | Quyền |
|---|---|---|
| admin | admin123 | Quản trị |
| user | user123 | Khách hàng |

Tài khoản MySQL webgiay dùng cho kết nối database; tài khoản website admin/user nằm trong bảng user.

Compose dùng database/init.sql; SQL gốc Web_Ban_Giay.sql thuộc schema khác và chưa được tự chuyển dữ liệu sang đây.

## 6. Dừng/chạy lại và giữ dữ liệu

- Bấm STOP_MYSQL.bat để dừng.
- Bấm START_MYSQL.bat để mở lại.
- Volume webbangiay-mysql-data giữ dữ liệu. Hai file BAT không xóa container, volume hoặc database.
- Restart Docker không xóa volume. Sau khi chủ động Stop, bấm Start để mở lại.
- Image và Git không chứa những bản ghi mới được thêm vào volume. Muốn chuyển dữ liệu thực tế sang máy khác cần backup/restore database riêng.

Chạy trong PowerShell mà không chờ nhấn phím cuối lệnh:

~~~powershell
.\START_MYSQL.bat --no-pause
.\STOP_MYSQL.bat --no-pause
~~~

## 7. Các lỗi thường gặp

**Docker Engine is unavailable:** mở Docker Desktop, chờ Engine sẵn sàng rồi bấm Start lại.

**Tên container/volume tồn tại bên ngoài Compose project:** script giữ nguyên tài nguyên cũ và dừng. Kiểm tra chúng trước khi sử dụng/chuyển dữ liệu; script không tự ghi đè tài nguyên từ lệnh docker run hoặc project khác.

**Cổng 3307 đang dùng:** đổi MYSQL_PORT trong .env, ví dụ 3308, rồi chạy lại Start. Compose có thể tạo lại container của chính project để đổi cổng; named volume được giữ. Cấu hình Java được cập nhật theo cổng mới.

**Đổi mật khẩu .env rồi MySQL không healthy:** các biến khởi tạo chỉ đặt mật khẩu khi volume trống. Đổi .env không đổi mật khẩu trong database đã tồn tại. Giữ .env khớp tài khoản hiện có hoặc đổi tài khoản trong MySQL trước; không xóa volume khi đang cần giữ dữ liệu.

**Thiếu bảng:** volume có schema khác hoặc quá trình khởi tạo từng thất bại. Kiểm tra logs và schema; init.sql không phải migration tự động từ Web_Ban_Giay.sql.

**Java kết nối DB/cổng cũ:** chạy lại Start để sinh db.properties, kiểm tra DB_* trong môi trường Tomcat, rồi build/deploy lại WAR.

## Tài liệu tham khảo

- [MySQL Docker Official Image](https://hub.docker.com/_/mysql)
- [Docker Compose up và chờ service healthy](https://docs.docker.com/reference/cli/docker/compose/up/)
- [Docker volumes](https://docs.docker.com/engine/storage/volumes/)
