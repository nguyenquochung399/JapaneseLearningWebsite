/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Forum;

import DAOs.Account.UserDAO;
import DAOs.Forum.CommentDAO;
import DAOs.Forum.PostDAO;
import DAOs.Forum.TopicDAO;
import DAOs.Material.MaterialDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.TagDAO;
import Models.ForumAllComment;
import Models.ForumPost;
import Models.ForumTopic;
import Models.Level;
import Models.Tag;
import Models.Type;
import Models.User;
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
public class Archive extends HttpServlet {

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
            out.println("<title>Servlet Archive</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Archive at " + request.getContextPath() + "</h1>");
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
        if (path.startsWith(request.getContextPath() + "/Archive")) {
            String[] s = path.split("/");
            String post_id = s[s.length - 1];
            int post_id2 = Integer.parseInt(post_id);
            ForumPost p = PostDAO.getPostByID2(post_id2);
            if (p == null) {
                response.sendRedirect(request.getContextPath() + "/Forum");
            } else {
                ForumTopic t = TopicDAO.getTopicByID2(p.getTopic_id());
                
                List<ForumTopic> rt = TopicDAO.getAllTopic2();
                
                List<ForumAllComment> a = CommentDAO.getAllCommentByPostID2(post_id2);
                UserDAO dao2 = new UserDAO();
                User u = dao2.getUserByID2(p.getUser_id());

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

                session.setAttribute("singlePost", p);
                session.setAttribute("userPost", u);
                session.setAttribute("singleTopic", t);
                session.setAttribute("allTopic", rt);
                session.setAttribute("allComment", a);
                request.getRequestDispatcher("/forum_archivePost.jsp").forward(request, response);
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
