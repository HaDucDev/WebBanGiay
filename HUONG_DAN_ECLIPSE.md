# Hướng dẫn mở dự án bằng Eclipse

## 1. Phân biệt workspace và project

- **Workspace** là nơi Eclipse lưu cấu hình làm việc và danh sách các dự án đã import.
- **Project** là dự án chứa mã nguồn, thư viện và cấu hình build.

Cửa sổ **Eclipse IDE Launcher → Select a directory as workspace** chỉ dùng để chọn workspace. Chọn thư mục code ở đây không tự động import dự án vào Eclipse.

Dự án này nằm tại `D:\vtlq-web\WebBanGiay`, có các file cấu hình `pom.xml`, `.project` và `.classpath`. Đây là dự án Java Web dùng Maven. Tên project được khai báo là **LastEcommerce**, dù thư mục chứa code có tên **WebBanGiay**.

## 2. Chọn workspace riêng

1. Mở Eclipse.
2. Tại ô **Workspace**, nhập một thư mục riêng, ví dụ:

   ```text
   D:\vtlq-web\eclipse-workspace
   ```

3. Bấm **Launch**.

Nên đặt workspace riêng với thư mục code để dễ quản lý cấu hình Eclipse và dự án.

## 3. Import dự án Maven

1. Trong Eclipse, chọn **File → Import**.
2. Chọn **Maven → Existing Maven Projects**, rồi bấm **Next**.
3. Tại **Root Directory**, chọn:

   ```text
   D:\vtlq-web\WebBanGiay
   ```

4. Tích chọn dự án có file `pom.xml` trong danh sách **Projects**.
5. Bấm **Finish**.
6. Chờ Eclipse và Maven xử lý dự án, tải các thư viện cần thiết. Máy cần có kết nối Internet nếu thư viện chưa có sẵn.

Sau khi import, dự án sẽ xuất hiện với tên **LastEcommerce** trong **Project Explorer**.

Tham khảo: [Hướng dẫn import dự án Maven vào Eclipse](https://www.lagomframework.com/documentation/current/java/EclipseMavenInt.html).

## 4. Lưu ý sau khi import

- Cấu hình hiện tại của dự án nhắm đến **Java 8** và **Apache Tomcat 9**.
- Trên máy hiện tại, JDK sử dụng là `D:\vtlq-web\jdk1.8.0_77`. Vào **Window → Preferences → Java → Installed JREs → Add → Standard VM**, chọn thư mục JDK này. Trong **Java → Installed JREs → Execution Environments**, gán JDK đó cho **JavaSE-1.8**.
- Dự án đã chuyển sang cấu trúc Maven chuẩn: mã Java nằm trong `src/main/java`, giao diện và cấu hình web nằm trong `src/main/webapp`.
- Nếu dự án đã được import trước khi chuyển cấu trúc: nhấn **F5** để refresh, sau đó chọn **Maven → Update Project** từ menu chuột phải của project. Kiểm tra **Java Build Path → Source** sử dụng `src/main/java`.
- Để chạy web, cấu hình Tomcat 9 trên từng máy qua **Window → Preferences → Server → Runtime Environments**, sau đó thêm project vào server trong khung **Servers**. Cấu hình dùng chung không gắn sẵn một bản Tomcat cài trên máy cụ thể.
- Nếu dự án xuất hiện dấu đỏ sau khi import, cần xem thông báo lỗi để kiểm tra cấu hình Java, Tomcat hoặc thư viện Maven.
- Eclipse mở lên trống khi chưa import dự án không phải là bằng chứng code bị hỏng.

Xem thêm [README.md](README.md) để build bằng Maven, mở bằng IntelliJ IDEA và chuyển dự án sang máy khác.

