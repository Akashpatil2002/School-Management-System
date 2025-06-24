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
PreparedStatement ps = conn.prepareStatement("SELECT * FROM report_card WHERE student_email = ?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Report Card</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h2 class="text-center mb-4">My Report Card</h2>
		<div class="card shadow p-4">
			<table class="table table-bordered table-striped text-center">
				<thead class="table-primary">
					<tr>
						<th>Subject</th>
						<th>Marks</th>
						<th>Grade</th>
						<th>Exam Type</th>
						<th>Download Pdf</th>
					</tr>
				</thead>
				<tbody>
					<%
					boolean hasRecords = false;
					while (rs.next()) {
						hasRecords = true;
					%>
					<tr>
						<td><%=rs.getString("subject")%></td>
						<td><%=rs.getInt("marks")%></td>
						<td><%=rs.getString("grade")%></td>
						<td><%=rs.getString("exam_type")%></td>
						<td><a href="DownloadReportPDFServlet" class="btn btn-danger">Download
								as PDF</a></td>
					</tr>
					<%
					}
					if (!hasRecords) {
					%>
					<tr>
						<td colspan="4">No records found.</td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<a href="dashboard_student.jsp" class="btn btn-primary">Back to
				Dashboard</a>
		</div>
	</div>
</body>
</html>