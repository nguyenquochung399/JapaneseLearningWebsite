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
import java.text.SimpleDateFormat;
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
public class ChatContentController extends HttpServlet {

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
            HttpSession session = request.getSession();
            UserDAO userdao = new UserDAO();

            User cUser;
            int cUserID;
            //String username = null; UNUSED
            int sessionID = -1;
            //String initContent = ""; UNUSED
            String altInitContent = "";
            Date prevDate;
            Date currDate;
            Date nextDate;
            long prevOffset;
            long nextOffset;
            long offsetLimit = 5 * 60 * 1000; // 5 minutes
            SimpleDateFormat fmt = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

            try {
                cUser = (User) session.getAttribute("acc");
                //username = cUser.getUsername(); UNUSED
                cUserID = cUser.getUserID();
                while (sessionID == -1) {
                    // Get user's latest opening chat session
                    ArrayList<ChatSession> csList = ChatSessionDAO.getAllChatSession();
                    for (ChatSession cs : csList) {
                        int tmpUID = cs.getUserID();
                        int tmpStatus = cs.getStatus();

                        if (tmpUID == cUser.getUserID() && tmpStatus == 0) {
                            sessionID = cs.getSessionID();
                            break;
                        }
                    }

                    if (sessionID != -1) {
                        ArrayList<ChatMessage> tmpCMList = ChatMessageDAO.getAllChatMessage();
                        ArrayList<ChatMessage> cmList = new ArrayList<>();

                        // only add message to list if from current session
                        for (int i = 0; i < tmpCMList.size(); i++) {
                            if (tmpCMList.get(i).getSessionID() == sessionID) {
                                cmList.add(tmpCMList.get(i));
                            }
                        }
                        
                        for (int i = 0; i < cmList.size(); i++) {
                            String mTime = cmList.get(i).getTime();
                            int mUID = cmList.get(i).getUserID();
                            String mUser = userdao.getUserByID2(mUID).getUsername();
                            String tmpMessage = cmList.get(i).getChatContent().replace("\r\n", "<br>");
                            //initContent += "(" + mTime + ") " + mUser + ": " + tmpMessage + "<br>"; UNUSED

                            currDate = fmt.parse(cmList.get(i).getTime());

                            if (i > 0 && i < cmList.size() - 1) {
                                // calculate offset time from PREVIOUS message
                                prevDate = fmt.parse(cmList.get(i - 1).getTime());
                                prevOffset = currDate.getTime() - prevDate.getTime();

                                // calculate offset time from NEXT message
                                nextDate = fmt.parse(cmList.get(i + 1).getTime());
                                nextOffset = nextDate.getTime() - currDate.getTime();

                                // if bubble is NOT from SAME USER as BOTH PREVIOUS + BOTTOM MESSAGE
                                if ((cmList.get(i).getUserID() != cmList.get(i + 1).getUserID()) && (cmList.get(i).getUserID() != cmList.get(i - 1).getUserID())) {
                                    // set as SOLO
                                    if (cUserID == mUID) {
                                        // move chat bubble to the right
                                        altInitContent += "<div><div class='chat-bubble-right-label'>Bạn - " + mTime + "</div><div class='chat-bubble-right-container'><div class='chat-bubble-right' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                    } else {
                                        altInitContent += "<div><div class='chat-bubble-left-label'>" + mUser + " (Quản trị viên) - " + mTime + "</div><div class='chat-bubble-left-container'><div class='chat-bubble-left' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                    }
                                } else {
                                    // if bubble is from SAME USER && is WITHIN TIME LIMIT as PREVIOUS MESSAGE
                                    if ((cmList.get(i).getUserID() == cmList.get(i - 1).getUserID()) && (prevOffset <= offsetLimit)) {
                                        // if bubble is from SAME USER && is WITHIN TIME LIMIT as NEXT MESSAGE
                                        if ((cmList.get(i).getUserID() == cmList.get(i + 1).getUserID()) && (nextOffset <= offsetLimit)) {
                                            // set as MID
                                            if (cUserID == mUID) {
                                                // move chat bubble to the right
                                                altInitContent += "<div><div class='chat-bubble-right-container'><div class='chat-bubble-right-mid' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            } else {
                                                altInitContent += "<div><div class='chat-bubble-left-container'><div class='chat-bubble-left-mid' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            }
                                        } else {
                                            // set as BOTTOM
                                            if (cUserID == mUID) {
                                                // move chat bubble to the right
                                                altInitContent += "<div><div class='chat-bubble-right-container'><div class='chat-bubble-right-bottom' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            } else {
                                                altInitContent += "<div><div class='chat-bubble-left-container'><div class='chat-bubble-left-bottom' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            }
                                        }
                                    } else {
                                        // if bubble is from SAME USER && is WITHIN TIME LIMIT as NEXT MESSAGE
                                        if ((cmList.get(i).getUserID() == cmList.get(i + 1).getUserID()) && (nextOffset <= offsetLimit)) {
                                            // set as TOP
                                            if (cUserID == mUID) {
                                                // move chat bubble to the right
                                                altInitContent += "<div><div class='chat-bubble-right-label'>Bạn - " + mTime + "</div><div class='chat-bubble-right-container'><div class='chat-bubble-right-top' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            } else {
                                                altInitContent += "<div><div class='chat-bubble-left-label'>" + mUser + " (Quản trị viên) - " + mTime + "</div><div class='chat-bubble-left-container'><div class='chat-bubble-left-top' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            }
                                        } else {
                                            // set as SOLO
                                            if (cUserID == mUID) {
                                                // move chat bubble to the right
                                                altInitContent += "<div><div class='chat-bubble-right-label'>Bạn - " + mTime + "</div><div class='chat-bubble-right-container'><div class='chat-bubble-right' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            } else {
                                                altInitContent += "<div><div class='chat-bubble-left-label'>" + mUser + " (Quản trị viên) - " + mTime + "</div><div class='chat-bubble-left-container'><div class='chat-bubble-left' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            }
                                        }
                                    }
                                }
                            } else {
                                // if bubble is FIRST MESSAGE
                                if (i == 0) {
                                    // if bubble is the ONLY MESSAGE
                                    if (i + 1 == cmList.size()) {
                                        // set as SOLO
                                        if (cUserID == mUID) {
                                            // move chat bubble to the right
                                            altInitContent += "<div><div class='chat-bubble-right-label'>Bạn - " + mTime + "</div><div class='chat-bubble-right-container'><div class='chat-bubble-right' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                        } else {
                                            altInitContent += "<div><div class='chat-bubble-left-label'>" + mUser + " (Quản trị viên) - " + mTime + "</div><div class='chat-bubble-left-container'><div class='chat-bubble-left' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                        }
                                    } else {
                                        nextDate = fmt.parse(cmList.get(i + 1).getTime());
                                        nextOffset = nextDate.getTime() - currDate.getTime();

                                        // if bubble is from SAME USER && is WITHIN TIME LIMIT as NEXT MESSAGE
                                        if ((cmList.get(i).getUserID() == cmList.get(i + 1).getUserID()) && (nextOffset <= offsetLimit)) {
                                            // set as TOP
                                            if (cUserID == mUID) {
                                                // move chat bubble to the right
                                                altInitContent += "<div><div class='chat-bubble-right-label'>Bạn - " + mTime + "</div><div class='chat-bubble-right-container'><div class='chat-bubble-right-top' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            } else {
                                                altInitContent += "<div><div class='chat-bubble-left-label'>" + mUser + " (Quản trị viên) - " + mTime + "</div><div class='chat-bubble-left-container'><div class='chat-bubble-left-top' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            }
                                        } else {
                                            // set as SOLO
                                            if (cUserID == mUID) {
                                                // move chat bubble to the right
                                                altInitContent += "<div><div class='chat-bubble-right-label'>Bạn - " + mTime + "</div><div class='chat-bubble-right-container'><div class='chat-bubble-right' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            } else {
                                                altInitContent += "<div><div class='chat-bubble-left-label'>" + mUser + " (Quản trị viên) - " + mTime + "</div><div class='chat-bubble-left-container'><div class='chat-bubble-left' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                            }
                                        }
                                    }
                                }
                                // if bubble is LAST MESSAGE
                                if (i == cmList.size() - 1) {
                                    prevDate = fmt.parse(cmList.get(i - 1).getTime());
                                    prevOffset = currDate.getTime() - prevDate.getTime();

                                    // if bubble is from SAME USER && is WITHIN TIME LIMIT as PREVIOUS MESSAGE
                                    if ((cmList.get(i).getUserID() == cmList.get(i - 1).getUserID()) && (prevOffset <= offsetLimit)) {
                                        // set as BOTTOM
                                        if (cUserID == mUID) {
                                            // move chat bubble to the right
                                            altInitContent += "<div><div class='chat-bubble-right-container'><div class='chat-bubble-right-bottom' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                        } else {
                                            altInitContent += "<div><div class='chat-bubble-left-container'><div class='chat-bubble-left-bottom' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                        }
                                    } else {
                                        // set as SOLO
                                        if (cUserID == mUID) {
                                            // move chat bubble to the right
                                            altInitContent += "<div><div class='chat-bubble-right-label'>Bạn - " + mTime + "</div><div class='chat-bubble-right-container'><div class='chat-bubble-right' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                        } else {
                                            altInitContent += "<div><div class='chat-bubble-left-label'>" + mUser + " (Quản trị viên) - " + mTime + "</div><div class='chat-bubble-left-container'><div class='chat-bubble-left' title='Gửi vào " + mTime + "'>" + tmpMessage + "</div></div></div>";
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            } catch (Exception e) {

            }

            out.println(altInitContent);
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
