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
public class Answer {
    private int AnswerID;
    private int QuestionID;
    private String Answer;
    private int isCorrect;
    
    public Answer(){}

    public Answer(int AnswerID, int QuestionID, String Answer, int isCorrect) {
        this.AnswerID = AnswerID;
        this.QuestionID = QuestionID;
        this.Answer = Answer;
        this.isCorrect = isCorrect;
    }

    public int getAnswerID() {
        return AnswerID;
    }

    public void setAnswerID(int AnswerID) {
        this.AnswerID = AnswerID;
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

    public int getIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(int isCorrect) {
        this.isCorrect = isCorrect;
    }

    @Override
    public String toString() {
        return "Answer{" + "AnswerID=" + AnswerID + ", QuestionID=" + QuestionID + ", Answer=" + Answer + ", isCorrect=" + isCorrect + '}';
    }

    
    
}
