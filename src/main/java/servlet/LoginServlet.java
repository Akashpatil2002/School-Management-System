package servlet;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.sql.*;
import util.DBConnection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		try (Connection conn = DBConnection.getConnection()) {
			String sql = "SELECT * FROM users WHERE email=? AND password=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				String role = rs.getString("role");
				HttpSession session = request.getSession();
				session.setAttribute("user", rs.getString("name"));
				session.setAttribute("role", role);
				session.setAttribute("email", rs.getString("email"));
//                session.setAttribute("role", rs.getString("role")); // optional

				if ("admin".equals(role)) {
//                    response.sendRedirect("dashboard_admin.jsp");
					response.getWriter().println(
							"<script>alert('Admin Login Successfully!');window.location='dashboard_admin.jsp';</script>");
				} else if ("teacher".equals(role)) {
//                    response.sendRedirect("dashboard_teacher.jsp");
					response.getWriter().println(
							"<script>alert('Teacher Login Successfully!');window.location='dashboard_teacher.jsp';</script>");
				} else {
					session.setAttribute("student_id", rs.getInt("id"));

//                    response.sendRedirect("dashboard_student.jsp");
					response.getWriter().println(
							"<script>alert('Student Login Successfully!');window.location='dashboard_student.jsp';</script>");
				}
			} else {
//                response.getWriter().print("Invalid credentials");
				response.getWriter()
						.println("<script>alert('Invalid credentials!');window.location='login.jsp';</script>");
			}
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("Login failed");
		}
	}
}
