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
public class ForumReportPost {
    public ForumReportPost(){
        
    }
    
    private int report_post_id;
    private int user_report_id;
    private String report_post_reason;
    private int post_id;
    private String report_post_date;

    public ForumReportPost(int report_post_id, int user_report_id,
            String report_post_reason, int post_id,
            String report_post_date) {
        this.report_post_id = report_post_id;
        this.user_report_id = user_report_id;
        this.report_post_reason = report_post_reason;
        this.post_id = post_id;
        this.report_post_date = report_post_date;
    }

    public int getReport_post_id() {
        return report_post_id;
    }

    public void setReport_post_id(int report_post_id) {
        this.report_post_id = report_post_id;
    }

    public int getUser_report_id() {
        return user_report_id;
    }

    public void setUser_report_id(int user_report_id) {
        this.user_report_id = user_report_id;
    }

    public String getReport_post_reason() {
        return report_post_reason;
    }

    public void setReport_post_reason(String report_post_reason) {
        this.report_post_reason = report_post_reason;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public String getReport_post_date() {
        return report_post_date;
    }

    public void setReport_post_date(String report_post_date) {
        this.report_post_date = report_post_date;
    }

    
    
    
}
