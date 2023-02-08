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
public class Comment {
    public Comment(){
        
    }
    
    private int comment_id;
    private String comment_content;
    private int user_id;
    private String comment_date;
    private String comment_edit_date;
    private int post_id;
    private String comment_status;

    public Comment(int comment_id, String comment_content, int user_id,
            String comment_date, String comment_edit_date, int post_id,
            String comment_status) {
        this.comment_id = comment_id;
        this.comment_content = comment_content;
        this.user_id = user_id;
        this.comment_date = comment_date;
        this.comment_edit_date = comment_edit_date;
        this.post_id = post_id;
        this.comment_status = comment_status;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }

    public String getComment_edit_date() {
        return comment_edit_date;
    }

    public void setComment_edit_date(String comment_edit_date) {
        this.comment_edit_date = comment_edit_date;
    }

    public int getPost_id() {
        return post_id;
    }

    public void setPost_id(int post_id) {
        this.post_id = post_id;
    }

    public String getComment_status() {
        return comment_status;
    }

    public void setComment_status(String comment_status) {
        this.comment_status = comment_status;
    }

    
    
}
