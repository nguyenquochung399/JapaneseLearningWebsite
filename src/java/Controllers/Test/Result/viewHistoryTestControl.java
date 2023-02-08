/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Result;

import DAOs.Account.UserDAO;
import DAOs.Material.MaterialDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.ResultDAO;
import DAOs.Test.TagDAO;
import DAOs.Test.TestDAO;
import Models.Level;
import Models.Result;
import Models.ResultUser;
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
 * @author Saing
 */
public class viewHistoryTestControl extends HttpServlet {

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

//        ResultDAO dao = new ResultDAO();
//        List<Result> listResult = dao.getResultByUser(userID);
////        List<ResultUser> list = new ArrayList<ResultUser>();
////
////        String username = u.getUsername();
////
////        for (Result o : listResult) {
////
////            TestDAO testDAO = new TestDAO();
////            String test = testDAO.getTestByID(o.getTestID()).getName();
////
////            list.add(new ResultUser(o.getResultID(), username, test, o.getTimeBigin(), o.getTimeExpire(), o.getScore(), o.getTrueQuestion()));
////        }
//
////        TagDAO tagdao = new TagDAO();
////        List<Tag> listtag = tagdao.getAllTag();
////
////        LevelDAO leveldao = new LevelDAO();
////        List<Level> listlevel = leveldao.getAllLevel();
////        request.setAttribute("listtag", listtag);
////        request.setAttribute("listlevel", listlevel);
//        //step2: load data to jsp
//        request.setAttribute("listResult", listResult);
//        request.getRequestDispatcher("account_profile.jsp").forward(request, response);
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
        HttpSession session = request.getSession();
//        String email = session.getAttribute("email").toString();
//        UserDAO userDAO = new UserDAO();
//        int UserID = userDAO.getUserByEmail(email).getUserID();
        User u = (User) session.getAttribute("acc");
        int userID = u.getUserID();

        ResultDAO dao = new ResultDAO();
        List<Result> listResult = dao.getResultByUser(userID);
        List<ResultUser> list = new ArrayList<ResultUser>();

        String username = u.getUsername();

        for (Result o : listResult) {

            String test = new TestDAO().getTestByID(o.getTestID()).getName();

            list.add(new ResultUser(o.getResultID(), username, test, o.getTimeBigin(), o.getTimeExpire(), o.getScore(), o.getTrueQuestion()));
        }

        TagDAO tagdao = new TagDAO();
        List<Tag> listtag = tagdao.getAllTag();

        LevelDAO leveldao = new LevelDAO();
        List<Level> listlevel = leveldao.getAllLevel();

        request.setAttribute("listtag", listtag);
        request.setAttribute("listlevel", listlevel);
        //step2: load data to jsp
        request.setAttribute("listResult", list);

        // document
        MaterialDAO daoo = new MaterialDAO();
        List<Type> listT = daoo.getAllType();
        List<Level> listL = daoo.getAllLevel();
        request.setAttribute("listT", listT);
        request.setAttribute("listL", listL);

        request.getRequestDispatcher("Test_HistroyTest.jsp").forward(request, response);
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
//        processRequest(request, response);

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
