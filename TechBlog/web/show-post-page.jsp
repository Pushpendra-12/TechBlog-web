
<%@page import="com.techBlog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.techBlog.dao.UserDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.techBlog.entities.Category"%>
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page import="com.techBlog.dao.PostDao"%>
<%@page import="com.techBlog.entities.Post"%>
<%@page import="com.techBlog.entities.User"%>
<%@page errorPage="error-page.jsp" %>
<%

    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
    }

%>

<%  int postId = Integer.parseInt(request.getParameter("post_id"));
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    Post p = dao.getPostByPostId(postId);

%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%= p.getpTitle()%></title>

        <!--CSS-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .banner-bg{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 66% 100%, 31% 94%, 0 99%, 0 0);
            }

            body{
                background: url(images/blog-bg.jpg);
                background-size: cover;
                background-attachment: fixed;
            }

            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;

            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
        </style>


    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/hi_IN/sdk.js#xfbml=1&version=v19.0" nonce="Co0F8F5L"></script>
</head>
<body>
    <!--NavBar-->
    <nav class="navbar navbar-expand-lg navbar-dark primary-bg">
        <a class="navbar-brand" href="index.jsp"> <span class="fa fa-external-link-square" ></span> Tech Blog<a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active">
                            <a class="nav-link" href="profile.jsp"> <span class="fa fa-home" ></span>  Home <span class="sr-only">(current)</span></a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="fa fa-ellipsis-h"></span>  Categories
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="#">Programming Language</a>
                                <a class="dropdown-item" href="#">Project Implementation</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="#">Data Structures</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="contact.jsp"> <span class="fa fa-address-book-o" ></span> Contact</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#" data-toggle="modal" data-target="#add-post-modal"> <span class="fa fa-asterisk" ></span> Do Post</a>
                        </li>



                    </ul>
                    <ul class="navbar-nav mr-right">

                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal" > <span class="fa fa fa-user-circle" ></span> <%= user.getName()%></a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"> <span class="fas fa-sign-out-alt" ></span> Logout</a>
                        </li>

                    </ul>
                </div>
                </nav>

                <!--End of Navbar-->        



                <!--Main content of Body-->


                <div class="container">

                    <div class="rwo my-4">

                        <div class="col-md-8 offset-md-2">

                            <div class="card">
                                <div class="card-header primary-bg text-white">

                                    <h4 class="post-title" ><%= p.getpTitle()%></h4>

                                </div>

                                <div class="card-body">
                                    <img class="card-img-top my-2" src="post-pics/<%= p.getpPic()%>" alt="Card image cap">

                                    <div class="row my-3 row-user">
                                        <div class="col-md-8">

                                            <%
                                                UserDao ud = new UserDao(ConnectionProvider.getConnection());

                                            %>
                                            <p post-user-info> <a href="#"> <%= ud.getUserByUserId(p.getUserId()).getName()%>  </a> has posted</p>
                                        </div>

                                        <div class="col-md-4">
                                            <p class="post-date"><%= DateFormat.getDateTimeInstance().format(p.getpDate())%></p>
                                        </div>
                                    </div>

                                    <p class="post-content"> <%= p.getpContent()%>  </p>

                                    <br>
                                    <br>
                                    <div class="post-code">
                                        <pre> <%= p.getpCode()%> </pre>
                                    </div>
                                </div>  

                                <div class="card-footer primary-bg">

                                    <%
                                        LikeDao ld = new LikeDao(ConnectionProvider.getConnection());

                                    %>

                                    <a href="#" onclick="doLike(<%= p.getPid()%>, <%= user.getId()%>)"  class="btn btn-outline-light btn-small"> <i class="fa fa-thumbs-o-up"></i> <span class="like-counter" ><%= ld.countLikeOnPost(p.getPid())%></span></a>
                                    <a href="#" class="btn btn-outline-light btn-small"> <i class="fa fa-commenting-o"></i> <span>20</span></a>
                                </div>

                                <div class="card-footer">
                                    <div class="fb-comments" data-href="http://localhost:9494/TechBlog/show-post-page.jsp?post_id=<%= p.getPid()%>" data-width="" data-numposts="5"></div>
                                </div>

                            </div>

                        </div>
                    </div>

                </div>


                <!--End of main content of body-->



                <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header primary-bg text-white text-center">
                                <h5 class="modal-title" id="exampleModalLabel">TechBlog</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <div class="container text-center">
                                    <img src="profile-pics/<%= user.getProfile()%>" class="img-fluid" style="border-radius: 50%; height: 125px; width: 150px"/>
                                    <br>
                                    <h5 class="modal-title mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                                    <!--Profile details-->
                                    <div id="profile-details">
                                        <table class="table">

                                            <tbody>
                                                <tr>
                                                    <th scope="row">ID :</th>
                                                    <td><%= user.getId()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Email :</th>
                                                    <td><%= user.getEmail()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Gender :</th>
                                                    <td><%= user.getGender()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Status :</th>
                                                    <td><%= user.getAbout()%></td>

                                                </tr>
                                                <tr>
                                                    <th scope="row">Registered on :</th>
                                                    <td><%= user.getDateTime().toString()%></td>

                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <!--Profile Edit-->



                                    <div id="profile-edit" style="display: none">
                                        <h3 class="mt-2">Edit carefully</h3>
                                        <form action="EditServlet" method="post" enctype="multipart/form-data">

                                            <table class="table">
                                                <tr>
                                                    <td>ID :</td>
                                                    <td><%= user.getId()%></td>
                                                </tr>
                                                <tr>
                                                    <td>Email :</td>
                                                    <td> <input type="email" name="user_email" value="<%= user.getEmail()%>"  class="form-control"> </td>
                                                </tr>
                                                <tr>
                                                    <td>Name :</td>
                                                    <td> <input type="text" name="user_name" value="<%= user.getName()%>"  class="form-control"> </td>
                                                </tr>
                                                <tr>
                                                    <td>Password :</td>
                                                    <td> <input type="password" name="user_password" value="<%= user.getPassword()%>"  class="form-control"> </td>
                                                </tr>
                                                <tr>
                                                    <td>Gender :</td>
                                                    <td> <%= user.getGender().toUpperCase()%> </td>
                                                </tr>
                                                <tr>
                                                    <td>About :</td>
                                                    <td> <textarea class="form-control" name="user_about" rows="3"><%= user.getAbout()%></textarea> </td>
                                                </tr>
                                                <tr>
                                                    <td>New Profile</td>
                                                    <td><input type="file" name="image" class="form-control" ></td>
                                                </tr>
                                            </table>

                                            <div class="container">
                                                <button class="btn btn-outline-success">Save</button>

                                            </div>   


                                        </form>

                                    </div>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit profile</button>
                            </div>
                        </div>
                    </div>
                </div>

                <!--Add post modal-->


                <!-- Modal -->
                <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Fill the post details</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">

                                <form id="add-post-form" action="AddPostServlet" method="post">

                                    <div class="form-group">
                                        <select class="form-control" name="cid">
                                            <option selected disabled>---Select Category---</option>

                                            <%
                                                PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                                ArrayList<Category> list = postd.getAllCategories();
                                                for (Category c : list) {


                                            %>

                                            <option value="<%= c.getCid()%>" ><%= c.getName()%></option>

                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>


                                    <div class="form-group">
                                        <input type="text" name="pTitle" class="form-control" placeholder="Enter post title" />
                                    </div>

                                    <div class="form-group">
                                        <textarea class="form-control" name="pContent"  style="height: 200px" placeholder="write your content"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <textarea class="form-control" name="pCode" style="height: 200px" placeholder="write your  program codes (IF ANY)"></textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>Add photos regarding your post</label>
                                        <input type="file" name="pic" />
                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-outline-primary">Post</button>
                                    </div>
                                </form>


                            </div>

                        </div>
                    </div>
                </div>



                <!--java script-->
                <script
                    src="https://code.jquery.com/jquery-3.7.1.min.js"
                    integrity="sha256-/JqT3SQfawRcv/BIHPThkBvs0OEvtFFmqPF/lYI/Cxo="
                    crossorigin="anonymous">
                </script>
                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
                <script src="js/myjs.js" type="text/javascript"></script>
                <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                <script>

                                        $(document).ready(function () {

                                            let editStatus = false;


                                            $('#edit-profile-btn').click(function () {

                                                if (editStatus === false) {
                                                    $("#profile-details").hide();

                                                    $("#profile-edit").show();
                                                    editStatus = true;

                                                    $(this).text("Back");

                                                } else {
                                                    $("#profile-details").show();

                                                    $("#profile-edit").hide();
                                                    editStatus = false;
                                                    $(this).text("Edit-profile");
                                                }


                                            });
                                        });

                </script>

                <!--new post JS-->
                <script>
                    $(document).ready(function (e) {


                        $("#add-post-form").on("submit", function (event) {
                            event.preventDefault();
                            console.log("submitted");
                            let form = new FormData(this);
                            $.ajax({
                                url: "AddPostServlet",
                                type: "POST",
                                data: form,
                                success: function (data, textStatus, jqXHR) {
                                    //success
                                    console.log(data);
                                    if (data.trim() == 'done') {
                                        swal("Good job", "Post added successfully", "success");
                                    } else {
                                        swal("Something went wrong!", "Please try again", "error");
                                    }
                                },

                                error: function (jqXHR, textStatus, errorThrown) {
                                    //error
                                    swal("Something went wrong!", "Please try again", "error");
                                },

                                processData: false,
                                contentType: false
                            });
                        });

                    });

                </script>
                </body>
                </html>
