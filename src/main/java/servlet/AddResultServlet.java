package servlet;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import util.DBConnection;

@WebServlet("/AddResult")
public class AddResultServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        int studentId = Integer.parseInt(request.getParameter("studentId"));
        String subject = request.getParameter("subject");
        int marks = Integer.parseInt(request.getParameter("marks"));
        String examType = request.getParameter("examType");

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO results (student_id, subject, marks, exam_type, date) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, studentId);
            ps.setString(2, subject);
            ps.setInt(3, marks);
            ps.setString(4, examType);
            ps.setDate(5, new java.sql.Date(System.currentTimeMillis()));
            ps.executeUpdate();

            response.sendRedirect("view_result.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error saving result.");
        }
    }
}
