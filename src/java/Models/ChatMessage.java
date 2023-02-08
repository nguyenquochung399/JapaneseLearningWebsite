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
public class ChatMessage {
    private int messageID;
    private int userID;
    private String chatContent;
    private String time;
    private int sessionID;

    public ChatMessage(int messageID, int userID, String chatContent, String time, int sessionID) {
        this.messageID = messageID;
        this.userID = userID;
        this.chatContent = chatContent;
        this.time = time;
        this.sessionID = sessionID;
    }

    public ChatMessage() {
    }

    public int getMessageID() {
        return messageID;
    }

    public void setMessageID(int messageID) {
        this.messageID = messageID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getChatContent() {
        return chatContent;
    }

    public void setChatContent(String chatContent) {
        this.chatContent = chatContent;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public int getSessionID() {
        return sessionID;
    }

    public void setSessionID(int sessionID) {
        this.sessionID = sessionID;
    }
}
