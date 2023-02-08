/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Chat;

import Connection.HikariCPDataSource;
import Models.ChatMessage;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.dbutils.DbUtils;

/**
 *
 * @author Admin
 */
public class ChatMessageDAO {

    public static ArrayList<ChatMessage> getAllChatMessage() {
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            ArrayList<ChatMessage> cmList;
            conn = HikariCPDataSource.getConnection();
            st = conn.prepareStatement("SELECT messageID, userID, chatContent, date_format(time,'%Y-%m-%d %H:%i:%S') as time, sessionID FROM `message` ORDER BY time ASC");
            rs = st.executeQuery();
            cmList = new ArrayList<>();
            while (rs.next()) {
                ChatMessage cm = new ChatMessage();
                cm.setMessageID(rs.getInt("messageID"));
                cm.setUserID(rs.getInt("userID"));
                cm.setChatContent(rs.getString("chatContent"));
                cm.setTime(rs.getString("time"));
                cm.setSessionID(rs.getInt("sessionID"));

                cmList.add(cm);
            }
            return cmList;
        } catch (SQLException ex) {
            Logger.getLogger(ChatMessageDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(st);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static ChatMessage getChatMessageByID(int message_id) {
        ChatMessage cMessage = null;
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareStatement("SELECT messageID, userID, chatContent, date_format(time,'%Y-%m-%d %H:%i:%S') as time, sessionID FROM `message`"
                        + " WHERE messageID = ?");
                st.setInt(1, message_id);
                ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    cMessage = new ChatMessage();

                    cMessage.setMessageID(message_id);
                    cMessage.setUserID(rs.getInt("userID"));
                    cMessage.setChatContent(rs.getString("chatContent"));
                    cMessage.setTime(rs.getString("time"));
                    cMessage.setSessionID(rs.getInt("sessionID"));
                }
                st.close();
                rs.close();
            }
            return cMessage;
        } catch (SQLException ex) {
            Logger.getLogger(ChatMessageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ChatMessage getLastChatMessageBySessionID(int session_id) {
        ChatMessage cMessage = null;
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareStatement("SELECT messageID, userID, chatContent, date_format(time,'%Y-%m-%d %H:%i:%S') as time, sessionID FROM `message` WHERE sessionID = ? ORDER BY time DESC LIMIT 1");
                st.setInt(1, session_id);
                ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    cMessage = new ChatMessage();

                    cMessage.setMessageID(rs.getInt("messageID"));
                    cMessage.setUserID(rs.getInt("userID"));
                    cMessage.setChatContent(rs.getString("chatContent"));
                    cMessage.setTime(rs.getString("time"));
                    cMessage.setSessionID(rs.getInt("sessionID"));
                }
                st.close();
                rs.close();
            }
            return cMessage;
        } catch (SQLException ex) {
            Logger.getLogger(ChatMessageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void addNewChatMessage(ChatMessage cm) {

        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareCall("INSERT INTO message"
                        + " (messageID, userID, chatContent, time, sessionID)"
                        + " VALUES (NULL, ?, ?, ?, ?);");

                st.setInt(1, cm.getUserID());
                st.setString(2, cm.getChatContent());
                st.setString(3, cm.getTime());
                st.setInt(4, cm.getSessionID());

                st.executeUpdate();

                st.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChatMessageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void editChatMessage(ChatMessage cm) {
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareCall("UPDATE message "
                        + "SET userID = ?, chatContent = ?, time = ?, sessionID = ?"
                        + "WHERE message.`messageID` = ?;");

                st.setInt(1, cm.getUserID());
                st.setString(2, cm.getChatContent());
                st.setString(3, cm.getTime());
                st.setInt(4, cm.getSessionID());
                st.setInt(5, cm.getMessageID());

                st.executeUpdate();

                st.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChatMessageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deleteChatMessage(ChatMessage cm) {
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareCall("DELETE FROM message "
                        + "WHERE message.`messageID` = ?;");

                st.setInt(1, cm.getMessageID());

                st.executeUpdate();

                st.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChatMessageDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
