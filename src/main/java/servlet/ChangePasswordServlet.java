package servlet;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import util.DBConnection;

@WebServlet("/ChangePassword")
public class ChangePasswordServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String oldPassword = request.getParameter("old_password");
		String newPassword = request.getParameter("new_password");
		String confirmPassword = request.getParameter("confirm_password");

		try {
			Connection conn = DBConnection.getConnection();
			PreparedStatement ps = conn.prepareStatement("SELECT password FROM users WHERE email = ?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();

			if (rs.next()) {
				String currentPassword = rs.getString("password");

				if (!currentPassword.equals(oldPassword)) {
					response.getWriter()
							.println("<script>alert('Old password is incorrect!');history.back();</script>");
					return;
				}

				if (!newPassword.equals(confirmPassword)) {
					response.getWriter()
							.println("<script>alert('New passwords do not match!');history.back();</script>");
					return;
				}

				PreparedStatement update = conn.prepareStatement("UPDATE users SET password = ? WHERE email = ?");
				update.setString(1, newPassword);
				update.setString(2, email);
				update.executeUpdate();

				response.getWriter().println(
						"<script>alert('Password updated successfully!');window.location='dashboard_teacher.jsp';</script>");
			} else {
				response.getWriter().println("<script>alert('User not found!');history.back();</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().println("<script>alert('Error occurred!');history.back();</script>");
		}
	}
}
