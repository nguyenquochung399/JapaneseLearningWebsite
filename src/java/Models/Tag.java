/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author ACER
 */
public class Tag {
    private int TagID;
    private String Desc;
    
    public Tag(){}

    public Tag(int TagID, String Desc) {
        this.TagID = TagID;
        this.Desc = Desc;
    }

    public int getTagID() {
        return TagID;
    }

    public void setTagID(int TagID) {
        this.TagID = TagID;
    }

    public String getDesc() {
        return Desc;
    }

    public void setDesc(String Desc) {
        this.Desc = Desc;
    }

    @Override
    public String toString() {
        return "Tag{" + "TagID=" + TagID + ", Desc=" + Desc + '}';
    }

    
}
