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
public class ForumAllPostWithComment {

    public ForumAllPostWithComment() {

    }

    private int post_id;
    private int topic_id;
    private String post_title;
    private String post_content;
    private String post_date;
    private String post_edit_date;
    private String topic_name;
    private String username;
    private String avatar;
    private int comment_count;

    public ForumAllPostWithComment(int post_id, int topic_id, String post_title, String post_content, String post_date, String post_edit_date, String topic_name, String username, String avatar, int comment_count) {
        this.post_id = post_id;
        this.topic_id = topic_id;
        this.post_title = post_title;
        this.post_content = post_content;
        this.post_date = post_date;
        this.post_edit_date = post_edit_date;
        this.topic_name = topic_name;
        this.username = username;
        this.avatar = avatar;
        this.comment_count = comment_count;
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

    public String getTopic_name() {
        return topic_name;
    }

    public void setTopic_name(String topic_name) {
        this.topic_name = topic_name;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public int getComment_count() {
        return comment_count;
    }

    public void setComment_count(int comment_count) {
        this.comment_count = comment_count;
    }

    
}
