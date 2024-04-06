
package com.techBlog.dao;
import com.techBlog.entities.User;
import java.sql.*;

public class UserDao {
    
    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }
    
    // insert user into database
    
    public boolean saveUser(User user){
        boolean f = false;
        try{
            
            String query = "INSERT INTO user(name,email,password,gender,about) VALUES(?,?,?,?,?)";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setString(1, user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4,user.getGender());
            ps.setString(5, user.getAbout());
            
            ps.executeUpdate();
            f = true;
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    //Login method
    
    public User getUserByEmailAndPassword(String email, String password){
        User user = null;
        
        try{
            
            String query = "SELECT * FROM user WHERE email = ? AND password = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                
                user = new User();
                String name = rs.getString("name");
                user.setName(name);
                
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        
        
        return user;
        
    }
    
    
    public boolean updateUser(User user){
        boolean f = false;
        try{
            
            String query = "UPDATE user SET name = ?, email = ?, password = ?, gender = ?, about = ?, profile = ? WHERE id = ?";
            
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,user.getName());
            ps.setString(2, user.getEmail());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getGender());
            ps.setString(5, user.getAbout());
            ps.setString(6, user.getProfile());
            ps.setInt(7, user.getId());
            
            ps.executeUpdate();
            f = true;
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return f;
    }
    
    
    public User getUserByUserId(int userId){
        
        User user = null;
        
        try{
            
            String query = "SELECT * FROM user WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,userId);
            ResultSet rs = ps.executeQuery();
            
            if(rs.next()){
                user = new User();
                String name = rs.getString("name");
                user.setName(name);
                
                user.setId(rs.getInt("id"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setGender(rs.getString("gender"));
                user.setAbout(rs.getString("about"));
                user.setDateTime(rs.getTimestamp("rdate"));
                user.setProfile(rs.getString("profile"));
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
}
