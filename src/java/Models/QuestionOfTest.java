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
public class QuestionOfTest {
    private int TestID;
    private int QuestionID;
    private String Question;
    private String Test;

    public QuestionOfTest() {
    }

    public QuestionOfTest(int TestID, int QuestionID, String Question, String Test) {
        this.TestID = TestID;
        this.QuestionID = QuestionID;
        this.Question = Question;
        this.Test = Test;
    }

    public int getTestID() {
        return TestID;
    }

    public void setTestID(int TestID) {
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

    public String getTest() {
        return Test;
    }

    public void setTest(String Test) {
        this.Test = Test;
    }

    @Override
    public String toString() {
        return "QuestionOfTest{" + "TestID=" + TestID + ", QuestionID=" + QuestionID + ", Question=" + Question + ", Test=" + Test + '}';
    }

    
}
