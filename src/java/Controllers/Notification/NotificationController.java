/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Notification;

import DAOs.Account.UserDAO;
import DAOs.Material.MaterialDAO;
import DAOs.Notification.NotificationDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.TagDAO;
import Models.Level;
import Models.Notification;
import Models.Tag;
import Models.Type;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class NotificationController extends HttpServlet {

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
            out.println("<title>Servlet NotificationController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet NotificationController at " + request.getContextPath() + "</h1>");
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
        request.setCharacterEncoding("UTF-8");
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

        String path = request.getRequestURI();

        if (path.startsWith(request.getContextPath() + "/Notification")) {
            String[] s = path.split("/");
            //int notificationID = Integer.parseInt(request.getParameter("id"));
            int notificationID = Integer.parseInt(s[s.length - 1]);
            Notification n = NotificationDAO.getNotificationByID(notificationID);
            UserDAO userdao = new UserDAO();
            User u = userdao.getUserByID2(n.getUserID());

            HttpSession session = request.getSession();

            session.setAttribute("cNotification", n);
            session.setAttribute("nPoster", u);

            ArrayList<Notification> nList = NotificationDAO.getAllNotification();
            List<User> uList = userdao.getAllAccount();
            session.setAttribute("allNotification", nList);
            session.setAttribute("allUserList", uList);

            //response.sendRedirect(request.getContextPath() + "/notification_details.jsp");
            request.getRequestDispatcher("/notification_details.jsp").forward(request, response);
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
