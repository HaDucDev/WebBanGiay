# WebBanGiay

Ứng dụng Java Web dùng Servlet/JSP, Maven và Tomcat. Maven artifact của dự án là `LastEcommerce`, kiểu đóng gói `war`.

## Môi trường

- JDK 8. Trên máy hiện tại: `D:\vtlq-web\jdk1.8.0_77`.
- Maven 3.8.6 đã được dùng để kiểm tra build với JDK trên.
- Tomcat 9 để triển khai ứng dụng.
- Cơ sở dữ liệu MySQL và cấu hình kết nối phù hợp với môi trường chạy.

Đường dẫn JDK/Tomcat được chọn trên từng máy; `pom.xml` chỉ khai báo phiên bản Java 8, không gắn với một đường dẫn cài đặt cụ thể.

## Cấu trúc Maven

```text
WebBanGiay/
├── pom.xml
├── src/
│   └── main/
│       ├── java/          # Controller, DAO, Service, Model và mã Java khác
│       └── webapp/        # JSP, CSS, JavaScript, ảnh, WEB-INF và META-INF
├── .settings/            # Cấu hình dự án cho Eclipse
├── .classpath
├── .project
└── target/               # Maven sinh khi build
```

Khi cần tài nguyên trên classpath, đặt tại `src/main/resources`. Khi có kiểm thử Java, đặt tại `src/test/java`. Maven nhận diện các đường dẫn chuẩn này mà không cần khai báo lại trong `pom.xml`.

Mã Java trước đây trong `src` đã chuyển sang `src/main/java`. Toàn bộ nội dung `WebContent` đã chuyển sang `src/main/webapp`; đường dẫn web khi triển khai vẫn được giữ nguyên. Tên package hiện có, bao gồm `Controller` và `Controlller`, được giữ nguyên.

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
- Quy tắc `.gitignore` chỉ áp dụng cho file chưa được Git theo dõi. Repository cũ có một số file trong `target` và `build` đã được theo dõi; khi commit việc dọn artifact, cần bỏ chúng khỏi danh sách theo dõi. Không cần sửa lại lịch sử commit.

## Phạm vi chuyển đổi

Đã chuẩn hóa thư mục, cấu hình Java 8 và encoding UTF-8, cập nhật đường dẫn Eclipse, đồng thời thay JSP API cũ để tránh kéo theo Servlet API 2.4 gây lỗi compile với `request.getPart(...)`. Servlet/JSP API dùng scope `provided` vì Tomcat cung cấp khi chạy.

Nội dung mã Java, JSP và tài nguyên web được giữ nguyên. Cấu hình cơ sở dữ liệu, email, đường dẫn upload tuyệt đối trong `ProductController` và một số redirect có context viết cố định vẫn là cấu hình/hành vi cũ cần rà soát khi triển khai thực tế trên máy khác. Build WAR thành công chưa xác nhận các chức năng đó hoạt động trong môi trường mới.

Tham khảo: [Cấu trúc thư mục Maven chuẩn](https://maven.apache.org/guides/introduction/introduction-to-the-standard-directory-layout.html).
