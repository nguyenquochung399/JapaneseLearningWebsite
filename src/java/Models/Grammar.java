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
public class Grammar {

    private int grammarID;
    private String levelID;
    private String structure;
    private String use;

    @Override
    public String toString() {
        return "Grammar{" + "grammarID=" + grammarID + ", levelID=" + levelID + ", structure=" + structure + ", use=" + use + '}';
    }

    public Grammar() {

    }

    public Grammar(int grammarID, String levelID, String structure, String use) {
        this.grammarID = grammarID;
        this.levelID = levelID;
        this.structure = structure;
        this.use = use;

    }

    public int getGrammarID() {
        return grammarID;
    }

    public void setGrammarID(int grammarID) {
        this.grammarID = grammarID;
    }

    public String getLevel() {
        return levelID;
    }

    public void setLevel(String levelID) {
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
}
