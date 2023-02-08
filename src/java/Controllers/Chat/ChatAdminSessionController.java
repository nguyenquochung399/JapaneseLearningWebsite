/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controllers.Chat;

import DAOs.Account.UserDAO;
import DAOs.Chat.ChatMessageDAO;
import DAOs.Chat.ChatSessionDAO;
import Models.ChatMessage;
import Models.ChatSession;
import Models.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.Normalizer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Admin
 */
public class ChatAdminSessionController extends HttpServlet {

    private static String removeAccent(String str) {
        str = Normalizer.normalize(str, Normalizer.Form.NFD);
        str = str.replaceAll("[\\p{InCombiningDiacriticalMarks}]", "");
        return str;
    }

    private static ArrayList<ChatSession> sortSessionByLastMessage(ArrayList<ChatSession> arr) {
        SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        int n = arr.size();
        ArrayList<ChatSession> beforeArr = arr;

        // remove session without message
        for (int i = 0; i < n; i++) {
            ChatMessage tmpCM = ChatMessageDAO.getLastChatMessageBySessionID(arr.get(i).getSessionID());

            if (tmpCM == null) {
                arr.remove(i);
                i = i - 1;
                n = n - 1;
            }
        }

        // bubble sort
        for (int i = 0; i < n - 1; i++) {
            for (int j = 0; j < n - i - 1; j++) {
                ChatMessage tmpCM1 = ChatMessageDAO.getLastChatMessageBySessionID(arr.get(j).getSessionID());
                ChatMessage tmpCM2 = ChatMessageDAO.getLastChatMessageBySessionID(arr.get(j + 1).getSessionID());

                try {
                    if (fmt.parse(tmpCM1.getTime()).before(fmt.parse(tmpCM2.getTime()))) {
                        // swap arr[j+1] and arr[j]
                        ChatSession tmpSwap = arr.get(j);
                        arr.set(j, arr.get(j + 1));
                        arr.set(j + 1, tmpSwap);
                    }
                } catch (ParseException ex) {
                    return beforeArr;
                }
            }
        }

        return arr;
    }

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
            ArrayList<ChatSession> csList = ChatSessionDAO.getAllChatSession();
            HttpSession session = request.getSession();
            User cAdmin = (User) session.getAttribute("acc");
            csList = sortSessionByLastMessage(csList);
            String searchContent = request.getParameter("searchContent");
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
            long SECOND = 1000;
            long MINUTE = 60 * SECOND;
            long HOUR = 60 * MINUTE;
            long DAY = 24 * HOUR;
            long WEEK = 7 * DAY;
            long MONTH = 30 * DAY;
            long YEAR = 12 * MONTH;
            boolean isInitial = true;

            for (ChatSession cs : csList) {
                UserDAO userdao = new UserDAO();
                User u = userdao.getUserByID2(cs.getUserID());
                if (cs.getStatus() == 0 && u.getUserID() != cAdmin.getUserID()) {
                    int sID = cs.getSessionID();
                    int uID = u.getUserID();
                    String uName = u.getUsername();
                    String uAvatar = u.getAvatar();
                    ChatMessage lastCM = ChatMessageDAO.getLastChatMessageBySessionID(sID);
                    String lmContent = lastCM.getChatContent();
                    String lastMessage;
                    if (lastCM.getUserID() == cAdmin.getUserID()) {
                        lastMessage = "Bạn : " + lmContent;
                    } else {
                        lastMessage = lmContent;
                    }

                    Date lmTime = new Date();
                    Date currTime = new Date();

                    try {
                        lmTime = fmt.parse(lastCM.getTime());
                    } catch (ParseException ex) {
                    }
                    LocalDateTime ldtNow = LocalDateTime.now();
                    String currDate = dtf.format(ldtNow);

                    try {
                        currTime = fmt.parse(currDate);
                    } catch (ParseException ex) {
                    }
                    long offset = currTime.getTime() - lmTime.getTime();
                    String offsetStr;

                    if (offset < MINUTE) {
                        // SECOND
                        offsetStr = String.valueOf(offset / SECOND) + " giây trước";
                    } else if (offset < HOUR) {
                        // MINUTE
                        offsetStr = String.valueOf(offset / MINUTE) + " phút trước";
                    } else if (offset < DAY) {
                        // HOUR
                        offsetStr = String.valueOf(offset / HOUR) + " giờ trước";
                    } else if (offset < WEEK) {
                        // DAY
                        offsetStr = String.valueOf(offset / DAY) + " ngày trước";
                    } else if (offset < MONTH) {
                        // WEEK
                        offsetStr = String.valueOf(offset / WEEK) + " tuần trước";
                    } else if (offset < YEAR) {
                        // MONTH
                        offsetStr = String.valueOf(offset / MONTH) + " tháng trước";
                    } else {
                        // YEAR
                        offsetStr = String.valueOf(offset / YEAR) + " năm trước";
                    }

                    String tmpSearchContent = removeAccent(searchContent.toLowerCase());
                    String tmpUName = removeAccent(uName.toLowerCase());

                    if (searchContent.equals("")) {
                        if (isInitial) {
                            // First session in the list
                            out.println("<a href='javascript:void(0);' onclick='loadMessage(" + uID + ", " + sID + ")' class='text-decor-none' id='init-session'>");
                            out.println("<div class='user-list-item' id='user-session-" + sID + "'>");
                            out.println("<div class='row uli-row'>");
                            out.println("<div class='col-md-2 uli-ava-container'>");
                            if (!uAvatar.equals("")) {
                                out.println("<img src='" + request.getContextPath() + "/" + uAvatar + "' alt='' class='uli-ava'/>");
                            } else {
                                out.println("<img src='" + request.getContextPath() + "/chat/img/default_avatar.png' alt='' class='uli-ava'/>");
                            }
                            out.println("</div>");
                            out.println("<div class='col-md-8 uli-info-container'><div class='uli-date'></div><div class='uli-name'>" + uName + "</div><div class='uli-last-message'>" + lastMessage + "</div><div class='uli-last-message-time'>" + offsetStr + "</div></div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</a>");

                            isInitial = false;
                        } else {
                            // Other sessions in the list
                            out.println("<a href='javascript:void(0);' onclick='loadMessage(" + uID + ", " + sID + ")' class='text-decor-none'>");
                            out.println("<div class='user-list-item' id='user-session-" + sID + "'>");
                            out.println("<div class='row uli-row'>");
                            out.println("<div class='col-md-2 uli-ava-container'>");
                            if (!uAvatar.equals("")) {
                                out.println("<img src='" + request.getContextPath() + "/" + uAvatar + "' alt='' class='uli-ava'/>");
                            } else {
                                out.println("<img src='" + request.getContextPath() + "/chat/img/default_avatar.png' alt='' class='uli-ava'/>");
                            }
                            out.println("</div>");
                            out.println("<div class='col-md-8 uli-info-container'><div class='uli-date'>" + lmTime + "</div><div class='uli-name'>" + uName + "</div><div class='uli-last-message'>" + lastMessage + "</div><div class='uli-last-message-time'>" + offsetStr + "</div></div>");
                            out.println("</div>");
                            out.println("</div>");
                            out.println("</a>");
                        }
                    } else {
                        if (tmpUName.contains(tmpSearchContent)) {
                            if (isInitial) {
                                // First session in the list
                                out.println("<a href='javascript:void(0);' onclick='loadMessage(" + uID + ", " + sID + ")' class='text-decor-none' id='init-session'>");
                                out.println("<div class='user-list-item' id='user-session-" + sID + "'>");
                                out.println("<div class='row uli-row'>");
                                out.println("<div class='col-md-2 uli-ava-container'>");
                                if (!uAvatar.equals("")) {
                                    out.println("<img src='" + request.getContextPath() + "/" + uAvatar + "' alt='' class='uli-ava'/>");
                                } else {
                                    out.println("<img src='" + request.getContextPath() + "/chat/img/default_avatar.png' alt='' class='uli-ava'/>");
                                }
                                out.println("</div>");
                                out.println("<div class='col-md-8 uli-info-container'><div class='uli-date'>" + lmTime + "</div><div class='uli-name'>" + uName + "</div><div class='uli-last-message'>" + lastMessage + "</div><div class='uli-last-message-time'>" + offsetStr + "</div></div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</a>");

                                isInitial = false;
                            } else {
                                // Other sessions in the list
                                out.println("<a href='javascript:void(0);' onclick='loadMessage(" + uID + ", " + sID + ")' class='text-decor-none'>");
                                out.println("<div class='user-list-item' id='user-session-" + sID + "'>");
                                out.println("<div class='row uli-row'>");
                                out.println("<div class='col-md-2 uli-ava-container'>");
                                if (!uAvatar.equals("")) {
                                    out.println("<img src='" + request.getContextPath() + "/" + uAvatar + "' alt='' class='uli-ava'/>");
                                } else {
                                    out.println("<img src='" + request.getContextPath() + "/chat/img/default_avatar.png' alt='' class='uli-ava'/>");
                                }
                                out.println("</div>");
                                out.println("<div class='col-md-8 uli-info-container'><div class='uli-name'>" + uName + "</div><div class='uli-last-message'>" + lastMessage + "</div><div class='uli-last-message-time'>" + offsetStr + "</div></div>");
                                out.println("</div>");
                                out.println("</div>");
                                out.println("</a>");
                            }
                        }
                    }
                }
            }
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
