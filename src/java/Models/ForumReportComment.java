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
public class ForumReportComment {
    public ForumReportComment(){
        
    }
    
    private int report_comment_id;
    private int user_report_id;
    private String report_comment_reason;
    private int comment_id;
    private String report_comment_date;

    public ForumReportComment(int report_comment_id, int user_report_id,
            String report_comment_reason, int comment_id, 
            String report_comment_date) {
        this.report_comment_id = report_comment_id;
        this.user_report_id = user_report_id;
        this.report_comment_reason = report_comment_reason;
        this.comment_id = comment_id;
        this.report_comment_date = report_comment_date;
    }

    public int getReport_comment_id() {
        return report_comment_id;
    }

    public void setReport_comment_id(int report_comment_id) {
        this.report_comment_id = report_comment_id;
    }

    public int getUser_report_id() {
        return user_report_id;
    }

    public void setUser_report_id(int user_report_id) {
        this.user_report_id = user_report_id;
    }

    public String getReport_comment_reason() {
        return report_comment_reason;
    }

    public void setReport_comment_reason(String report_comment_reason) {
        this.report_comment_reason = report_comment_reason;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getReport_comment_date() {
        return report_comment_date;
    }

    public void setReport_comment_date(String report_comment_date) {
        this.report_comment_date = report_comment_date;
    }

    
    
    
}
