/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Forum;

import DAOs.Forum.PostDAO;
import DAOs.Forum.ReportNotificationDAO;
import DAOs.Forum.ReportPostDAO;
import Models.ForumAllReportPost;
import Models.ForumPost;
import Models.ForumReportNotification;
import Models.ForumReportPost;
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
public class ReportPost extends HttpServlet {

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
            out.println("<title>Servlet ReportPost</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ReportPost at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/ReportPost")){
            
            List<ForumAllReportPost> rs = ReportPostDAO.getAllReportPost2();
            
                HttpSession session = request.getSession();
                session.setAttribute("allReportPost", rs);
                request.getRequestDispatcher("forum_reportPost.jsp").forward(request, response);
            
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
        
        String report_notification_content;
        String reportIgnore = "";
        String report_post_reason = "";
        String report_post_date = "";
        int report_post_id = 0;
        int post_id = 0;
        int user_report_id = 0;
        reportIgnore = request.getParameter("reportIgnore");
        if(!reportIgnore.equals("")){
            report_post_id = Integer.parseInt(request.getParameter("report_post_id"));           
            post_id = Integer.parseInt(request.getParameter("post_id"));
            
            ForumReportPost rp = new ForumReportPost(report_post_id, user_report_id, report_post_reason, post_id, report_post_date);
            int count = ReportPostDAO.deleteReportPost2(rp);
                    if (count > 0){                    
                        response.sendRedirect(request.getContextPath()+"/ReportPost");
                    } else {
                        response.sendRedirect(request.getContextPath()+"/AdminForum");
                    }
            }
        
        String reportPostDelete = "";
        String post_title = "";
        String post_content = "";
        int userID = 0;
        String post_date = "";
        String post_edit_date = "";
        int topic_id = 1;
        String post_status = "active";
        
        reportPostDelete = request.getParameter("reportPostDelete");
        if(!reportPostDelete.equals("")){
            report_notification_content = "Lý Do Xoá: " + request.getParameter("report_notification_content");
            report_post_id = Integer.parseInt(request.getParameter("report_post_id"));           
            post_id = Integer.parseInt(request.getParameter("post_id"));
            
            ForumReportPost rp = new ForumReportPost(report_post_id, user_report_id, report_post_reason, post_id, report_post_date);
            int count = ReportPostDAO.deleteReportPostByPostID2(rp);
            
            ForumPost p = new ForumPost(post_id, topic_id, post_title, post_content, userID, post_date, post_edit_date, post_status);
            int count2 = PostDAO.disablePost2(p);
                        
                    if (count > 0 && count2 > 0) {
                        p = PostDAO.getPostByID2(post_id);
                        int report_notification_id = 0;
                        int comment_id = 0;
                        String report_notification_status = "not read";
                        userID = p.getUser_id();                        
                        ForumReportNotification rn = new ForumReportNotification(report_notification_id, userID, report_notification_content, post_id, comment_id, report_notification_status);
                        int count3 = ReportNotificationDAO.newReportNotificationPost2(rn);
                        
                        response.sendRedirect(request.getContextPath()+"/ReportPost");
                    } else {
                        response.sendRedirect(request.getContextPath()+"/AdminForum");
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
