/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Chat;

import DAOs.Chat.ChatSessionDAO;
import DAOs.Material.MaterialDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.TagDAO;
import Models.ChatSession;
import Models.Level;
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
public class ChatInitController extends HttpServlet {

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

        HttpSession session = request.getSession();
        // Get attributes value
        User cUser = (User) session.getAttribute("acc");
        int cUID = -1;

        if (cUser != null) {
            cUID = cUser.getUserID();
            int sessionID = -1;

            while (sessionID == -1) {
                // Get user's latest opening chat session
                ArrayList<ChatSession> csList = ChatSessionDAO.getAllChatSession();
                for (ChatSession cs : csList) {
                    int tmpUID = cs.getUserID();
                    int tmpStatus = cs.getStatus();

                    if (tmpUID == cUID && tmpStatus == 0) {
                        sessionID = cs.getSessionID();
                        break;
                    }
                }

                if (sessionID == -1) {
                    ChatSession ncs = new ChatSession();
                    ncs.setUserID(cUID);
                    ncs.setStatus(0);

                    ChatSessionDAO.addNewChatSession(ncs);
                }
            }
            request.setAttribute("chatUID", cUID);
            request.getRequestDispatcher("chat_user.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/account_login.jsp");
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
