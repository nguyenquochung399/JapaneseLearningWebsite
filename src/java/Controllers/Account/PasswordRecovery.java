/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Account;

import DAOs.Account.CodeDAO;
import DAOs.Account.UserDAO;
import Models.Code;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class PasswordRecovery extends HttpServlet {

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
            out.println("<title>Servlet PasswordRecovery</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PasswordRecovery at " + request.getContextPath() + "</h1>");
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
        try (PrintWriter out = response.getWriter()) {
            request.setCharacterEncoding("UTF-8");
            String recoverEmail = request.getParameter("recoverEmail");

            HttpSession session = request.getSession();
            session.setAttribute("recoverEmail", recoverEmail);

            // Get User
            UserDAO userdao = new UserDAO();
            User u = userdao.getUserByEmail(recoverEmail);

            if (u != null) {

                // Set Random Code
                String codeRandom = getRandom();

                // Set Expiry Date
                DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
                LocalDateTime expDate = LocalDateTime.now().plusMinutes(10);
                String expDateStr = dtf.format(expDate);

                // Find if user already has a Code
                Code checkCode = CodeDAO.getCodeByUID(u.getUserID());
                if (checkCode != null) {
                    // Set Code Object
                    Code tmpCode = new Code();
                    tmpCode.setCodeID(checkCode.getCodeID());
                    tmpCode.setCode(codeRandom);
                    tmpCode.setExpiryDate(expDateStr);
                    tmpCode.setUserID(u.getUserID());

                    // Edit Existing Code
                    CodeDAO.editCode(tmpCode);
                } else {
                    // Set Code Object
                    Code tmpCode = new Code();
                    tmpCode.setCode(codeRandom);
                    tmpCode.setExpiryDate(expDateStr);
                    tmpCode.setUserID(u.getUserID());

                    // Add New Code
                    CodeDAO.addNewCode(tmpCode);
                }

                // Send Email
                sendEmail(recoverEmail, codeRandom);
                // Go to validate site
                //request.getRequestDispatcher("account_recovery_validate.jsp").forward(request, response);
                //response.sendRedirect(request.getContextPath() + "/account_recovery_validate.jsp");
                //out.println("<div class='w-100 text-md-center success' id='no-email-msg'>Đang chuyển hướng, vui lòng đợi...</div>");
            } else {
                out.println("<div class='w-100 text-md-center warning' id='no-email-msg'>Email không có trong hệ thống, vui lòng thử lại!</div>");
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

    private String getRandom() {
        Random rand = new Random();
        int number = rand.nextInt(999999);
        return String.format("%06d", number);
    }

    private void sendEmail(String toMail, String code) {

        String toEmail = toMail; // email user
        String fromEmail = "learn.jpdweb@gmail.com"; // email jpd admin, pass learnjpdweb1234
        String password = "ufmfdjxxizgqhgls"; // this is generated app password, not mail password

        try {
            Properties pr = new Properties();
            pr.setProperty("mail.smtp.host", "smtp.gmail.com");
            pr.setProperty("mail.smtp.port", "587");
            pr.setProperty("mail.smtp.auth", "true");
            pr.setProperty("mail.smtp.starttls.enable", "true");
            pr.put("mail.smtp.socketFactory.port", "587");
            pr.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");

            //get session to authenticate the host email address and password
            Session session = Session.getInstance(pr, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            });

            //set email message details
            MimeMessage mess = new MimeMessage(session);

            //set from email address
            mess.setFrom(new InternetAddress(fromEmail));
            //set to email address or destination email address
            mess.setRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));

            //set email subject
            String title = "[JPD] Khôi phục Tài khoản JPD";
            mess.setSubject(title, "UTF-8");

            //set message text
            String message = "Chúng tôi đã nhận được yêu cầu thay đổi mật khẩu của tài khoản <strong>" + toMail + "</strong><br>Vui lòng sử dụng mã OTP này để thay đổi mật khẩu: <strong>" + code + "</strong>";
            mess.setContent(message, "text/html;charset=utf-8");
            //send the message
            Transport.send(mess);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
