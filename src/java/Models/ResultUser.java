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
public class ResultUser {
    private int ResultID;
    private String User;
    private String Test;
    private String timeBigin;
    private String timeExpire;
    private int Score;
    private int trueQuestion;
    
    public ResultUser() {
    }

    public ResultUser(int ResultID, String User, String Test, String timeBigin, String timeExpire, int Score, int trueQuestion) {
        this.ResultID = ResultID;
        this.User = User;
        this.Test = Test;
        this.timeBigin = timeBigin;
        this.timeExpire = timeExpire;
        this.Score = Score;
        this.trueQuestion = trueQuestion;
    }

    public int getResultID() {
        return ResultID;
    }

    public void setResultID(int ResultID) {
        this.ResultID = ResultID;
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

    public String getTimeBigin() {
        return timeBigin;
    }

    public void setTimeBigin(String timeBigin) {
        this.timeBigin = timeBigin;
    }

    public String getTimeExpire() {
        return timeExpire;
    }

    public void setTimeExpire(String timeExpire) {
        this.timeExpire = timeExpire;
    }

    public int getScore() {
        return Score;
    }

    public void setScore(int Score) {
        this.Score = Score;
    }

    public int getTrueQuestion() {
        return trueQuestion;
    }

    public void setTrueQuestion(int trueQuestion) {
        this.trueQuestion = trueQuestion;
    }

    @Override
    public String toString() {
        return "ResultUser{" + "ResultID=" + ResultID + ", User=" + User + ", Test=" + Test + ", timeBigin=" + timeBigin + ", timeExpire=" + timeExpire + ", Score=" + Score + ", trueQuestion=" + trueQuestion + '}';
    }

    
}

