
package com.techBlog.helper;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    
    public static Connection getConnection(){
        
        try{
            
           if(con == null){
               
                //Load driver class
                Class.forName("com.mysql.cj.jdbc.Driver");

                // Create connection
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/techblog", "root", "abc123");
           }
            
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return con;
    }
}
