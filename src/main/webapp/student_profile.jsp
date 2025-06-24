<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
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
PreparedStatement ps = conn.prepareStatement("SELECT * FROM users WHERE email = ?");
ps.setString(1, email);
ResultSet rs = ps.executeQuery();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Profile</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<body class="bg-light">
	<div class="container mt-5">
        <h2 class="text-center mb-4">Student Profile</h2>
        <div class="card shadow p-4 mx-auto" style="max-width: 600px;">
            <%
            if (rs.next()) {
            %>
            <div class="mb-3">
                <label class="form-label fw-bold">Name:</label>
                <p><%=rs.getString("name")%></p>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Email:</label>
                <p><%=rs.getString("email")%></p>
            </div>
            <div class="mb-3">
                <label class="form-label fw-bold">Role:</label>
                <p><%=rs.getString("role")%></p>
            </div>
            <%
            } else {
            %>
                <p class="text-danger">No profile found.</p>
            <%
            }
            %>
            <a href="dashboard_student.jsp" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>
</body>
</body>

</html> --%>