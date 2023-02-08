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
public class ForumAllReportPost {
    public ForumAllReportPost(){
        
    }
    
    private int report_post_id;
    private String report_post_reason;
    private int post_id;
    private String post_title;
    private String post_content;
    private String post_edit_date;
    private String username;
    private String report_post_date;

    public ForumAllReportPost(int report_post_id, String report_post_reason, int post_id, String post_title, String post_content, String post_edit_date, String username, String report_post_date) {
        this.report_post_id = report_post_id;
        this.report_post_reason = report_post_reason;
        this.post_id = post_id;
        this.post_title = post_title;
        this.post_content = post_content;
        this.post_edit_date = post_edit_date;
        this.username = username;
        this.report_post_date = report_post_date;
    }

    public int getReport_post_id() {
        return report_post_id;
    }

    public void setReport_post_id(int report_post_id) {
        this.report_post_id = report_post_id;
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

    public String getPost_title() {
        return post_title;
    }

    public void setPost_title(String post_title) {
        this.post_title = post_title;
    }

    public String getPost_content() {
        return post_content;
    }

    public void setPost_content(String post_content) {
        this.post_content = post_content;
    }

    public String getPost_edit_date() {
        return post_edit_date;
    }

    public void setPost_edit_date(String post_edit_date) {
        this.post_edit_date = post_edit_date;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getReport_post_date() {
        return report_post_date;
    }

    public void setReport_post_date(String report_post_date) {
        this.report_post_date = report_post_date;
    }
    
}
