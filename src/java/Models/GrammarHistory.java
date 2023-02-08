/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

/**
 *
 * @author A Hi
 */
public class GrammarHistory {

    private int grammarID;
    private int levelID;
    private String structure;
    private String use;
    private int userID;
    private String grammarHistoryStatus;

    public GrammarHistory() {

    }

    public GrammarHistory(int grammarID, int levelID, String structure, String use, int userID, String grammarHistoryStatus) {
        this.grammarID = grammarID;
        this.levelID = levelID;
        this.structure = structure;
        this.use = use;
        this.userID = userID;
        this.grammarHistoryStatus = grammarHistoryStatus;
    }

    public int getGrammarID() {
        return grammarID;
    }

    public void setGrammarID(int grammarID) {
        this.grammarID = grammarID;
    }

    public int getLevelID() {
        return levelID;
    }

    public void setLevelID(int levelID) {
        this.levelID = levelID;
    }

    public String getStructure() {
        return structure;
    }

    public void setStructure(String structure) {
        this.structure = structure;
    }

    public String getUse() {
        return use;
    }

    public void setUse(String use) {
        this.use = use;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getGrammarHistoryStatus() {
        return grammarHistoryStatus;
    }

    public void setGrammarHistoryStatus(String grammarHistoryStatus) {
        this.grammarHistoryStatus = grammarHistoryStatus;
    }

    @Override
    public String toString() {
        return "GrammarHistory{" + "grammarID=" + grammarID + ", levelID=" + levelID + ", structure=" + structure + ", use=" + use + ", userID=" + userID + ", grammarHistoryStatus=" + grammarHistoryStatus + '}';
    }
}
