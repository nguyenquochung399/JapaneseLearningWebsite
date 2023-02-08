/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Forum;

import DAOs.Forum.TopicDAO;
import Models.ForumTopic;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ACER
 */
public class DeleteTopic extends HttpServlet {

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
            out.println("<title>Servlet DeleteTopic</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet DeleteTopic at " + request.getContextPath() + "</h1>");
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

        int topic_id = 0;
        String topic_name = "";
        String topic_status = "active";

        String deleteTopic = "";
        deleteTopic = request.getParameter("deleteTopic");
        if (!deleteTopic.equals("")) {
            topic_id = Integer.parseInt(request.getParameter("topic_id"));

            int post_id = 0;
            String post_title = "";
            String post_content = "";
            int user_id = 0;
            String post_date = "";
            String post_status = "active";
            
            //ForumPost p = new ForumPost(post_id, topic_id, post_title, post_content, user_id, post_date, post_status);
            //int count = PostDAO.changeTopicPost(p);
            
            ForumTopic t = new ForumTopic(topic_id, topic_name, topic_status);
            int count2 = TopicDAO.deleteTopic2(t);
            
            //if (count > 0 && count2 > 0) {
            if (count2 > 0) {
                response.sendRedirect(request.getContextPath() + "/DisableTopic");
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
