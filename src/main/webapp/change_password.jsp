<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
    String email = (String) session.getAttribute("email");
    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!-- Add All the protected pages related to email  -->
<%-- <%
    if (session.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Change Password</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h3 class="text-center">Change Password</h3>
    <form action="ChangePassword" method="post" class="card p-4 shadow-sm mx-auto" style="max-width: 500px;">
        <input type="hidden" name="email" value="<%= email %>">
        
        <div class="mb-3">
            <label>Old Password</label>
            <input type="password" name="old_password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>New Password</label>
            <input type="password" name="new_password" class="form-control" required>
        </div>
        <div class="mb-3">
            <label>Confirm New Password</label>
            <input type="password" name="confirm_password" class="form-control" required>
        </div>
        
        <button type="submit" class="btn btn-primary w-100">Update Password</button>
    </form>
</div>
</body>

</html>