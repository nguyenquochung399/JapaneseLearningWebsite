/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Test;

import Connection.HikariCPDataSource;
import Models.Level;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saing
 */
public class LevelDAO {

    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<Level> getAllLevel() {
        List<Level> list = new ArrayList<>();
        String query = "SELECT * FROM `level`";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Level(rs.getInt(1),
                        rs.getString(2)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }

    public Level getLevelbyID(int LevelID) {
        Level a = new Level();
        String query = "SELECT * FROM `level` WHERE `levelID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, LevelID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Level(rs.getInt(1),
                        rs.getString(2));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }

    public void insertLevel(String Desc) {
        String query = "INSERT INTO `level`(`levelName`) VALUES (?);";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Desc);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void deleteLevel(int LevelID) {
        String query = "DELETE from `level` WHERE `LevelID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, LevelID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void editLevel(int LevelID, String Desc) {
        String query = "UPDATE `level` SET `levelName` = ? WHERE `LevelID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Desc);
            ps.setInt(2, LevelID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public static void main(String[] args) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        LevelDAO dao = new LevelDAO();
        Level level = dao.getLevelbyID(7);
        System.out.println(level);
//        List<Level> list = dao.getLevelbyID(1);
//        for (Level o : list) {
//            System.out.println("LevelID: " + o.getLevelID()+ " Descriptions: " + o.getDesc());
//        }

//        int LevelID = 8; String Desc = "N12";
//       String query = "INSERT INTO `level`(`LevelID`, `Desc`) VALUES (?,?)";
//        try {
//            conn = new DBConnection().getConnection();//mo ket noi voi sql
//            ps = conn.prepareStatement(query);
//            ps.setInt(1, LevelID);
//            ps.setString(2, Desc);
//            int row = ps.executeUpdate();
//            if(row != 0){
//                System.out.println("thêm thành công " + row);
////                System.out.println("Update thành công " + row);
////                System.out.println("Xoá thành công " + row);
//            }
//        } catch (Exception e) {
//        }
    }
}
