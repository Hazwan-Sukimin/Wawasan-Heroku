package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DB {
    private static Connection con;
    
    public static Connection createConnection(){
        try {
            
            // variable getconnection driver manager
            String connectionString = "jdbc:mysql://us-cdbr-east-06.cleardb.net:3306/heroku_57a4cabf532a6ad";
            String dbUsername = "b1a4e6cdd59317";
            String dbPassword = "f6d28928";
            
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            con = DriverManager.getConnection(connectionString,dbUsername,dbPassword);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }
}