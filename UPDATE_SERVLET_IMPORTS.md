# Hướng dẫn cập nhật project cho Tomcat 10.1

## Vấn đề
Bạn đang sử dụng Tomcat 10.1 nhưng project hiện tại sử dụng `javax.servlet.*` (phù hợp với Tomcat 9.x và cũ hơn).

Tomcat 10.x sử dụng **Jakarta EE** với namespace `jakarta.*` thay vì `javax.*`.

## Giải pháp

### Tùy chọn 1: Downgrade xuống Tomcat 9.x (Khuyến nghị)

**Lý do**: Project hiện tại đã hoàn chỉnh với `javax.*`, việc downgrade sẽ nhanh nhất.

1. **Download Tomcat 9.0.x**:
   - Link: https://tomcat.apache.org/download-90.cgi
   - Chọn phiên bản mới nhất của 9.0.x
   - Giải nén vào: `C:\apache-tomcat-9.0.xx`

2. **Cập nhật cấu hình**:
   ```properties
   # Trong nbproject/private/private.properties
   j2ee.server.home=C:/apache-tomcat-9.0.xx
   j2ee.server.domain=C:/apache-tomcat-9.0.xx/conf
   j2ee.server.instance=tomcat90:home=C:\\apache-tomcat-9.0.xx:base=apache-tomcat-9.0_base
   ```

3. **Cấu hình lại NetBeans**:
   - Tools → Servers → Remove server cũ
   - Add Server → Chọn đường dẫn Tomcat 9.0 mới

### Tùy chọn 2: Cập nhật project lên Jakarta EE

**Nếu muốn tiếp tục dùng Tomcat 10.1**, cần thay đổi:

1. **Cập nhật web.xml**:
   ```xml
   <!-- Thay thế -->
   <web-app xmlns="http://java.sun.com/xml/ns/javaee"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="http://java.sun.com/xml/ns/javaee 
                http://java.sun.com/xml/ns/javaee/web-app_3_0.xsd"
            version="3.0">
   
   <!-- Bằng -->
   <web-app xmlns="https://jakarta.ee/xml/ns/jakartaee"
            xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
            xsi:schemaLocation="https://jakarta.ee/xml/ns/jakartaee 
                https://jakarta.ee/xml/ns/jakartaee/web-app_5_0.xsd"
            version="5.0">
   ```

2. **Cập nhật tất cả imports trong Java files**:
   ```java
   // Thay thế tất cả
   import javax.servlet.*;
   import javax.servlet.http.*;
   
   // Bằng
   import jakarta.servlet.*;
   import jakarta.servlet.http.*;
   ```

3. **Cập nhật JSP files**:
   ```jsp
   <%-- Thay thế --%>
   <%@ page import="javax.servlet.*" %>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
   <%-- Bằng --%>
   <%@ page import="jakarta.servlet.*" %>
   <%@ taglib uri="jakarta.tags.core" prefix="c" %>
   ```

## Khuyến nghị

**→ Chọn Tùy chọn 1**: Downgrade xuống Tomcat 9.x

**Lý do**:
- Không cần thay đổi code
- Tomcat 9.x vẫn được hỗ trợ và stable
- Tránh risk lỗi khi migrate

## Các bước thực hiện Tùy chọn 1

1. Download và cài đặt Tomcat 9.0.x
2. Cập nhật đường dẫn trong NetBeans
3. Restart NetBeans và test project

Nếu cần hỗ trợ chi tiết, hãy cho biết bạn chọn tùy chọn nào!
