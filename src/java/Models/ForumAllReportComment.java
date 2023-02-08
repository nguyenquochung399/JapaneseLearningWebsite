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
public class ForumAllReportComment {
    public ForumAllReportComment(){
        
    }
    
    private String report_comment_reason;
    private String comment_content;
    private String comment_edit_date;
    private String post_title;
    private String post_content;
    private String username;
    private String report_comment_date;
    private int report_comment_id;
    private int comment_id;

    public ForumAllReportComment(String report_comment_reason, String comment_content, String comment_edit_date, String post_title, String post_content, String username, String report_comment_date, int report_comment_id, int comment_id) {
        this.report_comment_reason = report_comment_reason;
        this.comment_content = comment_content;
        this.comment_edit_date = comment_edit_date;
        this.post_title = post_title;
        this.post_content = post_content;
        this.username = username;
        this.report_comment_date = report_comment_date;
        this.report_comment_id = report_comment_id;
        this.comment_id = comment_id;
    }

    public String getReport_comment_reason() {
        return report_comment_reason;
    }

    public void setReport_comment_reason(String report_comment_reason) {
        this.report_comment_reason = report_comment_reason;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public String getComment_edit_date() {
        return comment_edit_date;
    }

    public void setComment_edit_date(String comment_edit_date) {
        this.comment_edit_date = comment_edit_date;
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

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getReport_comment_date() {
        return report_comment_date;
    }

    public void setReport_comment_date(String report_comment_date) {
        this.report_comment_date = report_comment_date;
    }

    public int getReport_comment_id() {
        return report_comment_id;
    }

    public void setReport_comment_id(int report_comment_id) {
        this.report_comment_id = report_comment_id;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }
    
    
}
