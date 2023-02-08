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
import java.nio.charset.StandardCharsets;
import java.sql.ResultSet;
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
public class SearchPost extends HttpServlet {

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
            out.println("<title>Servlet SearchPost</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet SearchPost at " + request.getContextPath() + "</h1>");
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
        if (path.endsWith("/SearchPost/")) {
            response.sendRedirect(request.getContextPath() + "/Forum");
        } else {
            if (path.startsWith(request.getContextPath() + "/SearchPost/")) {
                path = java.net.URLDecoder.decode(path, StandardCharsets.UTF_8.name());
                String[] s = path.split("/");
                String search = s[s.length - 1];
                search = search.replaceAll(" +", " ");
                search = search.trim();

                //ResultSet rs = PostDAO.getAllPostBySearch(search);
                //ResultSet rs = PostDAO.getAllPostBySearchWithCommentCount(search);
                List<ForumAllPostWithComment> rs;
                rs = PostDAO.getAllPostBySearchWithCommentCount2(search);
                //ResultSet t = TopicDAO.getAllTopic();
                List<ForumTopic> t = TopicDAO.getAllTopic2();

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

                session.setAttribute("allSearchPost", rs);
                session.setAttribute("allTopic", t);
                request.getRequestDispatcher("/forum_postBySearch.jsp").forward(request, response);

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
