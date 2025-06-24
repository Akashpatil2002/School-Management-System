<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");
if (user == null || !"teacher".equals(role)) {
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
		</li>
		<li class="nav-item"><a
			class="btn btn-outline-warning navbar-text text-white ms-auto" href="change_password.jsp">Change Password</a>
		</li>
	</nav>

	<div class="container mt-5">
		<div class="row g-4">
			<div class="col-md-4">
				<div class="card text-white bg-primary shadow">
					<div class="card-body">
						<h5 class="card-title">Add Attendance</h5>
						<p class="card-text">Add a new sttendance</p>
						<a href="mark_attendance.jsp" class="btn btn-light">Attendance</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-success shadow">
					<div class="card-body">
						<h5 class="card-title">View Attendance</h5>
						<p class="card-text">See all attendance students</p>
						<a href="view_attendance.jsp" class="btn btn-light">View</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-info shadow">
					<div class="card-body">
						<h5 class="card-title">Add Result</h5>
						<p class="card-text">Add a result</p>
						<a href="add_result.jsp" class="btn btn-light">Add Result</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-success shadow">
					<div class="card-body">
						<h5 class="card-title">View Result</h5>
						<p class="card-text">View Result</p>
						<a href="view_result.jsp" class="btn btn-light">View Result</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-primary shadow">
					<div class="card-body">
						<h5 class="card-title">Add Timetable</h5>
						<p class="card-text">Add student timetable</p>
						<a href="add_timetable.jsp" class="btn btn-light">Add
							Timetable</a>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card text-white bg-primary shadow">
					<div class="card-body">
						<h5 class="card-title">View Timetable</h5>
						<p class="card-text">View student timetable</p>
						<a href="view_timetable.jsp" class="btn btn-light">View
							Timetable</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>