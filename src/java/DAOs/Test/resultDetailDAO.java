/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Test;

import Connection.HikariCPDataSource;
import Models.ChoiceOfUser;
import Models.ResultDetail;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saing
 */
public class resultDetailDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<ResultDetail> getAllResultDetail() {
        List<ResultDetail> list = new ArrayList<>();
        String query = "SELECT * FROM `resultdetail`;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ResultDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public ResultDetail getlastResultDetail() {
        ResultDetail a = new ResultDetail();
        String query = "SELECT    *\n"
                + "FROM      resultdetail\n"
                + "ORDER BY  resultdetail.ResultDetailID DESC\n"
                + "LIMIT     1;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new ResultDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public ResultDetail getResultDetailbyID(int ResultDetailID) {
        ResultDetail a = new ResultDetail();
        String query = "SELECT * FROM `resultdetail` where `ResultDetailID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, ResultDetailID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new ResultDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public List<ResultDetail> getbyResultID(int ResultID) {
        List<ResultDetail> list = new ArrayList<>();
        String query = "SELECT * FROM `resultdetail` where `ResultID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, ResultID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ResultDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public List<ChoiceOfUser> getChoicebyResultID() {
        List<ChoiceOfUser> list = new ArrayList<>();
        String query = "SELECT  r.UserID, r.TestID, d.QuestionID, d.Answer\n"
                + "FROM `result` AS r, `resultdetail` AS d\n"
                + "WHERE r.ResultID=d.ResultID;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new ChoiceOfUser(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public ResultDetail getbyQuesResult(int ResultID, int QuestionID) {
        ResultDetail a = new ResultDetail();
        String query = "SELECT * FROM `resultdetail` WHERE `ResultID` = ? AND `QuestionID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, ResultID);
            ps.setInt(2, QuestionID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new ResultDetail(rs.getInt(1),
                        rs.getInt(2),
                        rs.getInt(3),
                        rs.getString(4));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public void insertResultDetail(int ResultID, int QuestionID, String Answer) {
        String query = "INSERT INTO `resultdetail`(`ResultID`, `QuestionID`, `Answer`) VALUES (?,?,?);";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, ResultID);
            ps.setInt(2, QuestionID);
            ps.setString(3, Answer);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void deleteResultDetail(int ResultDetailID) {
        String query = "DELETE from `resultdetail` WHERE `ResultDetailID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, ResultDetailID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

}
