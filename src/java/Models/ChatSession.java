/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author ACER
 */
public class ChatSession {

    private int sessionID;
    private int userID;
    private int status; // 0 is open, 1 is closed

    public ChatSession(int sessionID, int userID, int status) {
        this.sessionID = sessionID;
        this.userID = userID;
        this.status = status;
    }

    public ChatSession() {
    }

    public int getSessionID() {
        return sessionID;
    }

    public void setSessionID(int sessionID) {
        this.sessionID = sessionID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
