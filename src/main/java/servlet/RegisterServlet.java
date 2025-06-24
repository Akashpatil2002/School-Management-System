package servlet;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.sql.*;
import util.DBConnection;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String role = request.getParameter("role");

		try (Connection conn = DBConnection.getConnection()) {
			String sql = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, ?)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, password);
			stmt.setString(4, role);
			stmt.executeUpdate();
//            response.sendRedirect("login.jsp");
			response.getWriter()
					.println("<script>alert('Register Successfully!');window.location='login.jsp';</script>");
		} catch (Exception e) {
			e.printStackTrace();
			response.getWriter().print("Error occurred.");
		}
	}
}
