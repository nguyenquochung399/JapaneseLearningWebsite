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
public class ChoiceOfUser {
    private int UserID;
    private int TestID;
    private int QuestionID;
    private String Answer;    

    public ChoiceOfUser() {
    }

    public ChoiceOfUser(int UserID, int TestID, int QuestionID, String Answer) {
        this.UserID = UserID;
        this.TestID = TestID;
        this.QuestionID = QuestionID;
        this.Answer = Answer;
    }

    public int getUserID() {
        return UserID;
    }

    public void setUserID(int UserID) {
        this.UserID = UserID;
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

    public String getAnswer() {
        return Answer;
    }

    public void setAnswer(String Answer) {
        this.Answer = Answer;
    }

    @Override
    public String toString() {
        return "ChoiceOfUser{" + "UserID=" + UserID + ", TestID=" + TestID + ", QuestionID=" + QuestionID + ", Answer=" + Answer + '}';
    }
    
    
}
