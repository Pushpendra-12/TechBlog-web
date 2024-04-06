
package com.techBlog.dao;
import com.techBlog.entities.Category;
import com.techBlog.entities.Post;
import java.sql.*;
import java.util.*;

public class PostDao {
    
    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }
    
    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list = new ArrayList<>();
        
        try{
            
            String query = "SELECT * FROM categories";
            Statement st = this.con.createStatement();
            ResultSet set = st.executeQuery(query);
            
            while(set.next()){
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category c = new Category(cid, name, description);
                list.add(c);
            }
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return list;
    }
    
    public boolean savePost(Post p){
        boolean f = false;
        
        try{
            
            String query = "INSERT INTO posts (pTitle, pContent, pCode, pPic, catId, userId) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, p.getpTitle());
            ps.setString(2, p.getpContent());
            ps.setString(3, p.getpCode());
            ps.setString(4, p.getpPic());
            ps.setInt(5,p.getCatId());
            ps.setInt(6, p.getUserId());
            
            ps.executeUpdate();
            f = true;
            
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return f;
        
    }
    
    public List<Post> getAllPost(){
        
        List<Post> list = new ArrayList<>();
        
//        fetching all the post
          try {
              String query = "SELECT * FROM posts ORDER BY pid DESC";
              PreparedStatement ps = con.prepareStatement(query);
              ResultSet set = ps.executeQuery();
              
              while(set.next()){
                  
                  
                  int pid = set.getInt("pid");
                  String pTitle = set.getString("pTitle");
                  String pContent = set.getString("pContent");
                  String pCode = set.getString("pCode");
                  String pPic = set.getString("pPic");
                  Timestamp date = set.getTimestamp("pDate");
                  int catId = set.getInt("catId");
                  int userId = set.getInt("userId");
                  
                  Post post = new Post(pid,pTitle,pContent, pCode, pPic,date,catId, userId);
                  list.add(post);
                  
              }
              
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        
        return list;
    }
    
    public List<Post> getPostByCatId(Integer catId){
        List<Post> list = new ArrayList<>();
        
        // get all Post by  cat Id
        
        try {
              String query = "SELECT * FROM posts WHERE catId = ?";
              PreparedStatement ps = con.prepareStatement(query);
              ps.setInt(1, catId);
              ResultSet set = ps.executeQuery();
              
              while(set.next()){
                  
                  
                  int pid = set.getInt("pid");
                  String pTitle = set.getString("pTitle");
                  String pContent = set.getString("pContent");
                  String pCode = set.getString("pCode");
                  String pPic = set.getString("pPic");
                  Timestamp date = set.getTimestamp("pDate");
                  int userId = set.getInt("userId");
                  
                  Post post = new Post(pid,pTitle,pContent, pCode, pPic,date,catId, userId);
                  list.add(post);
                  
              }
              
        } catch (Exception e) {
            
            e.printStackTrace();
        }
        return list;
    }
    
    public Post getPostByPostId(int postId){
        
        Post p = null;
        
        try{
            String query = "SELECT * FROM posts WHERE pid=?";
            PreparedStatement ps = this.con.prepareStatement(query);
            ps.setInt(1,postId);
            
            ResultSet set = ps.executeQuery();
            if(set.next()){
               
                  int pid = set.getInt("pid");
                  String pTitle = set.getString("pTitle");
                  String pContent = set.getString("pContent");
                  String pCode = set.getString("pCode");
                  String pPic = set.getString("pPic");
                  Timestamp date = set.getTimestamp("pDate");
                  int userId = set.getInt("userId");
                  int catId = set.getInt("catId");
                  p = new Post(pid, pTitle, pContent, pCode, pPic,date, catId, userId);
            }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        return p;
    }
}
