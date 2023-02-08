/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Forum;

import Connection.HikariCPDataSource;
import Models.Comment;
import Models.ForumAllComment;
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
public class CommentDAO {

    public static List<ForumAllComment> getAllCommentByPostID2(int post_id) {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT * FROM `forum_comment` NATURAL JOIN `user`"
                    + " WHERE post_id = ? AND comment_status ='active' ORDER BY comment_id DESC");
            ps.setInt(1, post_id);
            rs = ps.executeQuery();

            ForumAllComment f = null;
            while (rs.next()) {
                f = new ForumAllComment();
                f.setAvatar(rs.getString("avatar"));
                f.setUsername(rs.getString("username"));
                f.setComment_date(rs.getString("comment_date"));
                f.setComment_content(rs.getString("comment_content"));
                f.setComment_id(rs.getInt("comment_id"));
                f.setUserID(rs.getInt("userID"));
                results.add(f);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static List<ForumAllComment> getAllDisableComment2() {
        ArrayList results = new ArrayList();
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT * FROM `forum_comment` NATURAL JOIN `user` "
                    + "WHERE comment_status = 'disable'  "
                    + "ORDER BY comment_date DESC;");
            rs = ps.executeQuery();

            ForumAllComment f = null;
            while (rs.next()) {
                f = new ForumAllComment();
                f.setAvatar(rs.getString("avatar"));
                f.setUsername(rs.getString("username"));
                f.setComment_date(rs.getString("comment_date"));
                f.setComment_content(rs.getString("comment_content"));
                f.setComment_id(rs.getInt("comment_id"));
                f.setUserID(rs.getInt("userID"));
                results.add(f);
            }
            return results;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return null;
    }

    public static int newComment2(Comment a) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("INSERT INTO `forum_comment`"
                    + " (`comment_id`, `post_id`, `comment_content`, `userID`, `comment_date`, `comment_edit_date`)"
                    + " VALUES (NULL, ?, ?, ?, ?, ?);");

            ps.setInt(1, a.getPost_id());
            ps.setString(2, a.getComment_content());
            ps.setInt(3, a.getUser_id());
            ps.setString(4, a.getComment_date());
            ps.setString(5, a.getComment_edit_date());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int editComment2(Comment a) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_comment` "
                    + "SET `comment_content` = ?, `comment_edit_date` = ? WHERE `forum_comment`.`comment_id` = ?;");

            ps.setString(1, a.getComment_content());
            ps.setString(2, a.getComment_edit_date());
            ps.setInt(3, a.getComment_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int disableComment2(Comment a) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_comment` "
                    + "SET `comment_status` = 'disable' "
                    + "WHERE `forum_comment`.`comment_id` = ?;");

            ps.setInt(1, a.getComment_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int restoreComment2(Comment a) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_comment` "
                    + "SET `comment_status` = 'active' "
                    + "WHERE `forum_comment`.`comment_id` = ?;");

            ps.setInt(1, a.getComment_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int deleteComment2(Comment a) {
        int count = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("UPDATE `forum_comment` "
                    + "SET `comment_status` = 'disable' "
                    + "WHERE `forum_comment`.`comment_id` = ? ;");

            ps.setInt(1, a.getComment_id());

            count = ps.executeUpdate();

            return count;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return count;
    }

    public static int getNumberCommentToday2(String date) {
        int numberComment = 0;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT COUNT(comment_id) AS total_comment "
                    + "FROM `forum_comment` WHERE comment_date LIKE ? ;");
            ps.setString(1, "%" + date + "%");
            rs = ps.executeQuery();

            while (rs.next()) {
                numberComment = rs.getInt("total_comment");
            }
            return numberComment;

        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return numberComment;
    }

    public static Comment getCommentByID2(int comment_id) {
        Comment c = null;
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            conn = HikariCPDataSource.getConnection();
            ps = conn.prepareStatement("SELECT * FROM `forum_comment` "
                    + "WHERE comment_id = ?;");
            ps.setInt(1, comment_id);
            rs = ps.executeQuery();

            if (rs.next()) {
                c = new Comment();
                c.setComment_id(comment_id);
                c.setPost_id(rs.getInt("post_id"));
                c.setComment_content(rs.getString("comment_content"));
                c.setUser_id(rs.getInt("userID"));
                c.setComment_date(rs.getString("comment_date"));
                c.setComment_status(rs.getString("comment_status"));

            }
            return c;
        } catch (SQLException ex) {
            Logger.getLogger(CommentDAO.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            DbUtils.closeQuietly(rs);
            DbUtils.closeQuietly(ps);
            DbUtils.closeQuietly(conn);
        }
        return c;
    }

}
