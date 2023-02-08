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
public class ForumAllNotification {
    public ForumAllNotification(){
        
    }
    private int report_notification_id;
    private int userID;
    private String report_notification_content;
    private int post_id;
    private int comment_id;    
    private String post_title;
    private String post_content;
    private String post_date;
    private String post_status;
    private String comment_content;
    private String comment_date;

    public ForumAllNotification(int report_notification_id, int userID, String report_notification_content, int post_id, int comment_id, String post_title, String post_content, String post_date, String post_status, String comment_content, String comment_date) {
        this.report_notification_id = report_notification_id;
        this.userID = userID;
        this.report_notification_content = report_notification_content;
        this.post_id = post_id;
        this.comment_id = comment_id;
        this.post_title = post_title;
        this.post_content = post_content;
        this.post_date = post_date;
        this.post_status = post_status;
        this.comment_content = comment_content;
        this.comment_date = comment_date;
    }

    public int getReport_notification_id() {
        return report_notification_id;
    }

    public void setReport_notification_id(int report_notification_id) {
        this.report_notification_id = report_notification_id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getReport_notification_content() {
        return report_notification_content;
    }

    public void setReport_notification_content(String report_notification_content) {
        this.report_notification_content = report_notification_content;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
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

    public String getPost_date() {
        return post_date;
    }

    public void setPost_date(String post_date) {
        this.post_date = post_date;
    }

    public String getPost_status() {
        return post_status;
    }

    public void setPost_status(String post_status) {
        this.post_status = post_status;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }

    
}
