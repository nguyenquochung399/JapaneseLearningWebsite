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
public class ForumTopic {
    public ForumTopic(){
        
    }
    
    private int topic_id;
    private String topic_name;
    private String topic_status;

    public ForumTopic(int topic_id, String topic_name, String topic_status) {
        this.topic_id = topic_id;
        this.topic_name = topic_name;
        this.topic_status = topic_status;
    }

    public int getTopic_id() {
        return topic_id;
    }

    public void setTopic_id(int topic_id) {
        this.topic_id = topic_id;
    }

    public String getTopic_name() {
        return topic_name;
    }

    public void setTopic_name(String topic_name) {
        this.topic_name = topic_name;
    }

    public String getTopic_status() {
        return topic_status;
    }

    public void setTopic_status(String topic_status) {
        this.topic_status = topic_status;
    }
    
    
}
