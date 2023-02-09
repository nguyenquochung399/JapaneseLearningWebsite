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

}
