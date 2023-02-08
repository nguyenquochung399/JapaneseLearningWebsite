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
public class ChoiceAndTrueAns {
    private int isTrueans;
    private String choice; 
    private int QuestionID;
    private String Question; 
    private List<String> answer;

    public ChoiceAndTrueAns() {
    }

    public ChoiceAndTrueAns(int isTrueans, String choice, int QuestionID, String Question, List<String> answer) {
        this.isTrueans = isTrueans;
        this.choice = choice;
        this.QuestionID = QuestionID;
        this.Question = Question;
        this.answer = answer;
    }

    public int getIsTrueans() {
        return isTrueans;
    }

    public void setIsTrueans(int isTrueans) {
        this.isTrueans = isTrueans;
    }

    public String getChoice() {
        return choice;
    }

    public void setChoice(String choice) {
        this.choice = choice;
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
        return answer;
    }

    public void setAnswer(List<String> answer) {
        this.answer = answer;
    }

    @Override
    public String toString() {
        return "ChoiceAndTrueAns{" + "isTrueans=" + isTrueans + ", choice=" + choice + ", QuestionID=" + QuestionID + ", Question=" + Question + ", answer=" + answer + '}';
    }

    
}
