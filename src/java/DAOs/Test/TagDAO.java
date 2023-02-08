/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAOs.Test;

import Connection.HikariCPDataSource;
import Models.Tag;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saing
 */
public class TagDAO {
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    public List<Tag> getAllTag() {
        List<Tag> list = new ArrayList<>();
        String query = "SELECT * FROM `tag`;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Tag(rs.getInt(1),
                                  rs.getString(2)));
            }
            conn.close();
        } catch (Exception e) {
        }
        return list;
    }
    
    public Tag getTagByID(int TagID) {
        Tag a = new Tag();
        String query = "SELECT * FROM `tag` where TagID = ?;";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TagID);
            rs = ps.executeQuery();
            while (rs.next()) {
                a = new Tag(rs.getInt(1),
                                  rs.getString(2));
            }
            conn.close();
        } catch (Exception e) {
        }
        return a;
    }
    
    public void insertTag(String Desc){
        String query = "insert into tag(tag.Desc) value(?);";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Desc);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }
    
    public void deleteTag(int TagID) {
        String query = "delete from `tag` where `TagID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setInt(1, TagID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }

    public void editTag(int TagID, String Desc){
        String query = "update `tag` SET `Desc` = ? where `TagID` = ?";
        try {
            Connection conn = HikariCPDataSource.getConnection();//mo ket noi voi sql
            ps = conn.prepareStatement(query);
            ps.setString(1, Desc);
            ps.setInt(2, TagID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
        }
    }
    
    public static void main(String[] args) {
        PreparedStatement ps = null;
        ResultSet rs = null;
        TagDAO dao = new TagDAO();
        List<Tag> list = dao.getAllTag();

        for (Tag o : list) {
//            System.out.println("OptionID: " + o.getTagID()+ "      Descriptions: " + o.getDesc());
        }
//        int ID = 7; String Tag = "N9";
//        String query = "delete from Tag "
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
