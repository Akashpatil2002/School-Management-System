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
<title>Mark Attendance</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
	<div class="container mt-5">
		<h3 class="text-center">Mark Attendance</h3>
		<form method="get" class="row mb-4">
			<div class="col-md-4">
				<input type="text" name="class" class="form-control"
					placeholder="Class" required>
			</div>
			<div class="col-md-4">
				<input type="text" name="section" class="form-control"
					placeholder="Section" required>
			</div>
			<div class="col-md-4">
				<button class="btn btn-primary w-100">Load Students</button>
			</div>
		</form>

		<%
		String selectedClass = request.getParameter("class");
		String selectedSection = request.getParameter("section");
		if (selectedClass != null && selectedSection != null) {
			Connection conn = DBConnection.getConnection();
			String sql = "SELECT s.id, u.name FROM students s JOIN users u ON s.user_id = u.id WHERE s.class=? AND s.section=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, selectedClass);
			ps.setString(2, selectedSection);
			ResultSet rs = ps.executeQuery();
		%>
		<form method="post" action="MarkAttendanceServlet">
			<input type="hidden" name="class" value="<%=selectedClass%>">
			<input type="hidden" name="section" value="<%=selectedSection%>">
			<table class="table table-bordered bg-white shadow">
				<thead class="table-dark">
					<tr>
						<th>Student Name</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("name")%></td>
						<td><input type="hidden" name="studentId"
							value="<%=rs.getInt("id")%>">
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="status<%=rs.getInt("id")%>" value="Present" required>
								<label class="form-check-label">Present</label>
							</div>
							<div class="form-check form-check-inline">
								<input class="form-check-input" type="radio"
									name="status<%=rs.getInt("id")%>" value="Absent" required>
								<label class="form-check-label">Absent</label>
							</div></td>
					</tr>
					<%
					}
					%>
				</tbody>
			</table>
			<button class="btn btn-success w-100">Submit Attendance</button>
		</form>
		<%
		}
		%>
	</div>
</body>
</html>