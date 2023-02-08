/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Test;

import Connection.HikariCPDataSource;
import Models.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saing
 */
public class ResultDAO {
    
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Result> getAllResults() {
        List<Result> list = new ArrayList<>();
        String query = "SELECT * FROM `result`;";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Result(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Result getlastResults() {
        Result a = new Result();
        String query = "SELECT    *\n"
                + "FROM      result\n"
                + "ORDER BY  result.ResultID DESC\n"
                + "LIMIT     1;";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Result(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return a;
    }
    
    public List<Result> getResultByTest(int TestID) {
        List<Result> list = new ArrayList<>();
        String query = "select * from `result` where `TestID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TestID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Result(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public List<Result> getResultByUser(int UserID) {
        List<Result> list = new ArrayList<>();
        String query = "select * from `result` where `UserID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, UserID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Result(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7)));
            }
        } catch (Exception e) {
        }
        return list;
    }
    
    public Result getResultbyID(int ResultID) {
        Result a = new Result();
        String query = "select * from `result` where `ResultID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, ResultID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Result(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4),
                        rs.getString(5),
                        rs.getInt(6),
                        rs.getInt(7));
            }
        } catch (Exception e) {
        }
        return a;
    }
    
    public void insertResult(int UserID, int TestID, String timeBigin, String timeExpire, int Score, int trueQuestion) {
        String query = "insert into result (result.UserID,result.TestID,result.timeBigin,result.timeExpire,result.Score,result.trueQuestion)\n"
                + "VALUES(?,?,?,?,?,?);";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, UserID);
            ps.setInt(2, TestID);
            ps.setString(3, timeBigin);
            ps.setString(4, timeExpire);
            ps.setInt(5, Score);
            ps.setInt(6, trueQuestion);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void deleteResult(int ResultID) {
        String query = "delete from `result` where `ResultID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, ResultID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public void editResult(int ResultID, int UserID, int TestID, String timeBigin, String timeExpire, int Score, int trueQuestion) {
        String query = "update `result`\n"
                + "set `UserID` = ?, `TestID` = ?,`timeBigin` = ?,`timeExpire` = ?, `Score` = ?, `trueQuestion` = ?\n"
                + "where `ResultID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection(); //mo ket noi voi sql
            ps.setInt(1, UserID);
            ps.setInt(2, TestID);
            ps.setInt(3, UserID);
            ps.setString(4, timeBigin);
            ps.setString(5, timeExpire);
            ps.setInt(6, trueQuestion);
            ps.setInt(7, ResultID);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ResultDAO dao = new ResultDAO();
//        List<Result> list = dao.getResultByUser(2);
//        System.out.println(list);

        Result a = dao.getResultbyID(1);
        System.out.println(a);

//        for (Result o : list) {
//            System.out.println("ResultID: " + o.getResultID() + " UserID: " + o.getUserID() + " TestID: " + o.getTestID()
//                    + " Score: " + o.getScore() + " trueQuestion: " + o.getTrueQuestion());
//        }
//        int ResultID = 5; int UserID = 3; int TestID = 1; int Score = 16; int trueQuestion = 8;
//        String query = "INSERT Results \n" +
//                       "(ResultID,UserID,TestID,Score,trueQuestion)\n" +
//                       "VALUES(?,?,?,?,?)";
//        try {
//            conn = new DBcontext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, ResultID);
//            ps.setInt(2, UserID);
//            ps.setInt(3, TestID);
//            ps.setInt(4, Score);
//            ps.setInt(5, trueQuestion);
//            int row = ps.executeUpdate();
//            if(row != 0){
////                System.out.println("thêm thành công " + row);
////                System.out.println("Update thành công " + row);
//                System.out.println("Xoá thành công " + row);
//            }
//        } catch (Exception e) {
//        }
//        ResultDAO dao = new ResultDAO();
        System.out.println(dao.getResultbyID(1));
    }
}
