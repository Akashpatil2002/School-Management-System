<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*, util.DBConnection" %>
<%@ page session="true"%>
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
<title>View Students</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h3 class="text-center">Registered Students</h3>
		<table class="table table-bordered table-hover bg-white shadow mt-4">
			<thead class="table-dark">
				<tr>
					<th>Name</th>
					<th>Roll No</th>
					<th>Email</th>
					<th>Class</th>
					<th>Section</th>
					<th>DOB</th>
				</tr>
			</thead>
			<tbody>
				<%
				Connection conn = DBConnection.getConnection();
				Statement stmt = conn.createStatement();
				String query = "SELECT s.roll_no, s.class, s.section, s.dob, u.name, u.email "
						+ "FROM students s JOIN users u ON s.user_id = u.id";
				ResultSet rs = stmt.executeQuery(query);
				while (rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("name")%></td>
					<td><%=rs.getString("roll_no")%></td>
					<td><%=rs.getString("email")%></td>
					<td><%=rs.getString("class")%></td>
					<td><%=rs.getString("section")%></td>
					<td><%=rs.getString("dob")%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>
	</div>
</body>
</html>