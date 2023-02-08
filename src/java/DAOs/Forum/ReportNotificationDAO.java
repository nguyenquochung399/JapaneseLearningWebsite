/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Forum;

import Connection.HikariCPDataSource;
import Models.ForumAllNotification;
import Models.ForumReportNotification;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.dbutils.DbUtils;

/**
 *
 * @author ACER
 */
public class ReportNotificationDAO {
            
    public static List<ForumAllNotification> getAllReportNotificationByUserID2(int userID) {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT * FROM `forum_report_notification` "
                    + "LEFT JOIN `forum_post` "
                    + "ON `forum_report_notification`.`post_id` = `forum_post`.`post_id` "
                    + "LEFT JOIN `forum_comment` "
                    + "ON `forum_report_notification`.`comment_id` = `forum_comment`.`comment_id` "
                    + "WHERE `forum_report_notification`.`userID` = ? AND `forum_report_notification`.`status` = 'active' "
                    + "ORDER BY `forum_report_notification`.`report_notification_id` DESC ");
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            
            ForumAllNotification a = null;
            while (rs.next()) {
                a = new ForumAllNotification();
                a.setReport_notification_id(rs.getInt(1));
                a.setUserID(rs.getInt(2));
                a.setReport_notification_content(rs.getString(3));
                a.setPost_id(rs.getInt(4));
                a.setComment_id(rs.getInt(5));
                a.setPost_title(rs.getString(10));
                a.setPost_content(rs.getString(11));
                a.setPost_date(rs.getString(13));
                a.setPost_status(rs.getString(15));
                a.setComment_content(rs.getString(18));
                a.setComment_date(rs.getString(20));
                results.add(a);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(ReportNotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }
            
    public static List<ForumReportNotification> getAllReportNotificationByUserIDNotRead2(int userID) {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT * FROM `forum_report_notification` "
                    + "WHERE userID = ? AND report_notification_status = 'not read' ;");
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            
            ForumReportNotification f = null;
            while (rs.next()) {
                f = new ForumReportNotification();
                f.setReport_notification_id(rs.getInt("report_notification_id"));
                f.setUserID(rs.getInt("userID"));
                f.setReport_notification_content(rs.getString("report_notification_content"));
                f.setPost_id(rs.getInt("post_id"));
                f.setComment_id(rs.getInt("comment_id"));
                f.setReport_notification_status(rs.getString("report_notification_status"));
                results.add(f);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(ReportNotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }
    
    public static int newReportNotificationPost2(ForumReportNotification rn) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO `forum_report_notification` "
                    + "(`report_notification_id`, `userID`, `report_notification_content`, `post_id`, `comment_id`, `report_notification_status`) "
                    + "VALUES (NULL, ?, ?, ?, NULL, 'not read');");

            ps.setInt(1, rn.getUserID());
            ps.setString(2, rn.getReport_notification_content());
            ps.setInt(3, rn.getPost_id());
            
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportNotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
    
    public static int newReportNotificationComment2(ForumReportNotification rn) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO `forum_report_notification` "
                    + "(`report_notification_id`, `userID`, `report_notification_content`, `post_id`, `comment_id`, `report_notification_status`) "
                    + "VALUES (NULL, ?, ?, NULL, ?, 'not read');");

            ps.setInt(1, rn.getUserID());
            ps.setString(2, rn.getReport_notification_content());
            ps.setInt(3, rn.getComment_id());
            
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportNotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
    
    public static int markAllRead2(int userID) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_report_notification` "
                    + "SET `report_notification_status` = 'read' "
                    + "WHERE userID = ?");

            ps.setInt(1, userID);

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportNotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
    
    public static int deleteReportNotificationPost2(int post_id) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("DELETE FROM `forum_report_notification` "
                    + "WHERE `forum_report_notification`.`post_id` = ?");

            ps.setInt(1, post_id);

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportNotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
    
    public static int deleteReportNotificationPostByID2(int report_notification_id) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_report_notification` "
                    + "SET `status` = 'disable' "
                    + "WHERE `forum_report_notification`.`report_notification_id` = ? ;");

            ps.setInt(1, report_notification_id);

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportNotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
    
    public static int deleteReportNotificationComment2(int comment_id) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("DELETE FROM `forum_report_notification` "
                    + "WHERE `forum_report_notification`.`comment_id` = ?");

            ps.setInt(1, comment_id);

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportNotificationDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
}
