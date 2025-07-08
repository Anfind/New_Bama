# HƯỚNG DẪN SETUP NHANH - BALOSHOP

## Bước 1: Chuẩn bị Database
1. Mở MySQL Workbench hoặc command line
2. Chạy lệnh:
```sql
mysql -u root -p210506 < database.sql
```

## Bước 2: Tải JAR Files cần thiết
Tải 3 file JAR sau và copy vào thư mục `web/WEB-INF/lib/`:

1. **MySQL Connector/J:**
   - Tải từ trang chính thức: https://dev.mysql.com/downloads/connector/j/
   - Chọn "Platform Independent" → ZIP file
   - Giải nén và lấy file mysql-connector-java-8.x.x.jar
   - Hoặc tìm trên Google: "mysql connector java 8 download"

2. **JSTL (có thể bỏ qua nếu không dùng):**
   - Tải từ: https://search.maven.org/artifact/javax.servlet/jstl/1.2/jar
   - Click "jar" để tải file jstl-1.2.jar
   - Hoặc tìm: "jstl 1.2 jar download"

3. **Standard (có thể bỏ qua nếu không dùng):**
   - Tải từ: https://search.maven.org/artifact/taglibs/standard/1.1.2/jar
   - Click "jar" để tải file standard-1.1.2.jar

**QUAN TRỌNG:** Chỉ cần MySQL Connector là đủ để project chạy được!

## Bước 3: Cấu hình Apache Tomcat trong NetBeans

### 3.1 Cài đặt Tomcat
1. Download Apache Tomcat 9.0 từ: https://tomcat.apache.org/download-90.cgi
2. Chọn **Core** → **zip** (Windows)
3. Giải nén vào thư mục (ví dụ: `C:\apache-tomcat-9.0.71`)

### 3.2 Cấu hình Tomcat trong NetBeans
1. Mở NetBeans → **Tools** → **Servers**
2. Nhấn **Add Server...**
3. Chọn **Apache Tomcat or TomEE** → **Next**
4. **Server Location**: Chọn thư mục gốc Tomcat (chứa bin, conf, lib...)
5. Nhập Username/Password (có thể để trống)
6. Nhấn **Finish**

### 3.3 Giải quyết lỗi "Không thấy Tomcat để chọn"
Nếu không thấy Tomcat trong danh sách server:

1. **Kiểm tra file cấu hình**: Sửa `nbproject/private/private.properties`:
```properties
j2ee.server.home=C:/apache-tomcat-9.0.71
j2ee.server.instance=tomcat90:home=C:\\apache-tomcat-9.0.71:base=apache-tomcat-9.0.71_base
```

2. **Đóng và mở lại project**: File → Close Project, sau đó mở lại

3. **Xóa cache NetBeans**: Xóa `C:\Users\[YourUsername]\AppData\Local\NetBeans\Cache`

**📁 Xem chi tiết**: `NETBEANS_TOMCAT_SETUP.md`

## Bước 4: Setup trong NetBeans
1. Mở NetBeans IDE
2. File → Open Project → Chọn thư mục BK_Bama
3. NetBeans sẽ tự động detect các JAR files trong WEB-INF/lib

## Bước 4: Cấu hình Tomcat
1. Tools → Servers → Add Server
2. Chọn Apache Tomcat 9.0
3. Chỉ đường dẫn Tomcat installation
4. Port: 8080

## Bước 5: Run Project
1. Right-click project → Clean and Build
2. Right-click project → Run
3. Hoặc F6
4. Browser sẽ tự động mở: http://localhost:8080/BaloShop

## Tài khoản test:
- Admin: admin/admin123
- User: user1/user123

## Nếu lỗi:
1. Kiểm tra MySQL đã start chưa
2. Kiểm tra password MySQL (210506)
3. Kiểm tra port Tomcat (8080)
4. **Kiểm tra đã có MySQL Connector JAR trong WEB-INF/lib chưa**
5. Clean và rebuild project

## CÁCH TẢI MYSQL CONNECTOR CHI TIẾT:
1. Vào: https://dev.mysql.com/downloads/connector/j/
2. Click "Go to Download Page"
3. Chọn "Platform Independent (Architecture Independent), ZIP Archive"
4. Click "Download" (không cần đăng ký)
5. Giải nén file ZIP
6. Tìm file mysql-connector-java-8.x.x.jar
7. Copy vào thư mục web/WEB-INF/lib/ của project

## Thêm hình ảnh:
- Copy file ảnh balo vào web/images/
- Hoặc dùng ảnh online URL trong database

Chúc bạn thành công! 🎒✨
