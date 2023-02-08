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
public class ForumReportNotification {
    public ForumReportNotification(){
        
    }
    
    private int report_notification_id;
    private int userID;
    private String report_notification_content;
    private int post_id;
    private int comment_id;
    private String report_notification_status;

    public ForumReportNotification(int report_notification_id, int userID,
            String report_notification_content, int post_id, 
            int comment_id, String report_notification_status) {
        this.report_notification_id = report_notification_id;
        this.userID = userID;
        this.report_notification_content = report_notification_content;
        this.post_id = post_id;
        this.comment_id = comment_id;
        this.report_notification_status = report_notification_status;
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

    public String getReport_notification_status() {
        return report_notification_status;
    }

    public void setReport_notification_status(String report_notification_status) {
        this.report_notification_status = report_notification_status;
    }

    
    
}
