/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Forum;

import Connection.HikariCPDataSource;
import Models.ForumAllReportPost;
import Models.ForumReportPost;
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
public class ReportPostDAO {
    public static int newReportPost2(ForumReportPost rp){
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO `forum_report_post` "
                    + "(`report_post_id`, `user_report_id`, `report_post_reason`, `post_id`, `report_post_date`)"
                    + " VALUES (NULL, ?, ?, ?, ?);");
            
            ps.setInt(1, rp.getUser_report_id());
            ps.setString(2, rp.getReport_post_reason());
            ps.setInt(3, rp.getPost_id());
            ps.setString(4, rp.getReport_post_date());
            
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
    
    public static List<ForumAllReportPost> getAllReportPost2(){
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT `report_post_id`, `report_post_reason`, `post_id`, `post_title`, `post_content`, `post_edit_date`,"
                    + " `username`, `report_post_date` FROM `forum_report_post` "
                    + "NATURAL JOIN `forum_post` "
                    + "LEFT JOIN `user` ON `forum_report_post`.`user_report_id` = `user`.`userID`"
                    + "WHERE `forum_report_post`.`status` = 'active'"
                    + "ORDER BY `forum_report_post`.`report_post_id` DESC ;");
            rs = ps.executeQuery();
            
            ForumAllReportPost f = null;
            while (rs.next()) {
                f = new ForumAllReportPost();
                f.setReport_post_id(rs.getInt("report_post_id"));
                f.setReport_post_reason(rs.getString("report_post_reason"));
                f.setPost_id(rs.getInt("post_id"));
                f.setPost_title(rs.getString("post_title"));
                f.setPost_content(rs.getString("post_content"));
                f.setPost_edit_date(rs.getString("post_edit_date"));
                f.setUsername(rs.getString("username"));
                f.setReport_post_date(rs.getString("report_post_date"));
                results.add(f);
                
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(ReportPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }
    
    public static int deleteReportPost2(ForumReportPost rp){
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_report_post` "
                    + "SET `status` = 'disable' "
                    + "WHERE `forum_report_post`.`report_post_id` = ? ;");
            
            ps.setInt(1, rp.getReport_post_id());       
            
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
        
    public static int deleteReportPostByPostID2(ForumReportPost rp){
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("DELETE FROM `forum_report_post` "
                    + "WHERE `forum_report_post`.`post_id` = ?");
            
            ps.setInt(1, rp.getPost_id());       
            
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(ReportPostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
}
