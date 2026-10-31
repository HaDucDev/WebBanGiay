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

Dọn file và layout không bổ sung nghiệp vụ còn thiếu. Các trang blog/contact được giữ vì menu có liên kết; việc hoàn thiện controller và dữ liệu cho các trang đó là công việc riêng. Các trang đăng ký/about còn thiếu JSP như đã ghi trong README. Form chọn ảnh hiện là xem trước ở trình duyệt; việc lưu file lên server chưa được triển khai thêm trong đợt dọn này.
