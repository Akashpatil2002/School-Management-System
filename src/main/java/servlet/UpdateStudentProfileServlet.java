package servlet;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.DBConnection;

@WebServlet("/UpdateStudentProfile")
public class UpdateStudentProfileServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String email = request.getParameter("email"); // read-only
		String name = request.getParameter("name");
		String password = request.getParameter("password");

		try (Connection conn = DBConnection.getConnection()) {
			PreparedStatement ps = conn.prepareStatement("UPDATE users SET name=?, password=? WHERE email=?");
			ps.setString(1, name);
			ps.setString(2, password);
			ps.setString(3, email);

			int i = ps.executeUpdate();

			HttpSession session = request.getSession();
			session.setAttribute("name", name); // update session name

			if (i > 0) {
//				response.sendRedirect("edit_student_profile.jsp");
				 response.getWriter().println(
 						"<script>alert('Profile Edit Successfully!');window.location='edit_student_profile.jsp';</script>");
			} else {
//				response.sendRedirect("edit_student_profile.jsp?error=1");
				response.getWriter().println(
 						"<script>alert('Something Wents Wrong!');window.location='dashboard_student.jsp';</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.sendRedirect("edit_student_profile.jsp?error=1");
		}
	}
}
