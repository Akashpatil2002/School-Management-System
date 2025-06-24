<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection"%>
<%@ page session="true"%>
<%
String role = (String) session.getAttribute("role");
if (role == null || (!role.equals("admin") && !role.equals("teacher"))) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Result</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h3 class="text-center">Add Student Result</h3>
		<form action="AddResult" method="post" class="card p-4 shadow">
			<div class="mb-3">
				<label>Student</label> <select name="studentId" class="form-control"
					required>
					<%
					Connection conn = DBConnection.getConnection();
					Statement stmt = conn.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT s.id, u.name FROM students s JOIN users u ON s.user_id = u.id");
					while (rs.next()) {
					%>
					<option value="<%=rs.getInt("id")%>"><%=rs.getString("name")%></option>
					<%
					}
					%>
				</select>
			</div>
			<div class="mb-3">
				<input type="text" name="subject" placeholder="Subject"
					class="form-control" required>
			</div>
			<div class="mb-3">
				<input type="number" name="marks" placeholder="Marks"
					class="form-control" required>
			</div>
			<div class="mb-3">
				<input type="text" name="examType"
					placeholder="Exam Type (e.g., Midterm, Final)" class="form-control"
					required>
			</div>
			<button class="btn btn-success w-100">Save Result</button>
		</form>
	</div>
</body>
</html>