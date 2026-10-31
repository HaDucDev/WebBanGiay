# WebBanGiay

Ứng dụng Java Web dùng Servlet/JSP, Maven và Tomcat. Maven artifact của dự án là `LastEcommerce`, kiểu đóng gói `war`.

Mã nguồn và giao diện hiện tại được lấy từ bản `D:\vtlq-web\ECommerce\ECommerce`, sau đó đã thống nhất cấu hình database. Tên Maven artifact và cấu hình Eclipse của workspace là `LastEcommerce`; cấu hình build dùng Java 8, UTF-8 và JSP API scope `provided`.

## Môi trường

- JDK 8. Trên máy hiện tại: `D:\vtlq-web\jdk1.8.0_77`.
- Maven 3.8.6 đã được dùng để kiểm tra build với JDK trên.
- Tomcat 9 để triển khai ứng dụng. Trên máy hiện tại: `D:\vtlq-web\apache-tomcat-9.0.69`.
- Cơ sở dữ liệu MySQL và cấu hình kết nối phù hợp với môi trường chạy.

Đường dẫn JDK/Tomcat được chọn trên từng máy; `pom.xml` chỉ khai báo phiên bản Java 8, không gắn với một đường dẫn cài đặt cụ thể.

## Cấu trúc Maven

```text
WebBanGiay/
├── pom.xml
├── .mvn/schemas/         # XML Schema Maven dùng để kiểm tra pom.xml cục bộ
├── database/             # Script database tương thích và hướng dẫn
├── src/
│   └── main/
│       ├── java/          # Controller, DAO, Service, Model và mã Java khác
│       ├── resources/     # db.properties và message.properties
│       └── webapp/        # JSP, CSS, JavaScript, ảnh và WEB-INF
├── .settings/            # Cấu hình dự án cho Eclipse
├── .classpath
├── .project
└── target/               # Maven sinh khi build
```

Khi cần tài nguyên trên classpath, đặt tại `src/main/resources`. Khi có kiểm thử Java, đặt tại `src/test/java`. Maven nhận diện các đường dẫn chuẩn này mà không cần khai báo lại trong `pom.xml`.

Mã ứng dụng dựa trên bản ECommerce; phần kết nối database và giao diện đã được dọn lại. Hiện có 21 file JSP, gồm layout, các phần header/footer và nội dung trang. Controller phía người dùng dùng package `Controller.user`.

## Giao diện

- `assets/admin`, `assets/user`: CSS, JavaScript, font và ảnh của hai giao diện đang dùng.
- `decorators`: layout SiteMesh dùng chung, cùng header/footer/navigation.
- `views`: nội dung trang được controller chuyển tới.
- `images/reference`: ảnh được giữ từ các bộ template `adminTu`, `authTu`, `userTu` chưa sử dụng. CSS/JS/font không dùng của các bộ này đã được bỏ.

Xem [docs/FRONTEND.md](docs/FRONTEND.md) để biết phần đã dọn, cách thêm trang và các hạn chế hiện có.

## Khởi tạo database

Ứng dụng dùng một database **`Web_Ban_Giay`**, tạo bằng [database/init.sql](database/init.sql). File `Web_Ban_Giay.sql` ở thư mục gốc thuộc schema cũ và chưa tương thích trực tiếp với DAO/Mapper hiện tại.

Xem [database/README.md](database/README.md) để đối chiếu schema, import dữ liệu mẫu, cấu hình tài khoản MySQL và chạy kiểm thử. Mọi DAO dùng chung `src/main/resources/db.properties`; có thể ghi đè bằng `DB_URL`, `DB_USER`, `DB_PASSWORD`.

Để chạy MySQL bằng Docker, mở Docker Desktop rồi bấm [START_MYSQL.bat](START_MYSQL.bat). Script dùng [compose.yaml](compose.yaml), kiểm tra image có sẵn, tạo/chạy container, chờ khởi tạo dữ liệu và sinh cấu hình Java từ `.env`. Bấm [STOP_MYSQL.bat](STOP_MYSQL.bat) để dừng mà giữ dữ liệu.

`.env` được tạo từ `.env.example` trong lần chạy đầu. `.env` và `src/main/resources/db.properties` là cấu hình local, được Git bỏ qua. Khi clone project sang máy khác, chạy Start để tạo các file này. Xem [hướng dẫn MySQL Docker](database/HUONG_DAN_MYSQL_DOCKER.md) để thay cổng, kiểm tra dữ liệu và xử lý lỗi.

## Build bằng Maven trên PowerShell

Mở PowerShell tại thư mục chứa `pom.xml`, rồi chạy:

```powershell
$env:JAVA_HOME = 'D:\vtlq-web\jdk1.8.0_77'
$env:PATH = "$env:JAVA_HOME\bin;$env:PATH"
mvn -version
mvn clean package
```

Kiểm tra `mvn -version` hiển thị Java `1.8.0_77`. Các biến môi trường trên chỉ thay đổi trong phiên PowerShell hiện tại. Trên máy khác, thay `JAVA_HOME` bằng đường dẫn JDK 8 thực tế.

Kết quả đóng gói:

```text
target/LastEcommerce-0.0.1-SNAPSHOT.war
```

Đây là ứng dụng WAR, cần triển khai lên Tomcat để chạy. Project không có hàm `main` để chạy toàn bộ ứng dụng bằng nút Run Java Application.

## Mở bằng IntelliJ IDEA

1. Chọn **File → Open**, mở `pom.xml` ở thư mục gốc và chọn mở dưới dạng project nếu được hỏi.
2. Chờ Maven đồng bộ thư viện. Nếu chưa được nhận diện, dùng **Add as Maven Project** cho `pom.xml`.
3. Vào **File → Project Structure → Project**, chọn **Project SDK** là JDK 8 tại `D:\vtlq-web\jdk1.8.0_77` và đặt **Language level** là Java 8.
4. Trong **Settings → Build, Execution, Deployment → Build Tools → Maven → Runner**, chọn **JRE** là JDK 8 hoặc **Project JDK** trỏ tới JDK trên. Nếu bản IntelliJ đang dùng yêu cầu JDK mới hơn cho Maven importer, giữ JDK importer mà IDE hỗ trợ; mã nguồn và Maven build vẫn dùng Java 8 như đã cấu hình.
5. Trong cửa sổ Maven, chạy **Lifecycle → clean**, rồi **package**.
6. Nếu IntelliJ có hỗ trợ chạy Tomcat, tạo cấu hình **Tomcat Server → Local**, chọn Tomcat 9, JRE 8 và thêm WAR/WAR exploded vào **Deployment**. Có thể đặt **Application context** là `/LastEcommerce` để khớp cấu hình Eclipse.

Nếu IDE không có tính năng quản lý Tomcat, vẫn mở và build được dự án Maven. Triển khai WAR vào bản Tomcat 9 bên ngoài IDE để chạy ứng dụng.

Tham khảo: [Mở dự án Maven trong IntelliJ IDEA](https://www.jetbrains.com/help/idea/maven-support.html), [chọn JRE cho Maven Runner](https://www.jetbrains.com/help/idea/maven-runner.html).

## Mở bằng Eclipse

Xem [HUONG_DAN_ECLIPSE.md](HUONG_DAN_ECLIPSE.md). Import qua **File → Import → Maven → Existing Maven Projects**, rồi chọn thư mục chứa `pom.xml`.

Nếu project đã mở từ trước khi chuyển cấu trúc, refresh và chạy **Maven → Update Project** để Eclipse cập nhật source root và thư viện.

## Triển khai WAR ngoài IDE

1. Build thành công bằng Maven.
2. Chép `target/LastEcommerce-0.0.1-SNAPSHOT.war` vào thư mục `webapps` của Tomcat 9. Có thể đổi tên bản sao thành `LastEcommerce.war` để dùng context `/LastEcommerce`.
3. Chạy Tomcat bằng JDK 8.
4. Truy cập `http://localhost:8080/LastEcommerce/` nếu đã đặt tên WAR như bước trên và Tomcat dùng cổng 8080.

## Chuyển dự án giữa các máy

- Mang theo mã nguồn, nội dung web, `pom.xml`, file hướng dẫn và cấu hình Eclipse nếu dùng Eclipse.
- Cài JDK 8, Maven và Tomcat 9 trên máy nhận, rồi chọn lại đường dẫn cài đặt trong IDE.
- `target`, `build`, `.metadata`, `.idea` và file `*.iml` là dữ liệu build hoặc cấu hình cục bộ; đã có quy tắc bỏ qua trong `.gitignore`.
- `target` và `build` đã được bỏ khỏi danh sách Git theo dõi. Quy tắc `.gitignore` ngăn các file build sinh lại đi vào commit thông thường; không cần sửa lịch sử commit.

## Phạm vi chuyển đổi

Đã nhập mã ứng dụng và tài nguyên từ bản ECommerce, giữ cấu trúc Maven chuẩn và Java 8. Các DAO dùng chung một cấu hình database; Connector/J đã đổi sang 8.0.33 sau khi kiểm tra kết nối MySQL 8. Có script schema/dữ liệu mẫu, kiểm thử DAO và cấu hình Surefire 2.22.2 cho JUnit. Servlet/JSP API dùng scope `provided` vì Tomcat cung cấp khi chạy.

Kết nối database và lỗi `count()` gọi commit trong chế độ autocommit đã được sửa sau khi nhập mã nguồn. Đã kiểm tra DAO trên MySQL tạm, chưa kiểm tra toàn bộ luồng web trên Tomcat. Cấu hình email và một số redirect/filter có context `/Icommerceshoes` viết cố định vẫn cần rà soát khi triển khai bằng context khác.

Khi đối chiếu các đường dẫn JSP trong controller, bản nguồn đang tham chiếu ba file chưa có:

- `RegisterController`: `views/user/register.jsp` và `views/user/Register/index.jsp`.
- `AboutController`: `views/user/about.jsp`.

Các tham chiếu này được giữ theo bản nguồn; riêng trang `/register` cần bổ sung hoặc sửa JSP trước khi sử dụng. Kiểm tra `mvn clean package` biên dịch Java và đóng gói WAR, không kiểm tra các trang JSP và luồng nghiệp vụ khi chạy trên Tomcat.

Tham khảo: [Cấu trúc thư mục Maven chuẩn](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html).
