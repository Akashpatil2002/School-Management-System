<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String email = (String) session.getAttribute("email");
String name = (String) session.getAttribute("name");
String user = (String) session.getAttribute("user");
String role = (String) session.getAttribute("role");

if (user == null || !"student".equals(role)) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Dashboard</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

<style>
.card-img-top {
	height: 180px;
	object-fit: cover;
}

.mar {
	margin-right: 14px;
}
.n{
margin-right: 14px;
}
</style>
</head>
<body class="bg-light">

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">SchoolSys</a>
			<div class="collapse navbar-collapse justify-content-end">
				<span class="navbar-text text-white ms-auto n">Welcome, <%=user%>!
				</span>
				<ul class="navbar-nav">
					<li class="nav-item mar"><a
						class="btn btn-outline-info navbar-text text-white ms-auto"
						href="change_password.jsp">Change Password</a></li>
					<li class="nav-item"><a
						class="text-warning btn btn-outline-danger navbar-text text-white ms-auto"
						href="logout.jsp">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<!-- Welcome Section -->
	<div class="container mt-4">
		<div class="text-center">
			<h2>
				Welcome,
				<%=name != null ? name : "Student"%>!
			</h2>
			<p class="text-muted">Here's your dashboard with important
				features</p>
		</div>

		<!-- Dashboard Cards -->
		<div class="row mt-4">
			<!-- Profile -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-sm">
					<img src="https://picsum.photos/seed/picsum/200/300" class="card-img-top"
						alt="Profile">
					<div class="card-body">
						<h5 class="card-title">My Profile</h5>
						<p class="card-text">View or edit your personal information.</p>
						<a href="edit_student_profile.jsp" class="btn btn-primary">Go to
							Profile</a>
					</div>
				</div>
			</div>

			<!-- Attendance -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-sm">
					<img src="https://picsum.photos/200/300?grayscale" class="card-img-top"
						alt="Attendance">
					<div class="card-body">
						<h5 class="card-title">Attendance</h5>
						<p class="card-text">Check your attendance records.</p>
						<a href="student_attendance.jsp" class="btn btn-primary">View
							Attendance</a>
					</div>
				</div>
			</div>

			<!-- Grades -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-sm">
					<img src="https://picsum.photos/200/300/?blur" class="card-img-top" alt="Grades">
					<div class="card-body">
						<h5 class="card-title">Report Card</h5>
						<p class="card-text">View your academic performance.</p>
						<a href="student_report.jsp" class="btn btn-primary">View
							Report</a>
					</div>
				</div>
			</div>
		</div>

		<!-- Second Row -->
		<div class="row mb-4">
			<!-- Timetable -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-sm">
					<img src="https://picsum.photos/id/870/200/300?grayscale&blur=2" class="card-img-top"
						alt="Timetable">
					<div class="card-body">
						<h5 class="card-title">Timetable</h5>
						<p class="card-text">Check your daily class schedule.</p>
						<a href="student_timetable.jsp" class="btn btn-primary">View
							Timetable</a>
					</div>
				</div>
			</div>

			<!-- Notices -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-sm">
					<img src="https://picsum.photos/200/300/?blur=2" class="card-img-top" alt="Notices">
					<div class="card-body">
						<h5 class="card-title">Notices</h5>
						<p class="card-text">See important updates from school.</p>
						<a href="student_notices.jsp" class="btn btn-primary">Read
							Notices</a>
					</div>
				</div>
			</div>

			<!-- Change Password -->
			<div class="col-md-4 mb-4">
				<div class="card shadow-sm">
					<img src="https://picsum.photos/200/300.jpg" class="card-img-top" alt="Password">
					<div class="card-body">
						<h5 class="card-title">Change Password</h5>
						<p class="card-text">Update your account password.</p>
						<a href="change_password.jsp" class="btn btn-primary">Change
							Password</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>