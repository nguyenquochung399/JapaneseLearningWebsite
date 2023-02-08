/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Forum;

import Connection.HikariCPDataSource;
import Models.ForumTopic;
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
public class TopicDAO {
    
    public static List<ForumTopic> getAllTopic2() {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();            
            ps = conn.prepareStatement("SELECT * FROM `forum_topic` "
                    + "WHERE topic_status = 'active' ORDER BY topic_id ASC;");

            rs = ps.executeQuery();
            
            ForumTopic topic = null;
            while (rs.next()) {
                topic = new ForumTopic();
                topic.setTopic_id(rs.getInt("topic_id"));
                topic.setTopic_name(rs.getString("topic_name"));
                topic.setTopic_status(rs.getString("topic_status"));
                results.add(topic);
            }            
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static List<ForumTopic> getAllDisableTopic2() {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();            
            ps = conn.prepareStatement("SELECT * FROM `forum_topic` WHERE topic_status = 'disable' ORDER BY topic_id ASC;");
            rs = ps.executeQuery();
            
            ForumTopic topic = null;
            while (rs.next()) {
                topic = new ForumTopic();
                topic.setTopic_id(rs.getInt("topic_id"));
                topic.setTopic_name(rs.getString("topic_name"));
                topic.setTopic_status(rs.getString("topic_status"));
                results.add(topic);
            }            
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }   

    public static ForumTopic getTopicByID2(int topic_id) {
        ForumTopic t = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT * FROM `forum_topic` "
                    + "WHERE topic_id = ?;");
            ps.setInt(1, topic_id);
            rs = ps.executeQuery();
            
            if (rs.next()) {
                t = new ForumTopic();
                t.setTopic_id(topic_id);
                t.setTopic_name(rs.getString("topic_name"));
                t.setTopic_status(rs.getString("topic_status"));

            }
            return t;
        } catch (SQLException ex) {
            Logger.getLogger(TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return t;
    }

    public static int newTopic2(ForumTopic t) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO `forum_topic` (`topic_id`, `topic_name`, `topic_status`) "
                    + "VALUES (NULL, ?, 'active');");

            ps.setString(1, t.getTopic_name());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int editTopic2(ForumTopic t) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_topic` "
                    + "SET `topic_name` = ? "
                    + "WHERE `forum_topic`.`topic_id` = ?;");

            ps.setString(1, t.getTopic_name());
            ps.setInt(2, t.getTopic_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int disableTopic2(ForumTopic t) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_topic` "
                    + "SET `topic_status` = 'disable' "
                    + "WHERE `forum_topic`.`topic_id` = ?;");

            ps.setInt(1, t.getTopic_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int restoreTopic2(ForumTopic t) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_topic` "
                    + "SET `topic_status` = 'active' "
                    + "WHERE `forum_topic`.`topic_id` = ?;");

            ps.setInt(1, t.getTopic_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int deleteTopic2(ForumTopic t) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("DELETE FROM `forum_topic` "
                    + "WHERE `forum_topic`.`topic_id` = ?");

            ps.setInt(1, t.getTopic_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(TopicDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
}
