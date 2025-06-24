<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection"%>
<%@ page session="true"%>
<%
String email = (String) session.getAttribute("email");
String role = (String) session.getAttribute("role");

if (email == null || !"student".equals(role)) {
	response.sendRedirect("login.jsp");
	return;
}

Connection conn = DBConnection.getConnection();
PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();

String name = "";
String password = "";

if (rs.next()) {
	name = rs.getString("name");
	password = rs.getString("password");
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h2 class="text-center mb-4">Edit Profile</h2>
		<div class="card p-4 shadow" style="max-width: 500px; margin: auto;">
			<form action="UpdateStudentProfile" method="post">
				<div class="mb-3">
					<label for="email" class="form-label fw-bold">Email</label> <input
						type="email" class="form-control" name="email"
						value="<%=email%>" readonly>
				</div>
				<div class="mb-3">
					<label for="name" class="form-label fw-bold">Name</label> <input
						type="text" class="form-control" name="name" value="<%=name%>"
						required>
				</div>
				<div class="mb-3">
					<label for="password" class="form-label fw-bold">Password</label> <input
						type="password" class="form-control" name="password"
						value="<%=password%>" required>
				</div>
				<button type="submit" class="btn btn-success w-100">Update
					Profile</button>
			</form>
			<a href="dashboard_student.jsp" class="btn btn-secondary mt-3 w-100">Back
				to Dashboard</a>
		</div>
	</div>
</body>
</html>