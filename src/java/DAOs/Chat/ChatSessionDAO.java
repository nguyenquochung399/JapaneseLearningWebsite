/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Chat;

import Connection.HikariCPDataSource;
import Models.ChatSession;
import Models.ChatSession2;
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
public class ChatSessionDAO {

    public static ArrayList<ChatSession> getAllChatSession() {
        Connection conn = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        try {
            ArrayList<ChatSession> csList;
            conn = HikariCPDataSource.getConnection();
            st = conn.prepareStatement("SELECT sessionID, userID, status FROM `session` ORDER BY sessionID DESC");
            rs = st.executeQuery();
            csList = new ArrayList<>();
            while (rs.next()) {
                ChatSession cs = new ChatSession();
                cs.setSessionID(rs.getInt("sessionID"));
                cs.setUserID(rs.getInt("userID"));
                cs.setStatus(rs.getInt("status"));

                csList.add(cs);
            }
            return csList;
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(st);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static ArrayList<ChatSession2> getAllChatSessionOrderByLastMessage() {
        try {
            ArrayList<ChatSession2> cs2List;
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareStatement("SELECT sessionID, userID, status, messageID FROM (SELECT m.sessionID, ROW_NUMBER() OVER (PARTITION BY m.sessionID ORDER BY time DESC) as row_num, m.messageID, m.userID as senderID, m.chatContent, date_format(m.time,'%Y-%m-%d %H:%i:%S') as time, s.userID, s.status FROM `message` m JOIN `session` s ON m.sessionID = s.sessionID) as sm WHERE row_num = 1");
                ResultSet rs = st.executeQuery();
                cs2List = new ArrayList<>();
                while (rs.next()) {
                    ChatSession2 cs2 = new ChatSession2();
                    cs2.setSessionID(rs.getInt("sessionID"));
                    cs2.setUserID(rs.getInt("userID"));
                    cs2.setStatus(rs.getInt("status"));
                    cs2.setMessageID(rs.getInt("messageID"));

                    cs2List.add(cs2);
                }
                st.close();
                rs.close();
            }
            return cs2List;
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static ChatSession getChatSessionByID(int session_id) {
        ChatSession cSession = null;
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareStatement("SELECT sessionID, userID, status FROM session"
                        + " WHERE sessionID = ?");
                st.setInt(1, session_id);
                ResultSet rs = st.executeQuery();

                if (rs.next()) {
                    cSession = new ChatSession();

                    cSession.setSessionID(session_id);
                    cSession.setUserID(rs.getInt("userID"));
                    cSession.setStatus(rs.getInt("status"));
                }
                st.close();
                rs.close();
            }
            return cSession;
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void addNewChatSession(ChatSession cs) {
        Connection conn = null;
        PreparedStatement st = null;
        try {
            conn = HikariCPDataSource.getConnection();
            st = conn.prepareCall("INSERT INTO session"
                    + " (sessionID, userID, status)"
                    + " VALUES (NULL, ?, ?);");

            st.setInt(1, cs.getUserID());
            st.setInt(2, cs.getStatus());

            st.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(st);
            DbUtils.closeQuietly(conn);
        }
    }

    public static void editChatSession(ChatSession cs) {
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareCall("UPDATE session "
                        + "SET userID = ?, status = ?"
                        + "WHERE session.`sessionID` = ?;");

                st.setInt(1, cs.getUserID());
                st.setInt(2, cs.getStatus());
                st.setInt(3, cs.getSessionID());

                st.executeUpdate();
                st.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deleteChatSession(ChatSession cs) {
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareCall("DELETE FROM session "
                        + "WHERE session.`sessionID` = ?;");

                st.setInt(1, cs.getSessionID());

                st.executeUpdate();

                st.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(ChatSessionDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
