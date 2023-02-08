/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Test;

import Connection.HikariCPDataSource;
import Models.Question;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saing
 */
public class QuestionDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Question> getAllQuestion() {
        List<Question> list = new ArrayList<>();
        String query = "SELECT * FROM `question`;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Question(rs.getInt(1),
                                        rs.getString(2),
                                        rs.getInt(3)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public Question getLastQuestion() {
        Question a = new Question();
        String query = "SELECT * FROM `question` ORDER BY question.QuestionID DESC LIMIT 1;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Question(rs.getInt(1),
                                 rs.getString(2),
                                 rs.getInt(3));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public List<Question> getByTest(int TestID) {
        List<Question> list = new ArrayList<>();
        String query = "SELECT * FROM `question` WHERE `TestID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TestID);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Question(rs.getInt(1),
                                        rs.getString(2),
                                        rs.getInt(3)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public Question getQuestionByID(int QuestionID) {
        Question a = new Question();
        String query = "SELECT * FROM `question` WHERE `QuestionID` = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, QuestionID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Question(rs.getInt(1),
                                 rs.getString(2),
                                 rs.getInt(3));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

   public void insertQuestion(String Question, int TestID) {
        String query = "INSERT INTO `question`(`Question`, `TestID`) VALUES (?,?);";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Question);
            ps.setInt(2, TestID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void deleteQuestion(int QuestionID) {
        String query = "DELETE FROM `question` WHERE `QuestionID`= ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, QuestionID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void editQuestion(int QuestionID, String Question, int TestID) {
        String query = "UPDATE `question` SET `Question`=?,`TestID`=? WHERE `QuestionID` =?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Question);
            ps.setInt(2, TestID);
            ps.setInt(3, QuestionID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        QuestionDAO dao = new QuestionDAO();
        List<Question> list = dao.getAllQuestion();

        for (Question o : list) {
            System.out.println("QuestionID: " + o.getQuestionID() + " Question: " + o.getQuestion());
        }
//        Question a = dao.getQuestionByID(4);
//        System.out.println("QuestionID: " + a.getQuestionID() + " Question: " + a.getQuestion());
//        int ID = 5; int QuestionID = 1; String Question = "Lamborghini";
//        String query = "delete from Question "
//                + "where ID = ?";
//        try {
//            conn = new DBcontext().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, ID);
//            int row = ps.executeUpdate();
//            if(row != 0){
////                System.out.println("thêm thành công " + row);
////                System.out.println("Update thành công " + row);
//                System.out.println("Xoá thành công " + row);
//            }
//        } catch (Exception e) {
//        }
    }
}
