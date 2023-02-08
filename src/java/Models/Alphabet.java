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
public class Alphabet {

    private int alphabetID;
    private String type;
    private String alphabet;
    private String pronounce;

    @Override
    public String toString() {
        return "alphabet{" + "alphabetID=" + alphabetID + ", type=" + type + ", alphabet=" + alphabet + ", pronounce=" + pronounce + '}';
    }

    public Alphabet() {

    }

    public Alphabet(int alphabetID, String type, String alphabet, String pronounce) {
        this.alphabetID = alphabetID;
        this.type = type;
        this.alphabet = alphabet;
        this.pronounce = pronounce;
    }

    public int getAlphabetID() {
        return alphabetID;
    }

    public void setAlphabetID(int alphabetID) {
        this.alphabetID = alphabetID;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getAlphabet() {
        return alphabet;
    }

    public void setAlphabet(String alphabet) {
        this.alphabet = alphabet;
    }

    public String getPronounce() {
        return pronounce;
    }

    public void setPronounce(String pronounce) {
        this.pronounce = pronounce;
    }

}
