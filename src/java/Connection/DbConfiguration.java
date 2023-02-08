/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Connection;

/**
 *
 * @author Nguyen Quoc Hung
 */
public class DbConfiguration {

    public static final String HOST_NAME = "localhost";
    public static final String DB_NAME = "sep490_jpd";
    public static final String DB_PORT = "3306";
    public static final String USER_NAME = "root";
    public static final String PASSWORD = "";
    
    
    
    public static final String DB_DRIVER = "com.mysql.jdbc.Driver";
    public static final int DB_MIN_CONNECTIONS = 5;
    public static final int DB_MAX_CONNECTIONS = 10;
// jdbc:mysql://hostname:port/dbname
    public static final String CONNECTION_URL = "jdbc:mysql://" + HOST_NAME + ":" + DB_PORT + "/" + DB_NAME;

    private DbConfiguration() {
        super();
    }
}
