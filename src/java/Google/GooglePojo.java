/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Google;

/**
 *
 * @author A Hi
 */
public class GooglePojo {

    private String id;
    private String email;
    private String picture;

    public GooglePojo(String id, String email, String picture) {
        this.id = id;
        this.email = email;
        this.picture = picture;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPicture() {
        return picture;
    }

    public void setPicture(String picture) {
        this.picture = picture;
    }

    @Override
    public String toString() {
        return "GoogleUtils{" + "id=" + id + ", email=" + email + ", picture=" + picture + '}';
    }
}
