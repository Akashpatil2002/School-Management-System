package servlet;

import java.io.*;
import java.util.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.*;
import util.DBConnection;

@WebServlet("/MarkAttendanceServlet")
public class MarkAttendanceServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        try (Connection conn = DBConnection.getConnection()) {
            Enumeration<String> params = request.getParameterNames();
            java.sql.Date today = new java.sql.Date(System.currentTimeMillis());

            while (params.hasMoreElements()) {
                String param = params.nextElement();
                if (param.startsWith("status")) {
                    int studentId = Integer.parseInt(param.substring(6)); // remove "status"
                    String status = request.getParameter(param);

                    PreparedStatement ps = conn.prepareStatement("INSERT INTO attendance (student_id, date, status) VALUES (?, ?, ?)");
                    ps.setInt(1, studentId);
                    ps.setDate(2, today);
                    ps.setString(3, status);
                    ps.executeUpdate();
                }
            }

            response.sendRedirect("view_attendance.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().print("Error saving attendance.");
        }
    }
}
