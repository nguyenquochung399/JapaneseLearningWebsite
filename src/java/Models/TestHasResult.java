/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author Saing
 */
public class TestHasResult {
    private int TestID;
    private String Name;
    private int TagID;
    private int LevelID;
    private int hasResult;
    private int status;

    public TestHasResult() {
    }

    public TestHasResult(int TestID, String Name, int TagID, int LevelID, int hasResult, int status) {
        this.TestID = TestID;
        this.Name = Name;
        this.TagID = TagID;
        this.LevelID = LevelID;
        this.hasResult = hasResult;
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

    public int getHasResult() {
        return hasResult;
    }

    public void setHasResult(int hasResult) {
        this.hasResult = hasResult;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "TestHasResult{" + "TestID=" + TestID + ", Name=" + Name + ", TagID=" + TagID + ", LevelID=" + LevelID + ", hasResult=" + hasResult + ", status=" + status + '}';
    }

    
}
