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
public class Level {

    private int levelID;
    private String levelName;

    public Level() {

    }

    public Level(int levelID, String levelName) {
        this.levelID = levelID;
        this.levelName = levelName;
    }

    public int getLevelID() {
        return levelID;
    }

    public void setLevelID(int levelID) {
        this.levelID = levelID;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }

    @Override
    public String toString() {
        return "Level{" + "levelID=" + levelID + ", levelName=" + levelName + '}';
    }

}
