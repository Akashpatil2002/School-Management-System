package servlet;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import util.DBConnection;

@WebServlet("/AddStudentServlet")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String roll_no = request.getParameter("roll_no");
        String studentClass = request.getParameter("class");
        String section = request.getParameter("section");
        String dob = request.getParameter("dob");

        try (Connection conn = DBConnection.getConnection()) {
            // Insert user
            String sqlUser = "INSERT INTO users (name, email, password, role) VALUES (?, ?, ?, 'student')";
            PreparedStatement pstUser = conn.prepareStatement(sqlUser, Statement.RETURN_GENERATED_KEYS);
            pstUser.setString(1, name);
            pstUser.setString(2, email);
            pstUser.setString(3, password);
            pstUser.executeUpdate();

            ResultSet rs = pstUser.getGeneratedKeys();
            int userId = -1;
            if (rs.next()) userId = rs.getInt(1);

            // Insert student
            String sqlStudent = "INSERT INTO students (user_id, roll_no, class, section, dob) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstStudent = conn.prepareStatement(sqlStudent);
            pstStudent.setInt(1, userId);
            pstStudent.setString(2, roll_no);
            pstStudent.setString(3, studentClass);
            pstStudent.setString(4, section);
            pstStudent.setString(5, dob);
            pstStudent.executeUpdate();

            response.sendRedirect("view_students.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Failed to add student");
        }
    }
}
