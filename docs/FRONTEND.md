# Cấu trúc giao diện

**Vị trí hiện tại sau khi rà file chưa dùng:** 334 file tài nguyên đã chuyển sang `XYZ/src/main/webapp`, gồm 186 ảnh/SVG và các thư viện/template chưa được nạp. 39 ảnh sản phẩm cùng các ảnh/banner/font được ứng dụng tham chiếu vẫn giữ nguyên đường dẫn hoạt động. `prettyPhoto` và các file mẫu chưa dùng hiện nằm trong `XYZ`. Các mục dọn trước đây bên dưới mô tả lịch sử; xem [XYZ/README.md](../XYZ/README.md) và [MOVED_FILES.csv](../XYZ/MOVED_FILES.csv) cho lần di chuyển này.


Ứng dụng dùng hai giao diện: quản trị và khách hàng. SiteMesh ghép layout trong `decorators` với nội dung JSP trong `views`; hai thư mục này có vai trò khác nhau.

## Catalog tiếng Anh và giá USD

File SQL chính là `database/Web_Ban_Giay.sql`. Dữ liệu hợp lệ từ SQL cũ được chuyển sang schema hiện tại: tên/mô tả sản phẩm và danh mục bằng tiếng Anh, giá USD giữ nguyên giá trị như 14.00, 9.80. Database cần được tạo mới; xem [database/README.md](../database/README.md).

- `WEB-INF/tags/price.tag` định dạng giá thống nhất theo `en_US`, USD và hai chữ số thập phân trên trang chủ, danh mục, chi tiết, giỏ hàng, checkout và các bảng quản trị.
- `CartItemModel.getTotalPrice()` dùng `BigDecimal`. Giỏ hàng cộng tổng thực tế; checkout lưu giá dòng hàng bằng `DECIMAL(12,2)` và hiển thị đơn vừa tạo, thay cho bảng sản phẩm mẫu gán sẵn. Ví dụ $9.80 × 3 = $29.40.
- Banner và catalog dùng lại hai ảnh giày đã được xem thực tế: `images/image1.jpg` và `images/reference/userTu/images/3.jpg`. Dữ liệu gán ảnh minh họa cho ID 1 và 3; bảy mẫu chưa có ảnh phù hợp để thumbnail trống và dùng SVG “Photo coming soon”. File `giaythethaonam.jpg` trong template cũ thực chất là ảnh đồng hồ. Xem [báo cáo đầy đủ](IMAGE_AUDIT.md) và [danh mục ảnh](IMAGE_CATALOG.html).
- Sidebar danh mục dùng chung tại `decorators/user/catalog-sidebar.jsp`. Các liên kết Men's/Women's/Kids' Shoes mở đúng bộ lọc; các tab trang chủ dùng danh sách Featured, New Arrivals và ba danh mục thay cho các tên thương hiệu mẫu.
- `assets/user/css/catalog.css` giới hạn kích thước ảnh sản phẩm/giỏ hàng. Nội dung và tiêu đề giao diện được thống nhất sang tiếng Anh; tài liệu vẫn viết bằng tiếng Việt.

Đổi file SQL không tự đổi database trong volume đã tồn tại. Theo lựa chọn hiện tại, người dùng sẽ tự xóa/tạo lại database rồi Start MySQL và refresh/restart project trong Eclipse. Không có script reset tự động mới.

Đã kiểm tra bản catalog/USD bằng Maven, 3 kiểm thử tính tiền và biên dịch 22 JSP không lỗi. Kiểm tra HTTP trên Tomcat riêng với dữ liệu thử xác nhận các trang hiển thị $9.80, tổng giỏ hàng/đơn 3 sản phẩm là $29.40 và ảnh giày tải được. Đây là kiểm tra render/HTTP, không phải xác nhận trực quan desktop/mobile hoặc import SQL vào MySQL đang dùng.

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
- Giữ nguyên toàn bộ 274 file ảnh/SVG hiện có trong webapp. Các ảnh đang được dùng giữ đường dẫn; một số ảnh trong `reference` hiện được dùng lại cho sản phẩm/banners.
- Dashboard dùng `views/admin/index.jsp`. Controller đã được cập nhật, bỏ các bản dư trong `views/admin/Dashboard`, `Product`, `User`, `Order`. Giữ các JSP quản trị phẳng mà controller thực tế sử dụng.
- Bỏ `views/user/upload.jsp`, một form mẫu không có controller hay đường dẫn ứng dụng sử dụng.
- Header/footer/navigation là JSP partial: đã bỏ bộ thẻ `html/head/body` lồng bên trong layout.
- Giữ một lần nạp jQuery và Bootstrap cho mỗi layout; bỏ Bootstrap CSS khách hàng bị nạp hai phiên bản, và các bản CDN trùng với thư viện quản trị cục bộ. Chart.js được nạp trước các đoạn script của trang.
- Tách hành vi và CSS xem trước ảnh bị lặp trong form sản phẩm/người dùng sang `assets/admin/js/admin-ui.js` và `assets/admin/css/admin-ui.css`. CSS chỉ áp dụng trong `.avatar-upload`, không ghi đè `body` hay `.container` của toàn giao diện.
- Sửa ID của bộ chọn ảnh thêm/sửa để không trùng; sửa thẻ script lồng sai, đường dẫn ảnh tĩnh và các khai báo JSP sang UTF-8. Bỏ liên kết icon trỏ đến file không tồn tại.

## Sửa giao diện mất CSS khi chạy trực tiếp từ Eclipse

Triệu chứng là trang chỉ còn danh sách chữ, nút mặc định và ảnh mất. Lỗi chính nằm ở `HomeController`: mapping `/` nhận cả các URL tài nguyên không có servlet riêng, nên yêu cầu `assets/user/css/bootstrap.min.css` trả lại HTML trang chủ với HTTP 200. Chỉ kiểm tra mã 200 không phát hiện được lỗi này.

Mapping trang chủ đã đổi thành chuỗi rỗng `""`, chỉ khớp đường dẫn gốc của ứng dụng. Tomcat tiếp tục phục vụ file tĩnh bằng DefaultServlet, còn URL không tồn tại trả 404. SiteMesh bỏ qua `/assets/*` và `/images/*`.

Các phần giao diện đã sửa kèm theo:

- Thẻ JSP dùng chung `WEB-INF/tags/product-image.tag` xử lý cả thumbnail dạng `assets/...`, `/assets/...`, `images/...`, tên file cũ và URL đầy đủ. Trang chủ, danh mục, chi tiết và giỏ hàng dùng thẻ này. Bỏ cách ghép `images/assets/...` và ảnh sản phẩm gán cứng từ website bên ngoài.
- Trang chi tiết đọc đúng `productDetail` mà controller cung cấp; hiển thị tên, giá, ảnh và ID sản phẩm. ID không hợp lệ trả 404. Shop không có bộ lọc hiển thị toàn bộ sản phẩm.
- Khung `main-content` quản trị được đặt tại layout chung; bỏ khung lặp trong dashboard/đơn hàng và các thẻ `div` đóng thừa. Bảng đơn hàng dùng toàn chiều rộng. Các ô chọn ảnh trong modal không còn dùng lớp `.container` có chiều rộng cố định của Bootstrap.
- Các form quản trị và redirect dùng context hiện tại thay cho `/Icommerceshoes` hoặc `/ECommerce`. Logout trỏ tới servlet hiện có. Không thay đổi phần lưu file upload.
- Blog, bài viết và Contact có route tới những JSP đang có. Trang 404 được Tomcat hiển thị qua cấu hình `error-page`. Category quản trị hiển thị danh sách danh mục; bỏ các form mẫu trước đó gửi nhầm sang quản lý người dùng. Thêm/sửa/xóa danh mục chưa được triển khai.
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


## Trang lỗi 404

Menu không hiển thị mục demo “404”. Tomcat dùng cấu hình `error-page` cho mã HTTP 404 để mở `WEB-INF/errors/404.jsp` khi đường dẫn/sản phẩm không tồn tại. Trang giữ mã 404, có CSS riêng và liên kết quay lại trang chủ theo context hiện tại. `/error` cũ cũng trả 404; JSP lỗi nằm trong `WEB-INF` để không được mở như một trang nội dung thông thường.

Đã kiểm tra trên Tomcat 9: 6 đường dẫn lỗi trả 404 với trang tùy chỉnh, 3 trang bình thường trả 200 và không còn mục “404” trên menu. Các ảnh/CSS của trang lỗi được tải đúng; lỗi 500 không bị hiển thị nhầm thành 404. Thay đổi `web.xml` cần khởi động lại Tomcat để áp dụng.

## Catalog nhiều nhóm hàng

Catalog hiện có 46 sản phẩm thuộc 11 danh mục, gồm giày và quần áo; 39 sản phẩm dùng ảnh sẵn có. Xem [bảng ảnh và dữ liệu](IMAGE_AUDIT.md) hoặc [gallery có thể lọc](IMAGE_CATALOG.html). Các ảnh gốc đều được giữ nguyên.

Sidebar và form sản phẩm quản trị lấy danh mục từ DB. Bộ lọc Shop dùng code danh mục qua truy vấn có tham số; phân trang 12 sản phẩm/trang và giữ bộ lọc khi đổi trang. Trang chủ có Featured Products/New Arrivals, dùng chung thẻ `product-card.tag` với Shop và gợi ý cùng danh mục trên trang chi tiết. Bỏ carousel ảnh mẫu, review mẫu và nút wishlist/compare chưa hoạt động khỏi các thẻ sản phẩm này. CSS giữ tỷ lệ ảnh, không phóng lớn các thumbnail nhỏ.

Form quản trị nhận đường dẫn ảnh có sẵn và lưu đúng thumbnail khi thêm/sửa; danh mục được chọn lại đúng trong modal sửa. Đây là nhập đường dẫn, chưa triển khai upload file. MySQL cần được người dùng tạo mới từ SQL hiện tại như [hướng dẫn](../database/README.md).
