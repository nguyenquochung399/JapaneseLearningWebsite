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
public class ForumAllComment {
    public ForumAllComment(){
        
    }
    
    private String avatar;
    private String username;
    private String comment_date;
    private String comment_content;
    private int comment_id;
    private int userID;

    public ForumAllComment(String avatar, String username, String comment_date, String comment_content, int comment_id, int userID) {
        this.avatar = avatar;
        this.username = username;
        this.comment_date = comment_date;
        this.comment_content = comment_content;
        this.comment_id = comment_id;
        this.userID = userID;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }

    public String getComment_content() {
        return comment_content;
    }

    public void setComment_content(String comment_content) {
        this.comment_content = comment_content;
    }

    public int getComment_id() {
        return comment_id;
    }

    public void setComment_id(int comment_id) {
        this.comment_id = comment_id;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    
    
}
