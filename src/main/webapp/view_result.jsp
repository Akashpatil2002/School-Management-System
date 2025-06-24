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
<title>View Result</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h3 class="text-center">Student Results</h3>
		<table class="table table-bordered bg-white shadow mt-4">
			<thead class="table-dark">
				<tr>
					<th>Student</th>
					<th>Subject</th>
					<th>Marks</th>
					<th>Exam Type</th>
					<th>Date</th>
				</tr>
			</thead>
			<tbody>
				<%
				Connection conn = DBConnection.getConnection();
				String query = "SELECT u.name, r.subject, r.marks, r.exam_type, r.date FROM results r JOIN students s ON r.student_id = s.id JOIN users u ON s.user_id = u.id";
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("subject")%></td>
					<td><%=rs.getInt("marks")%></td>
					<td><%=rs.getString("exam_type")%></td>
					<td><%=rs.getDate("date")%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>