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
public class Result {
    private int ResultID;
    private int UserID;
    private int TestID;
    private String timeBigin;
    private String timeExpire;
    private int Score;
    private int trueQuestion;
    

    public Result(){}

    public Result(int ResultID, int UserID, int TestID, String timeBigin, String timeExpire, int Score, int trueQuestion) {
        this.ResultID = ResultID;
        this.UserID = UserID;
        this.TestID = TestID;
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
        return "Result{" + "ResultID=" + ResultID + ", UserID=" + UserID + ", TestID=" + TestID + ", timeBigin=" + timeBigin + ", timeExpire=" + timeExpire + ", Score=" + Score + ", trueQuestion=" + trueQuestion + '}';
    }

     
}
