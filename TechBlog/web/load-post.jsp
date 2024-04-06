<%@page import="com.techBlog.entities.User"%>
<%@page import="com.techBlog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.techBlog.entities.Post"%>
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page import="com.techBlog.dao.PostDao"%>

<div class="row">

<%
    
    User user = (User)session.getAttribute("currentUser");
    
    Thread.sleep(1000);

    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    
    int cid = Integer.parseInt(request.getParameter("cid"));
    List<Post> post = null;
    if(cid == 0){
      post = dao.getAllPost();
    }
    else{
        post = dao.getPostByCatId(cid);
    }
    
   if(post.size() == 0){
        out.println("<h3 class='display-3 text-center' >No Posts in this category..</h3>");
        return;
    }
    
    for(Post p : post){
%>

<div class="col-md-6 mt-2">
    
    <div class="card">
        <img class="card-img-top" src="post-pics/<%= p.getpPic() %>" alt="Card image cap">
        <div class="card-body">
            <b><%= p.getpTitle() %></b>
            <p><%= p.getpContent() %></p>
        </div>
        
        <div class="card-footer primary-bg text-center">
            
            <%
                LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
                
            %>
            <a href="show-post-page.jsp?post_id=<%= p.getPid() %>" class="btn btn-outline-light btn-small">Read more</a>
            <a href="#" onclick="doLike(<%= p.getPid()%>  ,  <%= user.getId() %>)"  class="btn btn-outline-light btn-small"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter"><%= ld.countLikeOnPost(p.getPid()) %></span></a>
            <a href="#" class="btn btn-outline-light btn-small"> <i class="fa fa-commenting-o"></i> <span>20</span></a>
        </div>
        
    </div>
    
</div>


<%
    }

%>

</div>