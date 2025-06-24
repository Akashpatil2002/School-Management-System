<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
    session.invalidate(); // Clears all session data
    response.sendRedirect("login.jsp"); // Redirect to login page
%>
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html> -->