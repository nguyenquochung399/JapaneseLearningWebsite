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
public class ansofques {
    private int AnswerID;
    private String Answer;
    private int QuestionID;
    private String Question;
    private int isCorrect;

    public ansofques() {
    }

    public ansofques(int AnswerID, String Answer, int QuestionID, String Question, int isCorrect) {
        this.AnswerID = AnswerID;
        this.Answer = Answer;
        this.QuestionID = QuestionID;
        this.Question = Question;
        this.isCorrect = isCorrect;
    }

    public int getAnswerID() {
        return AnswerID;
    }

    public void setAnswerID(int AnswerID) {
        this.AnswerID = AnswerID;
    }

    public String getAnswer() {
        return Answer;
    }

    public void setAnswer(String Answer) {
        this.Answer = Answer;
    }

    public int getQuestionID() {
        return QuestionID;
    }

    public void setQuestionID(int QuestionID) {
        this.QuestionID = QuestionID;
    }

    public String getQuestion() {
        return Question;
    }

    public void setQuestion(String Question) {
        this.Question = Question;
    }

    public int getIsCorrect() {
        return isCorrect;
    }

    public void setIsCorrect(int isCorrect) {
        this.isCorrect = isCorrect;
    }

    @Override
    public String toString() {
        return "ansofques{" + "AnswerID=" + AnswerID + ", Answer=" + Answer + ", QuestionID=" + QuestionID + ", Question=" + Question + ", isCorrect=" + isCorrect + '}';
    }
    
    
}
