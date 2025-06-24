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
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">School Admin</a> <span
			class="navbar-text text-white ms-auto">Welcome, <%=user%>!
		</span>
		<li class="nav-item"><a
			class="btn btn-danger navbar-text text-white ms-auto" href="logout.jsp">Logout</a>
		</li>s
		<li class="nav-item"><a
			class="btn btn-success navbar-text text-white ms-auto" href="change_password.jsp">Change Password</a>
		</li>
	</nav>

	<div class="container mt-5">
		<div class="row g-4">
			<div class="col-md-4">
				<div class="card text-white bg-primary shadow">
					<div class="card-body">
						<h5 class="card-title">Add Student</h5>
						<p class="card-text">Register a new student</p>
						<a href="add_student.jsp" class="btn btn-light">Add</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-success shadow">
					<div class="card-body">
						<h5 class="card-title">View Students</h5>
						<p class="card-text">See all registered students</p>
						<a href="view_students.jsp" class="btn btn-light">View</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-info shadow">
					<div class="card-body">
						<h5 class="card-title">Add Teacher</h5>
						<p class="card-text">Register a new teacher</p>
						<a href="add_teacher.jsp" class="btn btn-light">Add</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-success shadow">
					<div class="card-body">
						<h5 class="card-title">View Teachers</h5>
						<p class="card-text">See all teacher's</p>
						<a href="view_teachers.jsp" class="btn btn-light">View</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>