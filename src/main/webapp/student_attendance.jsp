<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection"%>
<%
Integer studentId = (Integer) session.getAttribute("student_id");

if (studentId == null) {
	response.sendRedirect("login.jsp");
	return;
}

Connection conn = DBConnection.getConnection();
PreparedStatement ps = conn
		.prepareStatement("SELECT date, status FROM attendance WHERE student_id = ? ORDER BY date DESC");
ps.setInt(1, studentId);
ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h2 class="text-center mb-4">My Attendance</h2>

		<table class="table table-bordered text-center shadow">
			<thead class="table-primary">
				<tr>
					<th>Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				boolean hasData = false;
				while (rs.next()) {
					hasData = true;
				%>
				<tr>
					<td><%=rs.getDate("date")%></td>
					<td><span
						class="badge bg-<%=rs.getString("status").equals("Present") ? "success" : "danger"%>"><%=rs.getString("status")%></span></td>
				</tr>
				<%
				}
				if (!hasData) {
				%>
				<tr>
					<td colspan="2">No attendance records found.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<a href="dashboard_student.jsp" class="btn btn-secondary">Back to
			Dashboard</a>
	</div>
</body>
</html> --%>



<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, util.DBConnection"%>

<%
Integer studentId = (Integer) session.getAttribute("student_id");

if (studentId == null) {
	response.sendRedirect("login.jsp");
	return;
}

Connection conn = DBConnection.getConnection();
PreparedStatement ps = conn
		.prepareStatement("SELECT date, status FROM attendance WHERE student_id = ? ORDER BY date DESC");
ps.setInt(1, studentId);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Attendance</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-5">
		<h2 class="text-center mb-4">My Attendance</h2>

		<table class="table table-bordered text-center shadow">
			<thead class="table-primary">
				<tr>
					<th>Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody>
				<%
				boolean hasData = false;
				while (rs.next()) {
					hasData = true;
				%>
				<tr>
					<td><%=rs.getDate("date")%></td>
					<td><span
						class="badge bg-<%=rs.getString("status").equals("Present") ? "success" : "danger"%>"><%=rs.getString("status")%></span></td>
				</tr>
				<%
				}
				if (!hasData) {
				%>
				<tr>
					<td colspan="2">No attendance records found.</td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

		<a href="dashboard_student.jsp" class="btn btn-secondary">Back to
			Dashboard</a>
	</div>
</body>
</html>