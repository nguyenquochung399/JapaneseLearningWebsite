/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Models;

import java.util.List;

/**
 *
 * @author ACER
 */
public class AnswerOfQuestion {
    private int QuestionID;
    private String Question;    
    private List<String> Answer;

    public AnswerOfQuestion() {
    }

    public AnswerOfQuestion(int QuestionID, String Question, List<String> Answer) {
        this.QuestionID = QuestionID;
        this.Question = Question;
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

    public List<String> getAnswer() {
        return Answer;
    }

    public void setAnswer(List<String> Answer) {
        this.Answer = Answer;
    }

    @Override
    public String toString() {
        return "AnswerOfQuestion{" + "QuestionID=" + QuestionID + ", Question=" + Question + ", Answer=" + Answer + '}';
    }

    
    
}
