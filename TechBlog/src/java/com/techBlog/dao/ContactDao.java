
package com.techBlog.dao;
import com.techBlog.entities.User;
import java.sql.*;

public class ContactDao {
    
    Connection con;

    public ContactDao(Connection con) {
        this.con = con;
    }
    
    public boolean saveMessage(int userforeign, String email, String message){
        boolean f = false;
       // User user = new User();
        
        try {
            
            String query = "INSERT INTO contact (userforeign, email, message) VALUES(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userforeign);
            ps.setString(2,email);
            ps.setString(3,message);
            ps.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        
        return f;
    }
    
}
