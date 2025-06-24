<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection"%>
<%@ page session="true"%>
<%
String role = (String) session.getAttribute("role");
if (role == null) {
	response.sendRedirect("login.jsp");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Time Table</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h3 class="text-center">Class Timetable</h3>
		<table class="table table-bordered table-striped mt-4 bg-white shadow">
			<thead class="table-dark">
				<tr>
					<th>Class</th>
					<th>Subject</th>
					<th>Teacher</th>
					<th>Day</th>
					<th>Start Time</th>
					<th>End Time</th>
				</tr>
			</thead>
			<tbody>
				<%
				Connection conn = DBConnection.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT * FROM timetable ORDER BY day, start_time");

				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("class")%></td>
					<td><%=rs.getString("subject")%></td>
					<td><%=rs.getString("teacher")%></td>
					<td><%=rs.getString("day")%></td>
					<td><%=rs.getString("start_time")%></td>
					<td><%=rs.getString("end_time")%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>

</html>