/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Forum;

import DAOs.Forum.CommentDAO;
import DAOs.Forum.ReportCommentDAO;
import DAOs.Forum.ReportNotificationDAO;
import Models.Comment;
import Models.ForumAllReportComment;
import Models.ForumReportComment;
import Models.ForumReportNotification;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class ReportComment extends HttpServlet {

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
            out.println("<title>Servlet ReportComment</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportComment at " + request.getContextPath() + "</h1>");
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
        String path = request.getRequestURI();
        if (path.endsWith("/ReportComment")) {
            
            List<ForumAllReportComment> rs = ReportCommentDAO.getAllReportComment2();

            HttpSession session = request.getSession();
            session.setAttribute("allReportComment", rs);
            request.getRequestDispatcher("forum_reportComment.jsp").forward(request, response);

        }
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

        String reportIgnore = "";
        String report_comment_reason = "";
        String report_comment_date = "";
        int report_comment_id = 0;
        int comment_id = 0;
        int user_report_id = 0;
        reportIgnore = request.getParameter("reportIgnore");
        if (!reportIgnore.equals("")) {
            report_comment_id = Integer.parseInt(request.getParameter("report_comment_id"));
            comment_id = Integer.parseInt(request.getParameter("comment_id"));
            

            ForumReportComment ra = new ForumReportComment(report_comment_id, user_report_id, report_comment_reason, comment_id, report_comment_date);
            int count = ReportCommentDAO.deleteReportComment2(ra);
            if (count > 0) {
                response.sendRedirect(request.getContextPath() + "/ReportComment");
            } else {
                response.sendRedirect(request.getContextPath() + "/AdminForum");
            }
        }

        String reportCommentDelete = "";
        String post_title = "";
        String comment_content = "";
        String report_notification_content = "";
        int userID = 0;
        String comment_date = "";
        String comment_edit_date = "";
        String comment_status = "active";
        reportCommentDelete = request.getParameter("reportCommentDelete");
        if (!reportCommentDelete.equals("")) {
            report_notification_content = "Lý Do Xoá: " + request.getParameter("report_notification_content");
            report_comment_id = Integer.parseInt(request.getParameter("report_comment_id"));
            comment_id = Integer.parseInt(request.getParameter("comment_id"));

            ForumReportComment ra = new ForumReportComment(report_comment_id, user_report_id, report_comment_reason, comment_id, report_comment_date);
            int count = ReportCommentDAO.deleteReportPostByCommentID2(ra);
            int post_id = 0;

            Comment a = new Comment(comment_id, comment_content, userID, comment_date, comment_edit_date, post_id, comment_status);
            int count2 = CommentDAO.disableComment2(a);

            if (count > 0 && count2 > 0) {
                a = CommentDAO.getCommentByID2(comment_id);
                int report_notification_id = 0;
                String report_notification_status = "not read";
                userID = a.getUser_id();
                ForumReportNotification rn = new ForumReportNotification(report_notification_id, userID, report_notification_content, post_id, comment_id, report_notification_status);
                int count3 = ReportNotificationDAO.newReportNotificationComment2(rn);

                response.sendRedirect(request.getContextPath() + "/ReportComment");
            } else {
                response.sendRedirect(request.getContextPath() + "/AdminForum");
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
