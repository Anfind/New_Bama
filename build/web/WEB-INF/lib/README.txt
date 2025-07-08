HƯỚNG DẪN TẢI MYSQL CONNECTOR JAR

Bạn chỉ cần tải 1 file JAR và đặt vào thư mục này (web/WEB-INF/lib):

**MySQL Connector/J - BẮT BUỘC:**

CÁCH 1: Tải từ trang chính thức MySQL (Khuyến nghị)
- Link: https://dev.mysql.com/downloads/connector/j/
- Chọn "Platform Independent (Architecture Independent), ZIP Archive"
- Tải về và giải nén
- Lấy file mysql-connector-java-8.x.x.jar
- Copy vào thư mục này

CÁCH 2: Tìm kiếm trên Google
- Tìm: "mysql connector java 8 download"
- Vào trang đầu tiên (dev.mysql.com)
- Tải như CÁCH 1

CÁCH 3: Sử dụng Maven Central Search
- Link: https://search.maven.org/
- Tìm: mysql-connector-java
- Chọn phiên bản 8.x.x
- Click "jar" để tải

CÁCH 4: Direct link (có thể không hoạt động)
- https://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar

SAU KHI TẢI XONG:
- Đảm bảo file có tên: mysql-connector-java-8.x.x.jar
- Copy vào thư mục này (web/WEB-INF/lib)
- Xóa file README.txt này
- Clean và Build lại project trong NetBeans

LƯU Ý: Project chỉ cần MySQL Connector để chạy được, không cần JSTL!
