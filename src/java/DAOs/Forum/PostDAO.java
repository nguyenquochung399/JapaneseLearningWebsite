/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Forum;

import Connection.HikariCPDataSource;
import Models.ForumAllPostWithComment;
import Models.ForumPost;
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
public class PostDAO {

    public static List<ForumAllPostWithComment> getAllPostByPageWithCommentCount2(int offset) {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT a.*, c.topic_name, d.*, "
                    + "COUNT(IF(b.comment_status = 'active', b.post_id, NULL))  AS 'comment_count' "
                    + "FROM `forum_post` a "
                    + "LEFT JOIN `forum_comment` b ON a.post_id = b.post_id "
                    + "LEFT JOIN `forum_topic` c ON a.topic_id = c.topic_id "
                    + "LEFT JOIN `user` d ON a.userID = d.userID "
                    + "WHERE a.`post_status` = 'active' "
                    + "AND (b.comment_status = 'active' OR b.comment_status IS NULL OR b.comment_status = 'disable')  "
                    + "GROUP BY  a.post_id "
                    + "ORDER BY a.post_date "
                    + "DESC LIMIT 10 OFFSET ? ;");
            ps.setInt(1, offset);

            rs = ps.executeQuery();

            ForumAllPostWithComment f = null;
            while (rs.next()) {
                f = new ForumAllPostWithComment();
                f.setPost_id(rs.getInt("post_id"));
                f.setTopic_id(rs.getInt("topic_id"));
                f.setPost_title(rs.getString("post_title"));
                f.setPost_content(rs.getString("post_content"));
                f.setPost_date(rs.getString("post_date"));
                f.setPost_edit_date(rs.getString("post_edit_date"));
                f.setTopic_name(rs.getString("topic_name"));
                f.setUsername(rs.getString("username"));
                f.setAvatar(rs.getString("avatar"));
                f.setComment_count(rs.getInt("comment_count"));
                results.add(f);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }
    
    public static List<ForumAllPostWithComment> getAllDisablePostWithCommentCount2() {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT a.*, c.topic_name, d.*, "
                    + "COUNT(IF(b.comment_status = 'active', b.post_id, NULL))  AS 'comment_count'  "
                    + "FROM `forum_post` a "
                    + "LEFT JOIN `forum_comment` b ON a.post_id = b.post_id "
                    + "LEFT JOIN `forum_topic` c ON a.topic_id = c.topic_id "
                    + "LEFT JOIN `user` d ON a.userID = d.userID "
                    + "WHERE a.`post_status` = 'disable' "
                    + "AND (b.comment_status = 'active' OR b.comment_status IS NULL OR b.comment_status = 'disable')  "
                    + "GROUP BY  a.post_id "
                    + "ORDER BY a.post_date DESC ;");

            rs = ps.executeQuery();

            ForumAllPostWithComment f = null;
            while (rs.next()) {
                f = new ForumAllPostWithComment();
                f.setPost_id(rs.getInt("post_id"));
                f.setTopic_id(rs.getInt("topic_id"));
                f.setPost_title(rs.getString("post_title"));
                f.setPost_content(rs.getString("post_content"));
                f.setPost_date(rs.getString("post_date"));
                f.setPost_edit_date(rs.getString("post_edit_date"));
                f.setTopic_name(rs.getString("topic_name"));
                f.setUsername(rs.getString("username"));
                f.setAvatar(rs.getString("avatar"));
                f.setComment_count(rs.getInt("comment_count"));
                results.add(f);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static ForumPost getPostByID2(int post_id) {
        ForumPost p = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT * FROM `forum_post` "
                    + "WHERE post_id = ?;");
            ps.setInt(1, post_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                p = new ForumPost();
                p.setPost_id(post_id);
                p.setTopic_id(rs.getInt("topic_id"));
                p.setPost_title(rs.getString("post_title"));
                p.setPost_content(rs.getString("post_content"));
                p.setUser_id(rs.getInt("userID"));
                p.setPost_date(rs.getString("post_date"));
                p.setPost_status(rs.getString("post_status"));

            }
            return p;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return p;
    }

    public static List<ForumAllPostWithComment> getAllPostByTopicWithCommentCount2(int topic_id) {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT a.*, c.topic_name, d.*, "
                    + "COUNT(b.post_id) AS 'comment_count' "
                    + "FROM `forum_post` a "
                    + "LEFT JOIN `forum_comment` b ON a.post_id = b.post_id "
                    + "LEFT JOIN `forum_topic` c ON a.topic_id = c.topic_id "
                    + "LEFT JOIN `user` d ON a.userID = d.userID "
                    + "WHERE a.`post_status` = 'active' AND a.`topic_id` = ? "
                    + "AND (b.comment_status = 'active' OR b.comment_status IS NULL) "
                    + "GROUP BY  a.post_id "
                    + "ORDER BY a.post_date DESC ;");
            ps.setInt(1, topic_id);
            rs = ps.executeQuery();

            ForumAllPostWithComment f = null;
            while (rs.next()) {
                f = new ForumAllPostWithComment();
                f.setPost_id(rs.getInt("post_id"));
                f.setTopic_id(rs.getInt("topic_id"));
                f.setPost_title(rs.getString("post_title"));
                f.setPost_content(rs.getString("post_content"));
                f.setPost_date(rs.getString("post_date"));
                f.setTopic_name(rs.getString("topic_name"));
                f.setUsername(rs.getString("username"));
                f.setAvatar(rs.getString("avatar"));
                f.setComment_count(rs.getInt("comment_count"));
                results.add(f);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static List<ForumAllPostWithComment> getAllPostBySearchWithCommentCount2(String search) {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT a.*, c.topic_name, d.*, "
                    + "COUNT(b.post_id) AS 'comment_count' "
                    + "FROM `forum_post` a "
                    + "LEFT JOIN `forum_comment` b ON a.post_id = b.post_id "
                    + "LEFT JOIN `forum_topic` c ON a.topic_id = c.topic_id "
                    + "LEFT JOIN `user` d ON a.userID = d.userID "
                    + "WHERE a.`post_status` = 'active' AND post_title LIKE ? OR post_content LIKE ? "
                    + "AND (b.comment_status = 'active' OR b.comment_status IS NULL) "
                    + "GROUP BY  a.post_id "
                    + "ORDER BY a.post_date DESC ;");

            ps.setString(1, "%" + search + "%");
            ps.setString(2, "%" + search + "%");
            rs = ps.executeQuery();

            ForumAllPostWithComment f = null;
            while (rs.next()) {
                f = new ForumAllPostWithComment();
                f.setPost_id(rs.getInt("post_id"));
                f.setTopic_id(rs.getInt("topic_id"));
                f.setPost_title(rs.getString("post_title"));
                f.setPost_content(rs.getString("post_content"));
                f.setPost_date(rs.getString("post_date"));
                f.setTopic_name(rs.getString("topic_name"));
                f.setUsername(rs.getString("username"));
                f.setAvatar(rs.getString("avatar"));
                f.setComment_count(rs.getInt("comment_count"));
                results.add(f);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static int getNumberUserActiveForum2(String date) {
        int userActive = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT COUNT(*) "
                    + "AS total_user "
                    + "FROM (SELECT `forum_post`.`userID` FROM `forum_post` "
                    + "WHERE post_date LIKE ? "
                    + "UNION SELECT `forum_comment`.`userID` "
                    + "FROM `forum_comment` WHERE comment_date LIKE ?) "
                    + "total_user;");
            ps.setString(1, "%" + date + "%");
            ps.setString(2, "%" + date + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                userActive = rs.getInt("total_user");
            }
            return userActive;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return userActive;
    }

    public static int getNumberPostToday2(String date) {
        int numberPost = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT COUNT(post_id) AS total_post "
                    + "FROM `forum_post` WHERE post_date LIKE ? ;");
            ps.setString(1, "%" + date + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                numberPost = rs.getInt("total_post");
            }
            return numberPost;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return numberPost;
    }

    public static int getNumberPost2() {
        int numberPost = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT COUNT(post_id) AS total_post "
                    + "FROM `forum_post` WHERE post_status = 'active' ;");
            rs = ps.executeQuery();

            while (rs.next()) {
                numberPost = rs.getInt("total_post");
            }
            return numberPost;

        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return numberPost;
    }

    public static int restorePost2(ForumPost p) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_post` "
                    + "SET `post_status` = 'active' "
                    + "WHERE `forum_post`.`post_id` = ?;");

            ps.setInt(1, p.getPost_id());
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int restorePostByTopic2(ForumPost p) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_post` "
                    + "SET `post_status` = 'active' "
                    + "WHERE `forum_post`.`topic_id` = ?;");

            ps.setInt(1, p.getTopic_id());
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int newPost2(ForumPost p) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO `forum_post` "
                    + "(`post_id`, `topic_id`, `post_title`, `post_content`, `userID`, `post_date`, `post_edit_date`, `post_status`) "
                    + "VALUES (NULL, ?, ?, ?, ?, ?, ?, 'active');");

            ps.setInt(1, p.getTopic_id());
            ps.setString(2, p.getPost_title());
            ps.setString(3, p.getPost_content());
            ps.setInt(4, p.getUser_id());
            ps.setString(5, p.getPost_date());
            ps.setString(6, p.getPost_edit_date());
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int editPost2(ForumPost p) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_post` "
                    + "SET `topic_id` = ?, `post_title` = ?, `post_content` = ?, `post_edit_date` = ? "
                    + "WHERE `forum_post`.`post_id` = ?;");

            ps.setInt(1, p.getTopic_id());
            ps.setString(2, p.getPost_title());
            ps.setString(3, p.getPost_content());
            ps.setString(4, p.getPost_edit_date());
            ps.setInt(5, p.getPost_id());
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int deletePost2(ForumPost p) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("DELETE FROM `forum_post`"
                    + " WHERE `forum_post`.`post_id` = ?");

            ps.setInt(1, p.getPost_id());
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int disablePost2(ForumPost p) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_post` "
                    + "SET `post_status` = 'disable' "
                    + "WHERE `forum_post`.`post_id` = ?;");

            ps.setInt(1, p.getPost_id());
            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int disablePostByTopic2(ForumPost p) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_post` "
                    + "SET `post_status` = 'disable' "
                    + "WHERE `forum_post`.`topic_id` = ?;");

            ps.setInt(1, p.getTopic_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(PostDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }
}
