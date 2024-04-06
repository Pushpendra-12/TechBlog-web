
package com.techBlog.dao;
import java.sql.*;

public class LikeDao {
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    
    public boolean doLike(int pid, int uid){
        
        boolean f = false;
        try {
            
            String query = "INSERT INTO liked (pid, uid) VALUES(?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,pid);
            ps.setInt(2,uid);
            ps.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public int countLikeOnPost(int pid){
        int count = 0;
        
        try {
            
            String query = "SELECT COUNT(*) FROM liked WHERE pid = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,pid);
            ResultSet set =  ps.executeQuery();
            
            if(set.next()){
                count = set.getInt("COUNT(*)");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return count;
    }
    
    
    public boolean isLikedByUser(int pid, int uid){
        boolean f = false;
        
        try {
            
            String query = "SELECT * FROM liked WHERE pid = ? AND uid = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,pid);
            ps.setInt(2,uid);
            ResultSet set =  ps.executeQuery();
            
            if(set.next()){
                f = true;
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
    public boolean deleteLike(int pid, int uid){
        boolean f = false;
        
        try {
            
            PreparedStatement ps = con.prepareStatement("DELETE FROM liked WHERE pid = ? AND uid = ?");
            ps.setInt(1, pid);
            ps.setInt(2,uid);
            ps.executeUpdate();
            f = true;
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    
}
