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
public class ExampleGrammar {

    private int exampleID;
    private int grammarID;
    private String exJ;
    private String exV;

    public ExampleGrammar() {
    }

    public ExampleGrammar(int exampleID, int grammarID, String exJ, String exV) {
        this.exampleID = exampleID;
        this.grammarID = grammarID;
        this.exJ = exJ;
        this.exV = exV;
    }

    public int getExampleID() {
        return exampleID;
    }

    public void setExampleID(int exampleID) {
        this.exampleID = exampleID;
    }

    public int getGrammarID() {
        return grammarID;
    }

    public void setGrammarID(int grammarID) {
        this.grammarID = grammarID;
    }

    public String getExJ() {
        return exJ;
    }

    public void setExJ(String exJ) {
        this.exJ = exJ;
    }

    public String getExV() {
        return exV;
    }

    public void setExV(String exV) {
        this.exV = exV;
    }

    @Override
    public String toString() {
        return "ExampleGrammar{" + "exampleID=" + exampleID + ", grammarID=" + grammarID + ", exJ=" + exJ + ", exV=" + exV + '}';
    }
}
