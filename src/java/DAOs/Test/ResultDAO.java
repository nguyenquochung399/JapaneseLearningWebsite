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
            conn.close();
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
            conn.close();
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
            conn.close();
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
            conn.close();
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
            conn.close();
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
            conn.close();
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
            conn.close();
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
            conn.close();
        } catch (Exception e) {
        }
    }
    
}
