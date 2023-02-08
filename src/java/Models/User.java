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
public class User {
    private int userID;
    private String email;
    private String password;
    private String username;
    private String phone;
    private String avatar;
    private String role;

    @Override
    public String toString() {
        return "user{" + "userID=" + userID + ", email=" + email + ", password=" + password + ", username=" + username + ", phone=" + phone + ", avatar=" + avatar + ", role=" + role + '}';
    }

    public User() {

    }

    public User(int userID, String email, String password, String username, String phone, String avatar, String role) {
        this.userID = userID;
        this.email = email;
        this.password = password;
        this.username = username;
        this.phone = phone;
        this.avatar = avatar;
        this.role = role;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
}
