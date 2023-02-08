/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Forum;

import DAOs.Forum.ReportCommentDAO;
import DAOs.Forum.ReportPostDAO;
import Models.ForumReportComment;
import Models.ForumReportPost;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class Report extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Report</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Report at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("UTF-8");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String reportPost = "";
        String report_post_reason = "";
        int post_id = 0;
        int user_report_id = 0;
        String report_post_date = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        int report_post_id = 0;

        reportPost = request.getParameter("reportPost");
        if (!reportPost.equals("")) {
            report_post_reason = request.getParameter("report_post_reason");
            post_id = Integer.parseInt(request.getParameter("post_id"));
            user_report_id = Integer.parseInt(request.getParameter("userID"));

            ForumReportPost rp = new ForumReportPost(report_post_id, user_report_id, report_post_reason, post_id, report_post_date);
            int count = ReportPostDAO.newReportPost2(rp);
            if (count > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("report", "success");
                response.sendRedirect(request.getContextPath() + "/Post/" + post_id);
            } else {
                response.sendRedirect(request.getContextPath() + "/Forum");
            }
        }

        String reportComment = "";
        String report_comment_reason = "";
        int comment_id = 0;
        String report_comment_date = new SimpleDateFormat("yyyy.MM.dd.HH.mm.ss").format(new Date());
        int report_comment_id = 0;

        reportComment = request.getParameter("reportComment");
        if (!reportComment.equals("")) {
            report_comment_reason = request.getParameter("report_comment_reason");
            comment_id = Integer.parseInt(request.getParameter("comment_id"));
            post_id = Integer.parseInt(request.getParameter("post_id"));
            user_report_id = Integer.parseInt(request.getParameter("userID"));
            ForumReportComment ra = new ForumReportComment(report_comment_id, user_report_id, report_comment_reason, comment_id, report_comment_date);
            int count = ReportCommentDAO.newReportComment2(ra);
            if (count > 0) {
                HttpSession session = request.getSession();
                session.setAttribute("report", "success");
                response.sendRedirect(request.getContextPath() + "/Post/" + post_id);
            } else {
                response.sendRedirect(request.getContextPath() + "/Forum");
            }

        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
