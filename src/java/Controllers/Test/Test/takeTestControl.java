/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Test.Test;

import DAOs.Account.UserDAO;
import DAOs.Material.MaterialDAO;
import DAOs.Test.AnswerDAO;
import DAOs.Test.LevelDAO;
import DAOs.Test.QuestionDAO;
import DAOs.Test.ResultDAO;
import DAOs.Test.TagDAO;
import DAOs.Test.TestDAO;
import DAOs.Test.resultDetailDAO;
import Models.Answer;
import Models.AnswerOfQuestion;
import Models.Level;
import Models.Question;
import Models.Tag;
import Models.Test;
import Models.Type;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
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
public class takeTestControl extends HttpServlet {

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
//        try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet takeTestControl</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet takeTestControl at " + request.getContextPath() + "</h1>");
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

        
        HttpSession session = request.getSession();
        String levelID = session.getAttribute("levelID").toString();
        String tagID = session.getAttribute("tagID").toString();
        
        String type = "Thực hiện bài kiểm tra";

        //lay id cua test da chon 
        String TestID = request.getParameter("testID");

        //step: lấy tất cả Id của question trong test a
        QuestionDAO quesdao = new QuestionDAO();
        List<Question> QuestionOfTest = quesdao.getByTest(Integer.parseInt(TestID));
        
        //step: lấy câu hỏi từ list câu hỏi trong quiz
        List<String> list = new ArrayList<String>();
        for (Question o : QuestionOfTest) {
            list.add(String.valueOf(o.getQuestionID()));
        }

        //step: lấy thông tin bài test
        TestDAO testdao = new TestDAO();
        Test testunis = testdao.getTestByID(Integer.parseInt(TestID));
        String testname = "Bài kiểm tra - " +(new TagDAO().getTagByID(Integer.parseInt(tagID))).getDesc()+
                          (new LevelDAO().getLevelbyID(Integer.parseInt(levelID))).getLevelName()+" - "+testunis.getName();

        //step: lấy câu trả lời của từng câu hỏi
        List<AnswerOfQuestion> listAandQ = new ArrayList<AnswerOfQuestion>();
        for (String o : list) {
            Question ques = quesdao.getQuestionByID(Integer.parseInt(o));
            String question = ques.getQuestion();

            AnswerDAO ans = new AnswerDAO();
            List<Answer> AoQ = ans.getAnswerByQuestion(Integer.parseInt(o));
            List<String> listans = new ArrayList<String>();

            Integer[] arr = new Integer[AoQ.size()];
            for (int i = 0; i < AoQ.size(); i++) {
                arr[i] = i;
            }
            Collections.shuffle(Arrays.asList(arr));
            for (Integer i : arr) {
                listans.add(AoQ.get(i).getAnswer());
            }

            listAandQ.add(new AnswerOfQuestion(Integer.parseInt(o), question, listans));
        }

        //lấy thời gian bắt đầu làm bài
        //khai báo đối tượng current thuộc class LocalDateTime
        LocalDateTime current = LocalDateTime.now();
        //sử dụng class DateTimeFormatter để định dạng ngày giờ theo kiểu pattern
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        //sử dụng phương thức format() để định dạng ngày giờ hiện tại rồi gán cho chuỗi formatted
        String formatted = LocalDateTime.now().format(formatter);

        MaterialDAO materialdao = new MaterialDAO();
        List<Type> listT = materialdao.getAllType();
        List<Level> listL = materialdao.getAllLevel();

        request.setAttribute("listT", listT);
        request.setAttribute("listL", listL);

        TagDAO tagdao = new TagDAO();
        List<Tag> listtag = tagdao.getAllTag();

        LevelDAO leveldao = new LevelDAO();
        List<Level> listlevel = leveldao.getAllLevel();

        request.setAttribute("listtag", listtag);
        request.setAttribute("listlevel", listlevel);

        //step: show tất cả câu hỏi của bài test kèm câu trả lời
        request.setAttribute("listAandQ", listAandQ);
        request.setAttribute("testname", testname);
        request.setAttribute("type", type);

        session.setAttribute("TestID", TestID);
        session.setAttribute("starttime", formatted);
        
        request.setAttribute("levelID", levelID);
        request.setAttribute("tagID", tagID);
        
        request.getRequestDispatcher("Test_multichoice_takeTest.jsp").forward(request, response);

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

        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();

        //lay du lieu de tao ket qua
        String TestID = session.getAttribute("TestID").toString();

        User u = (User) session.getAttribute("acc");
        int userID = u.getUserID();

        String starttime = session.getAttribute("starttime").toString();

        int trueans = 0;

        //step: lấy tất cả Id của question trong test a
        QuestionDAO quesdao = new QuestionDAO();
        List<Question> QuestionOfTest = quesdao.getByTest(Integer.parseInt(TestID));
        
        //step: lấy câu hỏi từ list câu hỏi trong quiz
        List<String> list = new ArrayList<String>();
        for (Question o : QuestionOfTest) {
            list.add(String.valueOf(o.getQuestionID()));
        }

        ResultDAO resultDAO = new ResultDAO();

        resultDetailDAO detailDAO = new resultDetailDAO();

        //lấy thời gian kết thúc bài làm
        //khai báo đối tượng current thuộc class LocalDateTime
        LocalDateTime current = LocalDateTime.now();
        //sử dụng class DateTimeFormatter để định dạng ngày giờ theo kiểu pattern
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        //sử dụng phương thức format() để định dạng ngày giờ hiện tại rồi gán cho chuỗi formatted
        String endtime = current.format(formatter);

        int lastResult = 0;
        List<String> samewithans = new ArrayList<String>();

        for (String o : list) {
            String choice = request.getParameter(o);

            if (choice == null) {
                samewithans.add("answer");
            } else {
                AnswerDAO ans = new AnswerDAO();
                List<Answer> AoQ = ans.getAnswerByQuestion(Integer.parseInt(o));
                for (Answer z : AoQ) {
                    if (choice.equals(z.getAnswer())) {
                        if (z.getIsCorrect() == 1) {
                            trueans+=1;
                        }
                        samewithans.add(z.getAnswer());
                    }
                    
                }
            }

        }

        resultDAO.insertResult(userID, Integer.parseInt(TestID), starttime, endtime, trueans, trueans);
        
        lastResult = (resultDAO.getlastResults()).getResultID();

        for (String o : list) {
            detailDAO.insertResultDetail(lastResult, Integer.parseInt(o),samewithans.get(list.indexOf(o)));
        }

        session.setAttribute("newresultID", lastResult);

        response.sendRedirect("showResultControl");
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
