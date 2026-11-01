# Cấu trúc giao diện

Ứng dụng dùng hai giao diện: quản trị và khách hàng. SiteMesh ghép layout trong `decorators` với nội dung JSP trong `views`; hai thư mục này có vai trò khác nhau.

```text
src/main/webapp/
├── assets/
│   ├── admin/            # Thư viện, CSS/JS, font và ảnh của giao diện quản trị
│   └── user/             # Thư viện, CSS/JS, font và ảnh của giao diện khách hàng
├── decorators/
│   ├── admin.jsp         # Layout quản trị
│   ├── admin/            # Header và navigation dùng chung
│   ├── user.jsp          # Layout khách hàng
│   └── user/             # Header và footer dùng chung
├── views/
│   ├── admin/            # Dashboard, sản phẩm, đơn hàng, người dùng, danh mục
│   ├── user/             # Các trang khách hàng
│   ├── login.jsp
│   └── error.jsp
├── images/
│   └── reference/        # Ảnh từ template chưa sử dụng, chia theo nguồn
└── WEB-INF/
    ├── web.xml
    └── decorators.xml    # Quy tắc chọn layout cho URL
```

## Phần đã dọn

- Các bộ `assets/adminTu`, `assets/authTu`, `assets/userTu` không được JSP/layout/controller hay tài nguyên đang dùng tham chiếu. Đã bỏ 392 file CSS, JS, font và file hỗ trợ của các bộ này; giữ 164 file ảnh/SVG trong `images/reference/<tên-bộ>/`, giữ cấu trúc con để tránh trùng tên.
- Giữ nguyên toàn bộ 274 file ảnh/SVG hiện có trong webapp. Các ảnh đang được dùng giữ đường dẫn; ảnh chuyển sang `reference` chưa được trang đang chạy tham chiếu.
- Dashboard dùng `views/admin/index.jsp`. Controller đã được cập nhật, bỏ các bản dư trong `views/admin/Dashboard`, `Product`, `User`, `Order`. Giữ các JSP quản trị phẳng mà controller thực tế sử dụng.
- Bỏ `views/user/upload.jsp`, một form mẫu không có controller hay đường dẫn ứng dụng sử dụng.
- Header/footer/navigation là JSP partial: đã bỏ bộ thẻ `html/head/body` lồng bên trong layout.
- Giữ một lần nạp jQuery và Bootstrap cho mỗi layout; bỏ Bootstrap CSS khách hàng bị nạp hai phiên bản, và các bản CDN trùng với thư viện quản trị cục bộ. Chart.js được nạp trước các đoạn script của trang.
- Tách hành vi và CSS xem trước ảnh bị lặp trong form sản phẩm/người dùng sang `assets/admin/js/admin-ui.js` và `assets/admin/css/admin-ui.css`. CSS chỉ áp dụng trong `.avatar-upload`, không ghi đè `body` hay `.container` của toàn giao diện.
- Sửa ID của bộ chọn ảnh thêm/sửa để không trùng; sửa thẻ script lồng sai, đường dẫn ảnh tĩnh và các khai báo JSP sang UTF-8. Bỏ liên kết icon trỏ đến file không tồn tại.

## Sửa giao diện mất CSS khi chạy trực tiếp từ Eclipse

Triệu chứng là trang chỉ còn danh sách chữ, nút mặc định và ảnh mất. Lỗi chính nằm ở `HomeController`: mapping `/` nhận cả các URL tài nguyên không có servlet riêng, nên yêu cầu `assets/user/css/bootstrap.min.css` trả lại HTML trang chủ với HTTP 200. Chỉ kiểm tra mã 200 không phát hiện được lỗi này.

Mapping trang chủ đã đổi thành chuỗi rỗng `""`, chỉ khớp đường dẫn gốc của ứng dụng. Tomcat tiếp tục phục vụ file tĩnh bằng DefaultServlet, còn URL không tồn tại trả 404. SiteMesh bỏ qua `/assets/*`, `/images/*` và `/image1.jpg`.

Các phần giao diện đã sửa kèm theo:

- Thẻ JSP dùng chung `WEB-INF/tags/product-image.tag` xử lý cả thumbnail dạng `assets/...`, `/assets/...`, `images/...`, tên file cũ và URL đầy đủ. Trang chủ, danh mục, chi tiết và giỏ hàng dùng thẻ này. Bỏ cách ghép `images/assets/...` và ảnh sản phẩm gán cứng từ website bên ngoài.
- Trang chi tiết đọc đúng `productDetail` mà controller cung cấp; hiển thị tên, giá, ảnh và ID sản phẩm. ID không hợp lệ trả 404. Shop không có bộ lọc hiển thị toàn bộ sản phẩm.
- Khung `main-content` quản trị được đặt tại layout chung; bỏ khung lặp trong dashboard/đơn hàng và các thẻ `div` đóng thừa. Bảng đơn hàng dùng toàn chiều rộng. Các ô chọn ảnh trong modal không còn dùng lớp `.container` có chiều rộng cố định của Bootstrap.
- Các form quản trị và redirect dùng context hiện tại thay cho `/Icommerceshoes` hoặc `/ECommerce`. Logout trỏ tới servlet hiện có. Không thay đổi phần lưu file upload.
- Blog, bài viết, Contact và trang lỗi có route tới những JSP đang có. Category quản trị hiển thị danh sách danh mục; bỏ các form mẫu trước đó gửi nhầm sang quản lý người dùng. Thêm/sửa/xóa danh mục chưa được triển khai.
- Hai layout ghép thêm phần `head` của trang. Bỏ nạp PrettyPhoto chưa được trang nào khởi tạo; file thư viện vẫn còn trong `assets/user`. Google Fonts dùng HTTPS. Sửa tiêu đề trang và các nhãn tiếng Việt bị lỗi mã hóa đã gặp.

### Đối chiếu và phục hồi giao diện cũ

Đã đối chiếu với `D:\vtlq-web\ECommerce\ECommerce` và lịch sử Git trước khi dọn. Bộ `assets/user` đang chạy vẫn có CSS/JS/ảnh chính như bản ECommerce; file Bootstrap bị bỏ là bản nạp trùng. Các bộ `adminTu`, `authTu`, `userTu` là template khác và không cần phục hồi toàn bộ để sửa lỗi mất CSS.

Đã phục hồi 4 file font từ commit `264fb4f`, thư mục cũ `src/main/webapp/assets/userTu/fonts`, vào `assets/user/fonts`: `fontawesome-webfont.eot`, `fontawesome-webfont.ttf`, `glyphicons-halflings-regular.eot`, `glyphicons-halflings-regular.ttf`. Đây là các định dạng font mà CSS còn tham chiếu nhưng trước đó không có file tương ứng. Ảnh trong `images/reference` tiếp tục được giữ.

Các file đã bỏ vẫn có trong Git. Để xem hoặc lấy lại template cũ mà không ghi đè mã đang sửa, xuất ra một ZIP riêng:

```powershell
git archive --format=zip --output=target/frontend-before-cleanup.zip 264fb4f src/main/webapp
```

### Áp dụng trong Eclipse và kiểm tra lại

1. Chọn project, nhấn **F5** để refresh mã nguồn và các font được phục hồi.
2. Chạy **Project → Clean**; bảo đảm **Build Automatically** đang bật.
3. Stop rồi Start Tomcat bằng nút plugin. Mapping servlet thay đổi nên cần khởi động lại ứng dụng.
4. Mở `http://localhost:8080/LastEcommerce/`, nhấn **Ctrl+F5** để bỏ cache HTML/CSS cũ.
5. Nếu muốn tự kiểm tra, mở PowerShell tại thư mục project và chạy script chỉ đọc sau:

   ```powershell
   .\scripts\check-frontend.ps1 -BaseUrl 'http://localhost:8080/LastEcommerce'
   ```

Script kiểm tra một bộ `html/head/body` cho mỗi trang, tải CSS/JS/ảnh/font thực tế, đối chiếu nội dung với file trên đĩa và kiểm tra tài nguyên không tồn tại trả 404. CSS trả HTML với mã 200 sẽ bị báo lỗi. Có thể đổi `BaseUrl` khi dùng context hoặc cổng khác.

Đã kiểm tra bản sửa bằng JDK 8 và Tomcat 9.0.69, dùng DevLoader đọc trực tiếp `src/main/webapp` và `target/classes` trên cổng kiểm tra riêng: Maven package thành công; Jasper biên dịch đủ 21 JSP với 0 lỗi; 15 đường dẫn trang cùng 215 tài nguyên cục bộ qua kiểm tra. Trang chi tiết có dữ liệu sản phẩm; CSS không còn tham chiếu file cục bộ bị thiếu. Các đoạn JavaScript nội tuyến đã được kiểm tra cú pháp, các khung `div` của trang được kiểm tra cân bằng. Phiên kiểm tra này chưa có trình duyệt kết nối để xác nhận trực quan bố cục desktop/mobile.

## Thêm hoặc sửa trang

1. Thêm nội dung vào `views/admin` hoặc `views/user`, rồi cấu hình controller chuyển tới JSP đó.
2. Dùng layout trong `decorators`; header/footer dùng chung không cần thêm `html/head/body`.
3. Dùng `<c:url>` cho đường dẫn CSS, JS và ảnh để chạy được khi đổi context của ứng dụng.
4. Đặt CSS/JS dùng chung ở `assets/admin` hoặc `assets/user`. Không cần chép thêm cả bộ template nếu chỉ cần vài ảnh.
5. Ảnh trong `images/reference` có thể dùng lại bằng đường dẫn tương ứng; không có CSS/JS của bộ template gốc đi kèm.

## Phạm vi kiểm tra

Dùng JDK `D:\vtlq-web\jdk1.8.0_77` và Tomcat `D:\vtlq-web\apache-tomcat-9.0.69` để kiểm tra:

- Maven đóng gói WAR thành công.
- Jasper biên dịch đủ 21 JSP với 0 lỗi.
- Trang login và dashboard trả HTTP 200, mỗi trang có đúng một bộ `html/head/body` và nạp đúng layout.
- CSS và jQuery cục bộ của cả hai layout trả HTTP 200. Các tham chiếu tài nguyên tĩnh trong JSP đều có file tương ứng.
- Bốn đoạn JavaScript trong JSP còn giữ lại và `admin-ui.js` đều không có lỗi cú pháp; không còn ID tĩnh trùng trong từng JSP.
- Checksum của toàn bộ 274 ảnh/SVG khớp trước khi dọn, bao gồm 164 ảnh chuyển sang `images/reference`.

Dọn file và sửa layout không hoàn thiện các nghiệp vụ còn thiếu. Blog/contact đã mở được template qua menu nhưng nội dung bài viết và gửi liên hệ còn là dữ liệu/form mẫu. Account, Wishlist và đăng ký chưa có luồng hoàn chỉnh; trang about còn thiếu JSP như đã ghi trong README. Form chọn ảnh hiện là xem trước ở trình duyệt; phần lưu file lên server chưa được triển khai thêm. Việc kiểm tra giao diện không thực hiện các thao tác thêm/sửa/xóa dữ liệu hoặc đặt hàng.
