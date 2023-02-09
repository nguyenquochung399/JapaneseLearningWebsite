/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Test;

import Connection.HikariCPDataSource;
import Models.Answer;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saing
 */
public class AnswerDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Answer> getAllAnswer() {
        List<Answer> list = new ArrayList<>();
        String query = "select * from `answer`";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Answer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public Answer getLastAnswer() {
        Answer a = new Answer();
        String query = "SELECT * FROM `answer` ORDER BY answer.AnswerID DESC LIMIT 1;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Answer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public Answer getAnswerByID(int AnswerID) {
        Answer a = new Answer();
        String query = "select * from `answer` where `AnswerID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, AnswerID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Answer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public Answer getAnswerByname(String Answer) {
        Answer a = new Answer();
        String query = "SELECT * FROM `answer` WHERE `Answer`= ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Answer);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Answer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public List<Answer> getAnswerByQuestion(int QuestionID) {
        List<Answer> list = new ArrayList<>();
        String query = "select * from `answer` where `QuestionID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, QuestionID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Answer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public Answer getByTest(int TestID) {
        Answer a = new Answer();
        String query = "select * from `answer` where `QuestionID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TestID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Answer(rs.getInt(1),
                        rs.getInt(2),
                        rs.getString(3),
                        rs.getInt(4));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public void insertAnswer(int QuestionID, String Answer, int isCorrect) {
        String query = "INSERT INTO `answer`(`QuestionID`, `Answer`, `isCorrect`) VALUES (?,?,?);";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, QuestionID);
            ps.setString(2, Answer);
            ps.setInt(3, isCorrect);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void deleteAnswer(int AnswerID) {
        String query = "DELETE from `answer` WHERE `AnswerID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, AnswerID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void editAnswer(int AnswerID, int QuestionID, String Answer, int isCorrect) {
        String query = " UPDATE `answer` SET `QuestionID` = ?,`Answer` = ?,`isCorrect` = ? WHERE `AnswerID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, QuestionID);
            ps.setString(2, Answer);
            ps.setInt(3, isCorrect);
            ps.setInt(4, AnswerID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

}
