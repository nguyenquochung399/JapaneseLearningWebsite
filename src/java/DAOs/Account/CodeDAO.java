/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Account;

import Connection.HikariCPDataSource;
import DAOs.Notification.NotificationDAO;
import Models.Code;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Admin
 */
public class CodeDAO {
    public static ArrayList<Code> getAllCode() {
        try {
            ArrayList<Code> codeList;
            try (Connection conn = HikariCPDataSource.getConnection()) {
                codeList = new ArrayList<>();
                PreparedStatement st = conn.prepareStatement("SELECT codeID, code, date_format(expiryDate,'%Y-%m-%d %H:%i:%s') as expiryDate, userID FROM `account_code` ORDER BY codeID ASC");
                ResultSet rs = st.executeQuery();
                while (rs.next()) {
                    Code ac = new Code();
                    ac.setCodeID(rs.getInt("codeID"));
                    ac.setCode(rs.getString("code"));
                    ac.setExpiryDate(rs.getString("expiryDate"));
                    ac.setUserID(rs.getInt("userID"));
                    
                    codeList.add(ac);
                }
                conn.close();
            }
            return codeList;
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static Code getCodeByID(int code_id) {
        Code code = null;
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareStatement("SELECT codeID, code, date_format(expiryDate,'%Y-%m-%d %H:%i:%s') as expiryDate, userID FROM `account_code`"
                        + " WHERE codeID = ?");
                st.setInt(1, code_id);
                ResultSet rs = st.executeQuery();
                
                if (rs.next()) {
                    code = new Code();
                    
                    code.setCodeID(code_id);
                    code.setCode(rs.getString("code"));
                    code.setExpiryDate(rs.getString("expiryDate"));
                    code.setUserID(rs.getInt("userID"));
                }
                conn.close();
            }
            return code;
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static Code getCodeByUID(int user_id) {
        Code code = null;
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareStatement("SELECT codeID, code, date_format(expiryDate,'%Y-%m-%d %H:%i:%s') as expiryDate, userID FROM `account_code`"
                        + " WHERE userID = ?");
                st.setInt(1, user_id);
                ResultSet rs = st.executeQuery();
                
                if (rs.next()) {
                    code = new Code();
                    
                    code.setCodeID(rs.getInt("codeID"));
                    code.setCode(rs.getString("code"));
                    code.setExpiryDate(rs.getString("expiryDate"));
                    code.setUserID(user_id);
                }
                conn.close();
            }
            return code;
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void addNewCode(Code c) {
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareCall("INSERT INTO account_code"
                        + " (codeID, code, expiryDate, userID)"
                        + " VALUES (NULL, ?, ?, ?);");
                
                st.setString(1, c.getCode());
                st.setString(2, c.getExpiryDate());
                st.setInt(3, c.getUserID());
                
                st.executeUpdate();
                conn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void editCode(Code c) {
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareCall("UPDATE account_code "
                        + "SET code = ?, expiryDate = ?, userID = ? "
                        + "WHERE account_code.`codeID` = ?;");
                
                st.setString(1, c.getCode());
                st.setString(2, c.getExpiryDate());
                st.setInt(3, c.getUserID());
                st.setInt(4, c.getCodeID());
                
                st.executeUpdate();
                conn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void deleteCodeByID(int code_id) {
        try {
            try (Connection conn = HikariCPDataSource.getConnection()) {
                PreparedStatement st = conn.prepareCall("DELETE FROM account_code "
                        + "WHERE account_code.`codeID` = ?;");
                
                st.setInt(1, code_id);
                
                st.executeUpdate();
                conn.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(NotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
