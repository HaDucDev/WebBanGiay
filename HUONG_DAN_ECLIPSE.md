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
- Workspace hiện sử dụng mã nguồn từ bản ECommerce. `src/main/resources` chứa `db.properties` và `message.properties`, cần có trong **Java Build Path → Source** để được đưa vào classpath và WAR. Tên project Eclipse vẫn là **LastEcommerce**.
- Nếu dự án đã được import trước khi chuyển cấu trúc: nhấn **F5** để refresh, sau đó chọn **Maven → Update Project** từ menu chuột phải của project. Kiểm tra **Java Build Path → Source** sử dụng `src/main/java`.
- Để chạy web bằng nút Tomcat trên thanh công cụ Eclipse, dùng **Eclipse Tomcat Plugin** theo mục 8 và 9. Cách này không yêu cầu thêm server trong khung **Servers**. Cần cấu hình đường dẫn Tomcat và JDK riêng trên từng máy.
- Trên máy hiện tại, **Tomcat home** là `D:\vtlq-web\apache-tomcat-9.0.69` và JRE/JDK là `D:\vtlq-web\jdk1.8.0_77`.
- Nếu dự án xuất hiện dấu đỏ sau khi import, cần xem thông báo lỗi để kiểm tra cấu hình Java, Tomcat hoặc thư viện Maven.
- Eclipse mở lên trống khi chưa import dự án không phải là bằng chứng code bị hỏng.

Xem thêm [README.md](README.md) để build bằng Maven, mở bằng IntelliJ IDEA và chuyển dự án sang máy khác.

## 5. Lỗi Eclipse không đọc được schema của pom.xml

Nếu báo `schema_reference.4: Failed to read schema document` hoặc `Cannot find the declaration of element 'project'`, Eclipse đang không đọc được XML Schema dùng để kiểm tra POM.

Project có bản XSD chính thức của Apache Maven tại `.mvn/schemas/maven-4.0.0.xsd`. `xsi:schemaLocation` trong `pom.xml` dùng đường dẫn tương đối đến file đó, nên việc kiểm tra XML không cần tải schema qua HTTPS. Khi chuyển project sang máy khác, mang theo cả thư mục `.mvn`.

Sau khi cập nhật file từ bên ngoài Eclipse:

1. Chọn project **LastEcommerce**, nhấn **F5** để refresh.
2. Chuột phải `pom.xml` → **Validate** để chạy lại XML Validator.
3. Nếu marker cũ vẫn còn, chọn **Project → Clean**, chọn project và bấm **Clean**, rồi mở lại `pom.xml`.

Namespace `http://maven.apache.org/POM/4.0.0` được giữ nguyên. Schema cục bộ phục vụ kiểm tra XML; Maven vẫn quản lý và tải thư viện theo các dependency trong POM như bình thường.

Nguồn schema: [Apache Maven POM 4.0.0 XSD](https://maven.apache.org/xsd/maven-4.0.0.xsd). Tham khảo [Eclipse: liên kết XML với schema cục bộ](https://help.eclipse.org/latest/topic/org.eclipse.wst.xmleditor.doc.user/topics/cxmlcat.html).

## 6. Lỗi String cannot be resolved to a type trong JSP/Java

`String` là lớp của Java chuẩn. Lỗi này xuất hiện khi project thiếu hoặc không phân giải được **JRE System Library**. Trong trường hợp đã kiểm tra, thư mục gốc JDK từng được thêm như một class folder thường trong `.classpath`; cách khai báo đó không cung cấp thư viện hệ thống Java cho Eclipse.

Project dùng **JRE System Library [JavaSE-1.8]**. JDK được đăng ký riêng trong từng Eclipse workspace, nên cần cấu hình một lần trên mỗi máy:

1. Vào **Window → Preferences → Java → Installed JREs**.
2. Chọn **Add → Standard VM → Next**. Tại **JRE home**, chọn `D:\vtlq-web\jdk1.8.0_77`, rồi **Finish**. Đây là thư mục JDK có `bin/javac.exe` và `jre/lib/rt.jar`.
3. Vào **Java → Installed JREs → Execution Environments**. Chọn **JavaSE-1.8** bên trái, tích JDK `jdk1.8.0_77` ở danh sách **Compatible JREs** bên phải, rồi **Apply and Close**.
4. Chọn project, nhấn **F5**. Vào **Properties → Java Build Path → Libraries**, kiểm tra có **JRE System Library [JavaSE-1.8]**. Nếu chưa có, dùng **Add Library → JRE System Library → Execution environment → JavaSE-1.8**.
5. Chuột phải project → **Maven → Update Project**, sau đó **Project → Clean** và mở lại JSP.

Trong **Installed JREs**, Eclipse sẽ tự nhận các thư viện của JDK. Không thêm thư mục gốc JDK bằng **Add External Class Folder** hay **Add External JARs**. Đường dẫn cài đặt từng máy nằm trong cấu hình workspace; `.classpath` dùng tên môi trường JavaSE-1.8 để giữ khả năng chuyển project giữa các máy.

## 7. Lỗi Project configuration is not up-to-date with pom.xml

Thông báo này cho biết cấu hình project của Eclipse chưa đồng bộ với `pom.xml`. Nó thường xuất hiện sau khi sửa POM, thay đổi cấu trúc source hoặc điều chỉnh build path. Cần chạy **Maven → Update Project** để m2e cập nhật cấu hình Eclipse từ Maven.

### Cách xử lý

1. Chọn project **LastEcommerce** trong **Project Explorer**.
2. Nhấn **Alt + F5**, hoặc chuột phải project → **Maven → Update Project…**.
3. Tích chọn **LastEcommerce** và **Update project configuration from pom.xml**.
4. Để **Force Update of Snapshots/Releases** ở trạng thái bỏ chọn khi chỉ cần đồng bộ cấu hình.
5. Bấm **OK**, chờ các tác vụ nền của Eclipse hoàn tất.
6. Nếu marker cũ vẫn còn, chọn **Project → Clean**, chọn project và chạy lại build.

Các mục màu vàng trong **Markers/Problems** là warnings. Cần đọc riêng nội dung từng error màu đỏ; thông báo đồng bộ Maven này khác với lỗi schema XML hoặc thiếu JRE System Library.

### Update Project có tải thư viện không?

**Có thể có.** Update Project đọc lại POM, phân giải dependency và cập nhật cấu hình Eclipse như Maven Dependencies, classpath, thư mục source/resources và cấu hình Java.

- Nếu thư viện cần thiết chưa có trong Maven local repository, Maven sẽ tải từ repository được cấu hình, ví dụ Maven Central.
- Nếu đúng phiên bản đã có trong cache, Maven thường sử dụng lại file đó. Update Project không có nghĩa là tải lại toàn bộ thư viện mỗi lần bấm.
- Với phiên bản SNAPSHOT, metadata hoặc những lần tải trước bị lỗi, Maven có thể kiểm tra repository theo chính sách cập nhật.
- **Force Update of Snapshots/Releases** yêu cầu kiểm tra cập nhật lại thay vì chờ chu kỳ thông thường; hữu ích khi SNAPSHOT hoặc thông tin tải thất bại đang bị cache. Tùy chọn này không xóa và tải lại mọi JAR, cũng không tự nâng các phiên bản đã khai báo trong POM.

Trên máy hiện tại, thư viện Maven thường được lưu tại:

```text
C:\Users\Duc\.m2\repository
```

Vị trí này có thể khác nếu đã cấu hình `localRepository` trong Maven `settings.xml`.

| Thao tác | Mục đích |
|---|---|
| F5 / Refresh | Eclipse đọc lại các file đã thay đổi trên ổ đĩa |
| Maven → Update Project | Đồng bộ cấu hình Eclipse từ POM, phân giải và tải dependency còn thiếu khi cần |
| Project → Clean | Làm sạch kết quả build của Eclipse để build lại; giữ cache thư viện Maven |

Khi chuyển project sang máy mới, Maven sẽ tải các thư viện cần thiết nếu cache của máy đó chưa có. Mang theo mã nguồn và POM; cache `.m2/repository` không cần đưa vào Git.

Tham khảo: [Tài liệu m2e của Eclipse](https://eclipse.dev/m2e/documentation/m2e-faq.html), [Update Project kết hợp cập nhật dependency và cấu hình project](https://www.eclipse.org/lists/m2e-dev/msg00883.html).

## 8. Thêm nút Tomcat Start/Stop/Restart trên thanh công cụ

Để điều khiển bản Tomcat bên ngoài bằng nút ngay trên toolbar, cài **Eclipse Tomcat Plugin**. Đây là dự án tiếp nối Sysdeo Tomcat Plugin, cung cấp các nút khởi động, dừng và khởi động lại Tomcat. Cách này dùng cấu hình của plugin và bản Tomcat đã giải nén.

### Cài plugin

1. Vào **Help → Eclipse Marketplace…**.
2. Tìm **Eclipse Tomcat Plugin**, chọn **Install** và làm theo trình cài đặt.
3. Khởi động lại Eclipse khi được yêu cầu.

Nếu không dùng Marketplace, vào **Help → Install New Software…**, nhập update site do dự án công bố:

```text
https://devtools.his.de/tomcatplugin/updatesite
```

Chọn plugin Tomcat để cài, rồi khởi động lại Eclipse.

### Cấu hình Tomcat đã có trên máy

1. Vào **Window → Preferences → Tomcat**.
2. Chọn **Tomcat version: Version 9.x (+)**.
3. Đặt **Tomcat home** là `D:\vtlq-web\apache-tomcat-9.0.69`. Nếu sử dụng **Tomcat base** riêng, chọn đúng thư mục chứa cấu hình của instance đó; với bản chạy trực tiếp hiện tại có thể dùng cùng thư mục Tomcat home.
4. Vào **Tomcat → JVM Settings**, chọn **JRE** là JDK `jdk1.8.0_77` đã đăng ký trong Eclipse, tương ứng `D:\vtlq-web\jdk1.8.0_77`.
5. Chọn **Apply and Close**.

Thanh công cụ sẽ có các nút **Start Tomcat**, **Stop Tomcat**, **Restart Tomcat**. Bấm Start để khởi động và xem log ở **Console**. Nếu đã cài mà chưa thấy nút, vào **Window → Perspective → Customize Perspective…**, bật nhóm lệnh/toolbar **Tomcat**.

Nút Start khởi động Tomcat, nhưng chưa tự khai báo project Maven thành ứng dụng web. Để Tomcat đọc trực tiếp project trong Eclipse, cần cấu hình thêm ở **Properties → Tomcat** của project theo mục 9.

Nguồn: [Eclipse Tomcat Plugin — hướng dẫn chính thức](https://github.com/tomcatplugin/tomcatplugin), [các trường cấu hình của plugin](https://github.com/tomcatplugin/tomcatplugin/blob/master/net.sf.eclipse.tomcat/src/resources.properties).

## 9. Chạy trực tiếp project Maven bằng Tomcat Plugin trong Eclipse

Mục tiêu là bấm **Start/Stop/Restart Tomcat** trên thanh công cụ Eclipse để chạy project đang phát triển, không phải chạy `mvn package` rồi chép WAR sau mỗi lần sửa code. Plugin đã xác định trên máy hiện tại là **Eclipse Tomcat Plugin 9.1.8**.

### Phân biệt Preferences với Properties của project

Trong **Window → Preferences → Tomcat → Advanced**, ô **Add Java projects to Tomcat classpath → LastEcommerce** chỉ thêm project vào classpath của tiến trình Tomcat. Tích ô đó chưa khai báo thư mục web hay đường dẫn truy cập của ứng dụng, nên chưa đủ để chạy website.

Với **Eclipse Tomcat Plugin 9.1.8**, khi tích project trong **Add Java projects to Tomcat classpath**, hãy đặt rõ **Tomcat base** ở màn hình Advanced là `D:\vtlq-web\apache-tomcat-9.0.69`, cùng đường dẫn **Tomcat home** trong cấu hình hiện tại. Plugin lấy thư viện bổ sung từ `Tomcat base/lib`; để trống có thể khiến project không nạp được Servlet API. Khi chuyển máy, đổi đường dẫn theo nơi cài Tomcat trên máy đó.

### Khai báo project và thư mục web

1. Đóng Preferences bằng **Apply and Close**.
2. Bấm **Stop Tomcat** trên thanh công cụ.
3. Trong **Project Explorer**, chuột phải **LastEcommerce → Properties → Tomcat**. Đây là cửa sổ thuộc tính của project, khác với **Window → Preferences → Tomcat**.
4. Ở tab **General**, đặt các mục sau:

   | Mục | Giá trị |
   |---|---|
   | **Is a Tomcat Project** | Tích chọn |
   | **Context name** | `/LastEcommerce` |
   | **Can update context definition (server.xml or context file)** | Chỉ tích để tạo context lần đầu; sau đó bỏ tích theo phần DevLoader bên dưới |
   | **Mark this context as reloadable (reloadable="true")** | Tích chọn |
   | **Subdirectory to set as web application root (optional)** | `src/main/webapp` |
   | **Subdirectory to set as web application work (optional)** | `target/tomcat-work` |
   | **Redirect context logger to Eclipse console** | Bỏ chọn |
   | **Extra information** | Để trống nếu chưa có cấu hình bổ sung |

Thư mục web là đường dẫn tương đối bên trong project. Với cấu trúc Maven hiện tại, dùng `src/main/webapp`. Thư mục `target/tomcat-work` chứa dữ liệu làm việc do Tomcat tạo và nằm trong `target` đã được Git bỏ qua.

### Phần cần cấu hình tiếp: DevLoader Classpath

Sau khi điền tab **General**, mở tab **DevLoader Classpath**. Phần này dùng để cấu hình việc nạp mã đã biên dịch trong `target/classes` và các thư viện Maven cho ứng dụng web.

1. Bấm **Stop Tomcat**.
2. Không dùng `DevloaderTomcat7.jar` hoặc `DevLoaderTomcat8.jar` với Tomcat 9.0.69. `DevloaderTomcat7.jar` báo `Unable to install WebappClassLoader`; bản `DevLoaderTomcat8.jar` cũ có thể báo `Unable to install WebappClassLoader, received ClassLoader was null` vì kiểm tra sai kiểu classloader của Tomcat 9.
3. Tải [DevLoaderTomcat85.jar từ thư mục chính thức của Eclipse Tomcat Plugin](https://sourceforge.net/projects/tomcatplugin/files/additional/DevLoaderTomcat85.jar/download), rồi lưu vào `D:\vtlq-web\apache-tomcat-9.0.69\lib`.
4. Trong thư mục `lib`, chỉ để `DevLoaderTomcat85.jar` hoạt động. Đổi tên các bản cũ thành `DevloaderTomcat7.jar.disabled` và `DevLoaderTomcat8.jar.disabled`, hoặc chuyển chúng ra ngoài `lib`.
5. Chuột phải project **LastEcommerce → Properties → Tomcat → General**, bỏ tích **Can update context definition (server.xml or context file)** rồi bấm **Apply and Close**. Plugin 9.1.8 có lỗi thêm một thẻ `<Loader>` mới mỗi lần cập nhật context; bỏ lựa chọn này sau khi context đã được tạo sẽ ngăn lỗi lặp lại.
6. Khi Tomcat đang dừng, mở file `D:\vtlq-web\apache-tomcat-9.0.69\conf\Catalina\localhost\LastEcommerce.xml` bằng trình soạn thảo văn bản và sửa để chỉ còn đúng một thẻ `<Loader>`:

   ```xml
   <Context reloadable="true"
            docBase="D:\vtlq-web\WebBanGiay\src\main\webapp"
            workDir="D:\vtlq-web\WebBanGiay\target\tomcat-work">
       <Loader className="org.apache.catalina.loader.DevLoader" reloadable="true" />
   </Context>
   ```

   Không cần thuộc tính `path`, `debug` hoặc `useSystemClassLoaderAsParent`. Tên file `LastEcommerce.xml` đã quyết định context path `/LastEcommerce`.
7. Chuột phải project **LastEcommerce → Properties → Tomcat → DevLoader Classpath**.
8. Tích **Activate DevLoader**.
9. Tích **Use SMART! Maven classpath**. Chế độ này đáng lẽ tự thêm dependency Maven, nhưng bản plugin hiện dùng có thể không sinh đủ JAR khi chạy Maven project.
10. Trong danh sách classpath, tích dòng kết thúc bằng `target/classes` và các JAR runtime sau (thường hiển thị bằng tên file hoặc đường dẫn trong `.m2/repository`): `jstl-1.2.jar`, `sitemesh-2.4.2.jar`, các JAR `jackson-*`, `commons-beanutils-1.9.3.jar`, `commons-logging-1.2.jar`, `commons-collections-3.2.2.jar`, `javax.mail-1.6.2.jar`, `activation-1.1.jar`, `mysql-connector-j-8.0.33.jar` và `protobuf-java-3.21.9.jar`. Không tích `target/test-classes`, JUnit, Hamcrest, JRE System Library hoặc các JAR Servlet/JSP API.
11. Bấm **Apply and Close**. Nếu thao tác này làm file context xuất hiện thêm `<Loader>`, quay lại tab **General**, kiểm tra mục **Can update context definition** đã được bỏ tích, rồi xóa các thẻ `<Loader>` thừa một lần cuối.
12. Vào **Project → Build Automatically** và bảo đảm mục này đang được tích. Nếu cần, chạy **Project → Clean** một lần để Eclipse tạo lại `target/classes`.
13. Bấm **Start Tomcat** trên thanh công cụ.

Khi khởi động, plugin tạo `src/main/webapp/.#webclasspath`; DevLoader đọc file này để nạp `target/classes` và các JAR trong Maven Dependencies. Console phải có các dòng `Starting DevLoader`, `projectdir=...` và nhiều dòng `added to classpath:`. Không được còn dòng `Unable to install WebappClassLoader`.

Nếu console đã có `projectdir` nhưng chỉ thêm `target/classes` rồi vẫn báo thiếu `PageFilter`, dừng Tomcat và quay lại tab **DevLoader Classpath** để tích các JAR runtime nêu ở bước 10. Sau khi bấm **Apply and Close**, Start Tomcat lại. Có thể mở `src/main/webapp/.#webclasspath` để kiểm tra: ngoài `target/classes`, file phải có `sitemesh-2.4.2.jar`, `jstl-1.2.jar` và MySQL Connector. Nếu file vẫn không đổi, chạy **Maven → Update Project...** trước, rồi lặp lại bước tích JAR.

Sau khi hoàn tất cấu hình, đường dẫn dự kiến theo **Context name** ở trên là `http://localhost:8080/LastEcommerce/`. Truy cập riêng `http://localhost:8080/` có thể vẫn hiển thị trang mặc định của Tomcat.

Tham khảo: [cấu hình General của project](https://github.com/tomcatplugin/tomcatplugin/blob/master/net.sf.eclipse.tomcat/src/net/sf/eclipse/tomcat/TomcatProjectGeneralPropertyPage.java), [cấu hình DevLoader Classpath](https://github.com/tomcatplugin/tomcatplugin/blob/master/net.sf.eclipse.tomcat/src/net/sf/eclipse/tomcat/TomcatProjectWebclasspathPropertyPage.java), [DevLoaderTomcat85 hoạt động với Tomcat 9](https://github.com/tomcatplugin/tomcatplugin/issues/41), [lỗi plugin thêm lặp DevLoader vào context](https://sourceforge.net/p/tomcatplugin/tickets/37/).

### Lỗi 404 kèm NoClassDefFoundError: javax/servlet/Filter

Log đã gặp trên máy hiện tại:

```text
SEVERE: Exception starting filter [servletFilter]
java.lang.NoClassDefFoundError: javax/servlet/Filter
SEVERE: Context [/LastEcommerce] startup failed due to previous errors
```

Tomcat đã nhận cấu hình ứng dụng, nhưng ứng dụng khởi động thất bại nên trả về 404. Đã kiểm tra `lib/servlet-api.jar` của Tomcat có `javax/servlet/Filter.class`. Trong trường hợp này, project đang được thêm vào classpath chung, còn **Tomcat base** để trống khiến plugin không thêm đúng các JAR trong thư mục `lib` của Tomcat.

Thực hiện trong Eclipse:

1. Bấm **Stop Tomcat** và chờ tiến trình dừng.
2. Vào **Window → Preferences → Tomcat → Advanced**.
3. Đặt **Tomcat base** thành `D:\vtlq-web\apache-tomcat-9.0.69`.
4. Danh sách **Add Java projects to Tomcat classpath** trống là bình thường sau khi project đã được đánh dấu **Is a Tomcat Project**. Plugin ẩn các Tomcat Project khỏi danh sách classpath chung; không cần cố thêm `LastEcommerce` trở lại đây.
5. Bấm **Apply and Close**.
6. Tiếp tục cấu hình **DevLoader Classpath** như phần trên, sau đó mới Start Tomcat.

Log sau khi đặt Tomcat base đã hết lỗi `javax/servlet/Filter`, nhưng chuyển sang `ClassNotFoundException: filter.AuthorizationFilter` và `ClassNotFoundException: com.opensymphony.module.sitemesh.filter.PageFilter`. Điều này xác nhận Tomcat đã có Servlet API nhưng chưa nạp `target/classes` và Maven Dependencies; DevLoader Classpath là bước xử lý tiếp theo.

Nguồn: [plugin thêm thư viện từ Tomcat base/lib vào classpath](https://github.com/tomcatplugin/tomcatplugin/blob/master/net.sf.eclipse.tomcat/src/net/sf/eclipse/tomcat/TomcatBootstrap.java), [cơ chế nạp lớp của Tomcat 9](https://tomcat.apache.org/tomcat-9.0-doc/class-loader-howto.html).

