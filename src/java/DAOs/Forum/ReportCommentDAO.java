/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Forum;

import Connection.HikariCPDataSource;
import Models.ForumAllReportComment;
import Models.ForumReportComment;
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
public class ReportCommentDAO {

    public static int newReportComment2(ForumReportComment ra) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO `forum_report_comment` "
                    + "(`report_comment_id`, `user_report_id`, `report_comment_reason`, `comment_id`, `report_comment_date`) "
                    + "VALUES (NULL, ?, ?, ?, ?);");

            ps.setInt(1, ra.getUser_report_id());
            ps.setString(2, ra.getReport_comment_reason());
            ps.setInt(3, ra.getComment_id());
            ps.setString(4, ra.getReport_comment_date());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static List<ForumAllReportComment> getAllReportComment2() {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT * FROM `forum_report_comment` NATURAL JOIN `forum_comment` "
                    + "LEFT JOIN `forum_post` ON `forum_comment`.`post_id` = `forum_post`.`post_id`"
                    + "LEFT JOIN `user` ON `forum_report_comment`.`user_report_id` = `user`.`userID` "
                    + "WHERE `forum_report_comment`.`status` = 'active'"
                    + "ORDER BY `forum_report_comment`.`report_comment_id` DESC ;");
            rs = ps.executeQuery();

            ForumAllReportComment f = null;
            while (rs.next()) {
                f = new ForumAllReportComment();
                f.setReport_comment_reason(rs.getString("report_comment_reason"));
                f.setComment_content(rs.getString("comment_content"));
                f.setComment_edit_date(rs.getString("comment_edit_date"));
                f.setPost_title(rs.getString("post_title"));
                f.setPost_content(rs.getString("post_content"));
                f.setUsername(rs.getString("username"));
                f.setReport_comment_date(rs.getString("report_comment_date"));
                f.setReport_comment_id(rs.getInt("report_comment_id"));
                f.setComment_id(rs.getInt("comment_id"));
                results.add(f);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(ReportCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static int deleteReportComment2(ForumReportComment ra) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_report_comment` "
                    + "SET `status` = 'disable' "
                    + "WHERE `forum_report_comment`.`report_comment_id` = ? ;");

            ps.setInt(1, ra.getReport_comment_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int deleteReportPostByCommentID2(ForumReportComment ra) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("DELETE FROM `forum_report_comment` "
                    + "WHERE `forum_report_comment`.`comment_id` = ?");

            ps.setInt(1, ra.getComment_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportCommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

}
