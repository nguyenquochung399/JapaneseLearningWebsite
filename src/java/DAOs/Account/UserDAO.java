/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Account;

import Connection.HikariCPDataSource;

import Models.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ACER
 */
public class UserDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    //create new account
    public void signup(String email, String password, String username, String phone, String avatar) {
        String query = "INSERT INTO `user`(`email`, password, `username`, `phone`, `avatar`, `role`) VALUES (?,MD5(?),?,?,?,'Người dùng')";
        try {
            Connection conn = HikariCPDataSource.getConnection();     // call function form DBconnection
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, username);
            ps.setString(4, phone);
            ps.setString(5, avatar);
            ps.executeUpdate();

            conn.close();
        } catch (Exception e) {

        }
    }

    //create new account
    public void signupContentManager(String email, String password, String username, String avatar) {
        String query = "INSERT INTO `user`(`email`, `password`, `username`, `phone`, `avatar`, `role`) VALUES (?,MD5(?),?,'',?,'Quản lí nội dung')";
        try {
            Connection conn = HikariCPDataSource.getConnection();        // call function form DBconnection
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ps.setString(3, username);
            ps.setString(4, avatar);
            ps.executeUpdate();

            conn.close();
        } catch (Exception e) {

        }
    }

    // login
    public User login(String email, String password) {
        String query = "SELECT * FROM user WHERE email = ? AND password =?";
        try {
            Connection conn = HikariCPDataSource.getConnection();        // call function form DBconnection
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }

            conn.close();
        } catch (Exception e) {

        }
        return null;
    }

    // login
    public User loginWithEmail(String email) {
        String query = "SELECT * FROM user WHERE email = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();        // call function form DBconnection
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }

            conn.close();
        } catch (Exception e) {

        }
        return null;
    }

    // check admin account
    public User checkAdmin(String email) {
        String query = "SELECT * FROM user WHERE email = ? AND role = 'Quản trị viên' ";
        try {
            Connection conn = HikariCPDataSource.getConnection();        // call function form DBconnection
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }

            conn.close();
        } catch (Exception e) {

        }
        return null;
    }

    public User checkContentManager(String email) {
        String query = "SELECT * FROM user WHERE email = ? AND role = 'Quản lí nội dung' ";
        try {
            Connection conn = HikariCPDataSource.getConnection();       // call function form DBconnection
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7));
            }

            conn.close();
        } catch (Exception e) {

        }
        return null;
    }
//    // check if username exist
//    public user checkUsernameExist(String user) {
//        String query = "SELECT * FROM user WHERE username = ?";
//        try {
//            conn = new DBConnection().getConnection();       // call function form DBconnection
//            ps = conn.prepareStatement(query);
//            ps.setString(1, user);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                return new user(                     
//                        rs.getString(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getInt(5));
//            }
//        } catch (Exception e) {
//
//        }
//        return null;
//    }
//
    // check if email exist

    public User checkEmailExist(String mail) {
        String query = "SELECT * FROM user WHERE email = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();       // call function form DBconnection
            ps = conn.prepareStatement(query);
            ps.setString(1, mail);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }
            conn.close();
        } catch (Exception e) {

        }
        return null;
    }

//    // check if phone exist
//    public user checkPhoneExist(String phone) {
//        String query = "SELECT * FROM user WHERE phone = ?";
//        try {
//            conn = new DBConnection().getConnection();       // call function form DBconnection
//            ps = conn.prepareStatement(query);
//            ps.setString(1, phone);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                return new user(
//                        rs.getString(1),
//                        rs.getString(2),
//                        rs.getString(3),
//                        rs.getString(4),
//                        rs.getInt(5));
//            }
//        } catch (Exception e) {
//
//        }
//        return null;
//    }
    public User updateUser(String username, String phone, String email) {
        try {
            Connection conn = HikariCPDataSource.getConnection();
            String sql = "UPDATE user "
                    + "SET username = ?, phone = ?"
                    + "WHERE user.`email` = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, phone);
            ps.setString(3, email);
            ps.executeUpdate();

            conn.close();
        } catch (Exception e) {

        }
        return null;
    }

    public User updateAvatar(String avatar, String email) {
        try {
            Connection conn = HikariCPDataSource.getConnection();
            String sql = "UPDATE user "
                    + "SET avatar = ? "
                    + "WHERE user.`email` = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, avatar);
            ps.setString(2, email);
            ps.executeUpdate();

            conn.close();
        } catch (Exception e) {

        }
        return null;
    }

    public boolean updatePassword(String password, String email) {
        try {
            Connection conn = HikariCPDataSource.getConnection();
            String sql = "UPDATE user " + "SET password = ? " + "WHERE user.`email` = ?";
            ps = conn.prepareStatement(sql);
            ps.setString(1, password);
            ps.setString(2, email);
            ps.executeUpdate();

            conn.close();
        } catch (Exception e) {

        }
        return false;
    }

    public User getUserByEmail(String email) {
        String query = "SELECT * FROM user WHERE email = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }

            conn.close();
        } catch (Exception e) {
        }
        return null;
    }

    // get all account
    public List<User> getAllAccount() {
        List<User> list = new ArrayList<>();
        String query = "SELECT * FROM user";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            //ResultSet resultSet = DBConnection.querySet("select * from user");
            ResultSet resultSet = ps.executeQuery();
            if (resultSet != null) {
                try {
                    while (resultSet.next()) {
                        list.add(new User(
                                resultSet.getInt(1),
                                resultSet.getString(2),
                                resultSet.getString(3),
                                resultSet.getString(4),
                                resultSet.getString(5),
                                resultSet.getString(6),
                                resultSet.getString(7)
                        ));
                    }
                } catch (Exception e) {
                }
                conn.close();
                return list;
            }

        } catch (Exception e) {

        }
        return null;
    }

    public User getUserByID(String userID) {
        String query = "SELECT * FROM user WHERE userID = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
            }

            conn.close();
        } catch (Exception e) {
        }
        return null;
    }

    public User getUserByID2(int userID) {
        String query = "SELECT * FROM user WHERE userID = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            while (rs.next()) {
                User u = new User(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getString(6),
                        rs.getString(7)
                );
                conn.close();
                return u;
            }

        } catch (Exception e) {
        }
        return null;
    }
  
}
