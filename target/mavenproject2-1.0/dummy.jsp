
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<sql:setDataSource var="myDatasource" 
                   driver="com.mysql.jdbc.Driver" 
                   url="jdbc:mysql://localhost/test" 
                   user="root" 
                   password=""
                   />
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    
    <body>
        <h4>${msgs}</h4>
    </body>
</html>
