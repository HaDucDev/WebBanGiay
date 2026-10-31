# Maven POM schema

`maven-4.0.0.xsd` là bản sao nguyên nội dung từ https://maven.apache.org/xsd/maven-4.0.0.xsd, lấy ngày 2026-10-31. Thông tin bản quyền và giấy phép Apache được giữ trong file XSD.

`pom.xml` tham chiếu schema bằng đường dẫn tương đối để XML Validator của IDE làm việc được khi không tải được schema từ Internet. Khi di chuyển dự án, giữ thư mục `.mvn` cùng với `pom.xml`.
