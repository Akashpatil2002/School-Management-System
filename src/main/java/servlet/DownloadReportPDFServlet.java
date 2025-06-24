//package servlet;
//
//import java.io.*;
//import java.sql.*;
//
//import javax.swing.text.Document;
//
//import jakarta.servlet.*;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.*;
//import com.itextpdf.text.*;
//import com.itextpdf.text.pdf.*;
//import util.DBConnection;
//
//@WebServlet("/")
//public class DownloadReportPDFServlet extends HttpServlet {
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String email = (String) request.getSession().getAttribute("email");
//
//        response.setContentType("application/pdf");
//        response.setHeader("Content-Disposition", "attachment; filename=report_card.pdf");
//
//        try (OutputStream out = response.getOutputStream();
//             Connection conn = DBConnection.getConnection();
//             PreparedStatement ps = conn.prepareStatement("SELECT * FROM report_card WHERE student_email = ?")) {
//
//            ps.setString(1, email);
//            ResultSet rs = ps.executeQuery();
//
//            Document doc = new Document();
//            PdfWriter.getInstance(doc, out);
//            doc.open();
//
//            doc.add(new Paragraph("Student Report Card"));
//            doc.add(new Paragraph("Email: " + email));
//            doc.add(new Paragraph(" "));
//
//            PdfPTable table = new PdfPTable(4);
//            table.addCell("Subject");
//            table.addCell("Marks");
//            table.addCell("Grade");
//            table.addCell("Exam Type");
//
//            while (rs.next()) {
//                table.addCell(rs.getString("subject"));
//                table.addCell(String.valueOf(rs.getInt("marks")));
//                table.addCell(rs.getString("grade"));
//                table.addCell(rs.getString("exam_type"));
//            }
//
//            doc.add(table);
//            doc.close();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//    }
//}
//
