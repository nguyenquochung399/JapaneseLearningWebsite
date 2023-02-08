/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Test;

import Connection.HikariCPDataSource;
import Models.Test;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saing
 */
public class TestDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Test> getAllTest() {
        List<Test> list = new ArrayList<>();
        String query = "select * from `test`";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Test(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public List<Test> getByTags(int TagsID) {
        List<Test> list = new ArrayList<>();
        String query = "select * from `test` where `TagsID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TagsID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Test(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public List<Test> getByLevel(int LevelID) {
        List<Test> list = new ArrayList<>();
        String query = "select * from `test` where `LevelID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, LevelID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Test(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public List<Test> getByLevelandTag(int TagsID, int LevelID) {
        List<Test> list = new ArrayList<>();
        String query = "select * from `test` where `TagID` = ? and `LevelID` = ? ";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TagsID);
            ps.setInt(2, LevelID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Test(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public Test getTestByID(int TestID) {
        Test a = new Test();
        String query = "SELECT * FROM `test` WHERE `TestID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TestID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Test(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }
    
    public Test getTestByName(String Test) {
        Test a = new Test();
        String query = "SELECT * FROM `test` WHERE `Name` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Test);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Test(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
        } catch (Exception e) {
        }
        return a;
    }

    public Test getLastTest() {
        Test a = new Test();
        String query = "SELECT * FROM `test` ORDER BY test.TestID DESC LIMIT 1;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Test(rs.getInt(1),
                        rs.getString(2),
                        rs.getInt(3),
                        rs.getInt(4),
                        rs.getInt(5));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public void insertTest(String Name, int TagID, int LevelID, int status) {
        String query = "INSERT INTO `test`(`Name`, `TagID`, `LevelID`,`Status`) VALUES (?,?,?,?);";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Name);
            ps.setInt(2, TagID);
            ps.setInt(3, LevelID);
            ps.setInt(4, status);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void deleteTest(int TestID) {
        String query = "DELETE FROM `test` WHERE `TestID`=?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TestID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void editTest(int TestID, String Name, int TagID, int LevelID, int status) {
        String query = "UPDATE `test` SET `Name`=?,`TagID`=?,`LevelID`=?, `Status`=? WHERE `TestID`=?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Name);
            ps.setInt(2, TagID);
            ps.setInt(3, LevelID);
            ps.setInt(4, status);
            ps.setInt(5, TestID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

//    public static void main(String[] args) {
//        PreparedStatement ps = null;
//        ResultSet rs = null;
//        TestDAO dao = new TestDAO();
//        List<Test> list = dao.getAllTest();
//        Test a = dao.getTestByID(1);
//        System.out.println(a);
//
//        for (Test o : list) {
//            System.out.println("TestID:"+o.getTestID()+" Name:"+o.getName()+" TagsID:"+o.getTagsID()+
//                               " LevelID:"+o.getLevelID()+" timeBigin:"+o.getTimeBigin()+" timeExpire:"+o.getTimeExpire()+
//                               " Duration:"+o.getDuration()+" numberQuestion:"+o.getNumberQuestion()+" ResultID:"+o.getResultID());
//        }
//
//        int TagsID = 3;
//        int LevelID = 5;
//        String Name = "Lamborghini";
//        int Duration = 10;
//        int numberQuestion = 10;
//        int TestID = 10;
//        String query = "update `test` \n"
//                + "set `Name` = ? `TagID` = ?, `LevelID` = ?,`Duration` = ?, `numberQuestion` = ?\n"
//                + "where `TestID` = ?";
//        try {
//            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setString(1, Name);
//            ps.setInt(2, TagsID);
//            ps.setInt(3, LevelID);
//            ps.setInt(4, Duration);
//            ps.setInt(5, numberQuestion);
//            ps.setInt(6, TestID);
//            int row = ps.executeUpdate();
//            if (row != 0) {
//                System.out.println("thêm thành công " + row);
//                System.out.println("Update thành công " + row);
//                System.out.println("Xoá thành công " + row);
//            }
//            conn.close();
//        } catch (Exception e) {
//        }
//        AnswerOfQuestion AvsQ = dao.getAnsandQues(2);
//        System.out.println(AvsQ);
//    }
}
