package servlet;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import util.DBConnection;

@WebServlet("/AddTimetable")
public class AddTimetableServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        try {
            Connection conn = DBConnection.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO timetable (class, subject, teacher, day, start_time, end_time) VALUES (?, ?, ?, ?, ?, ?)"
            );
            ps.setString(1, request.getParameter("class"));
            ps.setString(2, request.getParameter("subject"));
            ps.setString(3, request.getParameter("teacher"));
            ps.setString(4, request.getParameter("day"));
            ps.setString(5, request.getParameter("start_time"));
            ps.setString(6, request.getParameter("end_time"));
            ps.executeUpdate();

            response.sendRedirect("view_timetable.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error saving timetable.");
        }
    }
}
