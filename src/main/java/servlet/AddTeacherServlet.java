package servlet;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import util.DBConnection;

@WebServlet("/AddTeacherServlet")
public class AddTeacherServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String subject = request.getParameter("subject");
        String qualification = request.getParameter("qualification");
        int experience = Integer.parseInt(request.getParameter("experience"));

        try (Connection conn = DBConnection.getConnection()) {
            // Add to users table
            String sqlUser = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, 'teacher')";
            PreparedStatement pstUser = conn.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
            pstUser.setString(1, name);
            pstUser.setString(2, email);
            pstUser.setString(3, password);
            pstUser.executeUpdate();

            ResultSet rs = pstUser.getGeneratedKeys();
            int userId = -1;
            if (rs.next()) userId = rs.getInt(1);

            // Add to teachers table
            String sqlTeacher = "INSERT INTO teachers (user_id, subject, qualification, experience) VALUES (?, ?, ?, ?)";
            PreparedStatement pstTeacher = conn.prepareStatement(sqlTeacher);
            pstTeacher.setInt(1, userId);
            pstTeacher.setString(2, subject);
            pstTeacher.setString(3, qualification);
            pstTeacher.setInt(4, experience);
            pstTeacher.executeUpdate();

            response.sendRedirect("view_teachers.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error adding teacher.");
        }
    }
}
