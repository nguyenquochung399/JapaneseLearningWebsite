/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Forum;

import DAOs.Forum.PostDAO;
import DAOs.Forum.ReportNotificationDAO;
import DAOs.Forum.TopicDAO;
import DAOs.Material.MaterialDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.TagDAO;
import Models.ForumAllPostWithComment;
import Models.ForumReportNotification;
import Models.ForumTopic;
import Models.Level;
import Models.Tag;
import Models.Type;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ACER
 */
public class Forum extends HttpServlet {

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
            out.println("<title>Servlet Forum</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Forum at " + request.getContextPath() + "</h1>");
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
        //ResultSet rs2 = PostDAO.getNumberPost();
        int totalPage = 1;
        int rs2 = PostDAO.getNumberPost2();
        totalPage = rs2;
        
        if (totalPage <= 10) {
            totalPage = 1;
        } else {
            totalPage = totalPage / 10 + 1;
        }

        String path = request.getRequestURI();
        if (path.endsWith("/Forum")) {
            int offset = 0;
            //ResultSet rs = PostDAO.getAllPostByPage(offset);
            //ResultSet rs = PostDAO.getAllPostByPageWithCommentCount(offset);
            List<ForumAllPostWithComment> f;
            f = PostDAO.getAllPostByPageWithCommentCount2(offset);
            //ResultSet t = TopicDAO.getAllTopic();
            List<ForumTopic> t = TopicDAO.getAllTopic2();
            if (f == null) {
                request.getRequestDispatcher("home.jsp").forward(request, response);
            } else {

                HttpSession session = request.getSession();

                // document
                String typeID = request.getParameter("typeID");
                String levelID = request.getParameter("levelID");

                MaterialDAO dao = new MaterialDAO();
                List<Type> listT = dao.getAllType();
                List<Level> listL = dao.getAllLevel();

                request.setAttribute("listT", listT);
                request.setAttribute("listL", listL);
                // end document

                // test
                TagDAO tagdao = new TagDAO();
                List<Tag> listtag = tagdao.getAllTag();

                LevelDAO leveldao = new LevelDAO();
                List<Level> listlevel = leveldao.getAllLevel();

                request.setAttribute("listtag", listtag);
                request.setAttribute("listlevel", listlevel);
                // end test

                User u = (User) request.getSession().getAttribute("acc");
                if (u != null) {
                    int userID = u.getUserID();
                    //ResultSet notReadNotification = ReportNotificationDAO.getAllReportNotificationByUserIDNotRead(userID);
                    List<ForumReportNotification> notReadNotification = ReportNotificationDAO.getAllReportNotificationByUserIDNotRead2(userID);
                    session.setAttribute("notReadNotification", notReadNotification);
                }

                session.setAttribute("allTopic", t);
                session.setAttribute("totalPage", totalPage);
                session.setAttribute("currentUrl", path);
                //session.setAttribute("allPost", rs);
                session.setAttribute("allPost", f);
                request.getRequestDispatcher("forum_forum.jsp").forward(request, response);
            }
        } else {
            if (path.startsWith(request.getContextPath() + "/Forum")) {
                String[] s = path.split("/");
                String offset = s[s.length - 1];
                int offset2 = Integer.parseInt(offset);
                if (offset2 <= 1 || offset2 > totalPage) {
                    response.sendRedirect(request.getContextPath() + "/Forum");
                } else {
                    offset2 = (offset2 - 1) * 10;
                    //ResultSet rs = PostDAO.getAllPostByPage(offset2);
                    //ResultSet rs = PostDAO.getAllPostByPageWithCommentCount(offset2);
                    List<ForumAllPostWithComment> f;
                    f = PostDAO.getAllPostByPageWithCommentCount2(offset2);
                    if (f == null) {
                        request.getRequestDispatcher("home.jsp").forward(request, response);
                    } else {

                        HttpSession session = request.getSession();
                        // document
                        String typeID = request.getParameter("typeID");
                        String levelID = request.getParameter("levelID");

                        MaterialDAO dao = new MaterialDAO();
                        List<Type> listT = dao.getAllType();
                        List<Level> listL = dao.getAllLevel();

                        request.setAttribute("listT", listT);
                        request.setAttribute("listL", listL);
                        // end document

                        session.setAttribute("totalPage", totalPage);
                        session.setAttribute("currentUrl", path);
                        session.setAttribute("allPost", f);
                        request.getRequestDispatcher("/forum_forum.jsp").forward(request, response);
                    }
                }
            } else {
                response.sendRedirect(request.getContextPath() + "/Forum");
            }
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
        processRequest(request, response);
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
