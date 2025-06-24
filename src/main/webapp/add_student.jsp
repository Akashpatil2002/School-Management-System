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
<title>Add Student</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<div class="card p-4 shadow">
			<h3 class="text-center">Add Student</h3>
			<form action="AddStudentServlet" method="post">
				<input type="text" name="name" placeholder="Student Name"
					class="form-control mb-3" required> <input type="email"
					name="email" placeholder="Email" class="form-control mb-3" required>
				<input type="password" name="password" placeholder="Password"
					class="form-control mb-3" required> <input type="text"
					name="roll_no" placeholder="Roll No" class="form-control mb-3"
					required> <input type="text" name="class"
					placeholder="Class" class="form-control mb-3" required> <input
					type="text" name="section" placeholder="Section"
					class="form-control mb-3" required> <input type="date"
					name="dob" placeholder="DOB" class="form-control mb-3" required>
				<button class="btn btn-success w-100">Add Student</button>
			</form>
		</div>
	</div>
</body>
</html>