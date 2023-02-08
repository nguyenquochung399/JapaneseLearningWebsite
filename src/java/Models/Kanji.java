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
public class Kanji {

    private int kanjiID;
    private String levelID;
    private String kanji;
    private String meaning;
    private String picture;

    @Override
    public String toString() {
        return "kanji{" + "kanjiID=" + kanjiID + ", levelID=" + levelID + ", kanji=" + kanji + ", meaning=" + meaning + ", picture=" + picture + '}';
    }

    public Kanji() {

    }

    public Kanji(int kanjiID, String levelID, String kanji, String meaning, String picture) {
        this.kanjiID = kanjiID;
        this.levelID = levelID;
        this.kanji = kanji;
        this.meaning = meaning;
        this.picture = picture;
    }

    public int getKanjiID() {
        return kanjiID;
    }

    public void setKanjiID(int kanjiID) {
        this.kanjiID = kanjiID;
    }

    public String getLevel() {
        return levelID;
    }

    public void setLevel(String levelID) {
        this.levelID = levelID;
    }

    public String getKanji() {
        return kanji;
    }

    public void setKanji(String kanji) {
        this.kanji = kanji;
    }

    public String getMeaning() {
        return meaning;
    }

    public void setMeaning(String meaning) {
        this.meaning = meaning;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

}
