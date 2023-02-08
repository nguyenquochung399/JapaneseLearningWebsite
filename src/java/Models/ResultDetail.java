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
public class ResultDetail {
    private int ResultDetailID;
    private int ResultID;
    private int QuestionID;
    private String Answer;

    public ResultDetail(){}

    public ResultDetail(int ResultDetailID, int ResultID, int QuestionID, String Answer) {
        this.ResultDetailID = ResultDetailID;
        this.ResultID = ResultID;
        this.QuestionID = QuestionID;
        this.Answer = Answer;
    }

    public int getResultDetailID() {
        return ResultDetailID;
    }

    public void setResultDetailID(int ResultDetailID) {
        this.ResultDetailID = ResultDetailID;
    }

    public int getResultID() {
        return ResultID;
    }

    public void setResultID(int ResultID) {
        this.ResultID = ResultID;
    }

    public int getQuestionID() {
        return QuestionID;
    }

    public void setQuestionID(int QuestionID) {
        this.QuestionID = QuestionID;
    }

    public String getAnswer() {
        return Answer;
    }

    public void setAnswer(String Answer) {
        this.Answer = Answer;
    }

    @Override
    public String toString() {
        return "ResultDetail{" + "ResultDetailID=" + ResultDetailID + ", ResultID=" + ResultID + ", QuestionID=" + QuestionID + ", Answer=" + Answer + '}';
    }

    
    
}
