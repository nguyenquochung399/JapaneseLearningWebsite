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
public class ForumPost {
    public ForumPost(){
        
    }
    
    private int post_id;
    private int topic_id;
    private String post_title;
    private String post_content;
    private int user_id;
    private String post_date;
    private String post_edit_date;
    private String post_status;

    public ForumPost(int post_id, int topic_id, String post_title,
            String post_content, int user_id, String post_date,
            String post_edit_date, String post_status) {
        this.post_id = post_id;
        this.topic_id = topic_id;
        this.post_title = post_title;
        this.post_content = post_content;
        this.user_id = user_id;
        this.post_date = post_date;
        this.post_edit_date = post_edit_date;
        this.post_status = post_status;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
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

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getPost_date() {
        return post_date;
    }

    public void setPost_date(String post_date) {
        this.post_date = post_date;
    }

    public String getPost_edit_date() {
        return post_edit_date;
    }

    public void setPost_edit_date(String post_edit_date) {
        this.post_edit_date = post_edit_date;
    }

    public String getPost_status() {
        return post_status;
    }

    public void setPost_status(String post_status) {
        this.post_status = post_status;
    }   

}
