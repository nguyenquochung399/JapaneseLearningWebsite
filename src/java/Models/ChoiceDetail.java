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
public class ChoiceDetail {
    private String User;
    private String Test;
    private String Question;
    private String Answer;

    public ChoiceDetail() {
    }

    public ChoiceDetail(String User, String Test, String Question, String Answer) {
        this.User = User;
        this.Test = Test;
        this.Question = Question;
        this.Answer = Answer;
    }

    public String getUser() {
        return User;
    }

    public void setUser(String User) {
        this.User = User;
    }

    public String getTest() {
        return Test;
    }

    public void setTest(String Test) {
        this.Test = Test;
    }

    public String getQuestion() {
        return Question;
    }

    public void setQuestion(String Question) {
        this.Question = Question;
    }

    public String getAnswer() {
        return Answer;
    }

    public void setAnswer(String Answer) {
        this.Answer = Answer;
    }

    @Override
    public String toString() {
        return "ChoiceDetail{" + "User=" + User + ", Test=" + Test + ", Question=" + Question + ", Answer=" + Answer + '}';
    }
    
    
}
