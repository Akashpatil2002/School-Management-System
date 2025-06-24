<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");
if (user == null || !"admin".equals(role)) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Teacher</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<div class="card shadow p-4">
			<h3 class="text-center">Add Teacher</h3>
			<form action="AddTeacherServlet" method="post">
				<input type="text" name="name" placeholder="Full Name"
					class="form-control mb-3" required> <input type="email"
					name="email" placeholder="Email" class="form-control mb-3" required>
				<input type="password" name="password" placeholder="Password"
					class="form-control mb-3" required> <input type="text"
					name="subject" placeholder="Subject" class="form-control mb-3"
					required> <input type="text" name="qualification"
					placeholder="Qualification" class="form-control mb-3" required>
				<input type="number" name="experience"
					placeholder="Experience (years)" class="form-control mb-3" required>
				<button class="btn btn-primary w-100">Add Teacher</button>
			</form>
		</div>
	</div>
</body>
</html>