/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.ResultDetail;

import DAOs.Account.UserDAO;
import DAOs.Test.AnswerDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.QuestionDAO;
import DAOs.Test.ResultDAO;
import DAOs.Test.TagDAO;
import DAOs.Test.TestDAO;
import DAOs.Test.resultDetailDAO;
import Models.Answer;
import Models.ChoiceAndTrueAns;
import Models.ChoiceDetail;
import Models.ChoiceOfUser;
import Models.Level;
import Models.Question;
import Models.Result;
import Models.ResultDetail;
import Models.Tag;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Saing
 */
public class viewResultDetailControl extends HttpServlet {

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
//        response.setContentType("text/html;charset=UTF-8");
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet viewResultDetailControl</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet viewResultDetailControl at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
//        }
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
//        processRequest(request, response);
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        String type = "Đáp án chi tiết";

        String resultID = request.getParameter("resultID");

        Result result = (new ResultDAO()).getResultbyID(Integer.parseInt(resultID));

        List<ResultDetail> detail = new resultDetailDAO().getbyResultID(Integer.parseInt(resultID));

        int TestID = (new TestDAO()).getTestByID(result.getTestID()).getTestID();

        //step: lấy tất cả Id của question trong test a
        QuestionDAO quesdao = new QuestionDAO();
        List<Question> QuestionOfTest = quesdao.getByTest(result.getTestID());
        
        //step: lấy câu hỏi từ list câu hỏi trong quiz
        List<String> list = new ArrayList<String>();
        for (Question o : QuestionOfTest) {
            list.add(String.valueOf(o.getQuestionID()));
        }

        //step: lấy câu trả lời của từng câu hỏi
        List<ChoiceAndTrueAns> CaT = new ArrayList<ChoiceAndTrueAns>();
        for (String o : list) {
            int isTrueans = 0;
            String choice = new resultDetailDAO().getbyQuesResult(Integer.parseInt(resultID), Integer.parseInt(o)).getAnswer();

            Question ques = quesdao.getQuestionByID(Integer.parseInt(o));
            String question = ques.getQuestion();
            
            AnswerDAO ans = new AnswerDAO();
            List<Answer> AoQ = ans.getAnswerByQuestion(Integer.parseInt(o));
            
            List<String> listans = new ArrayList<String>();
            for (Answer z : AoQ) {
                listans.add(z.getAnswer());
            }
            Answer trueans = ans.getAnswerByname(choice);
            if (trueans.getIsCorrect()==1) {
                isTrueans =1;
            }
            
            CaT.add(new ChoiceAndTrueAns(isTrueans, choice, Integer.parseInt(o), question, listans));
        }

        TagDAO tagdao = new TagDAO();
        List<Tag> listtag = tagdao.getAllTag();

        LevelDAO leveldao = new LevelDAO();
        List<Level> listlevel = leveldao.getAllLevel();

        request.setAttribute("listtag", listtag);
        request.setAttribute("listlevel", listlevel);

        request.setAttribute("type", type);

        //step5: show tất cả câu hỏi của bài test kèm câu trả lời
        request.setAttribute("listans", CaT);

        request.getRequestDispatcher("Test_viewResultDetail.jsp").forward(request, response);
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
