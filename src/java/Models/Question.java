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
public class Question {
    private int QuestionID;
    private String Question;
    private int TestID;
    
    public Question(){}

    public Question(int QuestionID, String Question, int TestID) {
        this.QuestionID = QuestionID;
        this.Question = Question;
        this.TestID = TestID;
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

    public int getTestID() {
        return TestID;
    }

    public void setTestID(int TestID) {
        this.TestID = TestID;
    }

    @Override
    public String toString() {
        return "Question{" + "QuestionID=" + QuestionID + ", Question=" + Question + ", TestID=" + TestID + '}';
    }

    
}
