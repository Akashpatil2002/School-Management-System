<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String role = (String) session.getAttribute("role");
if (role == null || !(role.equals("admin") || role.equals("teacher"))) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Time Tables</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h3 class="text-center mb-4">Add Class Timetable</h3>
		<form action="AddTimetable" method="post"
			class="card p-4 shadow">
			<div class="mb-3">
				<input type="text" name="class" class="form-control"
					placeholder="Class (e.g. 10A)" required>
			</div>
			<div class="mb-3">
				<input type="text" name="subject" class="form-control"
					placeholder="Subject" required>
			</div>
			<div class="mb-3">
				<input type="text" name="teacher" class="form-control"
					placeholder="Teacher Name" required>
			</div>
			<div class="mb-3">
				<select name="day" class="form-control" required>
					<option value="">Select Day</option>
					<option>Monday</option>
					<option>Tuesday</option>
					<option>Wednesday</option>
					<option>Thursday</option>
					<option>Friday</option>
					<option>Saturday</option>
				</select>
			</div>
			<div class="mb-3">
				<input type="time" name="start_time" class="form-control" required>
			</div>
			<div class="mb-3">
				<input type="time" name="end_time" class="form-control" required>
			</div>
			<button class="btn btn-primary w-100">Save Timetable</button>
		</form>
	</div>
</body>
</html>