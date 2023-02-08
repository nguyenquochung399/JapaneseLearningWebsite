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
public class Test {
    private int TestID;
    private String Name;
    private int TagID;
    private int LevelID;
    private int status;
    
    public Test(){}

    public Test(int TestID, String Name, int TagID, int LevelID, int status) {
        this.TestID = TestID;
        this.Name = Name;
        this.TagID = TagID;
        this.LevelID = LevelID;
        this.status = status;
    }

    public int getTestID() {
        return TestID;
    }

    public void setTestID(int TestID) {
        this.TestID = TestID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public int getTagID() {
        return TagID;
    }

    public void setTagID(int TagID) {
        this.TagID = TagID;
    }

    public int getLevelID() {
        return LevelID;
    }

    public void setLevelID(int LevelID) {
        this.LevelID = LevelID;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Test{" + "TestID=" + TestID + ", Name=" + Name + ", TagID=" + TagID + ", LevelID=" + LevelID + ", status=" + status + '}';
    }

    
}
