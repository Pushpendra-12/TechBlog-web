<%@page import="java.util.ArrayList"%>
<%@page import="com.techBlog.entities.Category"%>
<%@page import="com.techBlog.dao.PostDao"%>
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page import="com.techBlog.entities.Message"%>
<%@page import="com.techBlog.entities.User"%>

<%
    User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login-page.jsp");
        return;
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contact Us</title>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css">
        <!-- Font Awesome -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
        <!-- Custom CSS -->
        <link rel="stylesheet" href="css/style.css">

        <style>
            body{
                background: url("images/blog-bg.jpg");
                background-attachment: fixed;
                background-size: cover;
            }
        </style>

    </head>
    <body>

        <nav class="navbar navbar-expand-lg navbar-dark primary-bg">
            <a class="navbar-brand" href="index.jsp"> <span class="fa fa-external-link-square" ></span> Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="profile.jsp"> <span class="fa fa-home" ></span>  Home <span class="sr-only">(current)</span></a>
                </li>
            </ul>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="profile.jsp">
                            <i class="fas fa-user-circle"></i> <%= user.getName()%>
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <div class="container mt-5">
            <div class="row">
                <!-- Developer's Note -->
                <div class="col-md-4">
                    <div class="card" style="margin-left: -80px; width: 24rem ">
                        <div class="card-header primary-bg text-white">
                            <h5 class="card-title">Developer's Note</h5>
                        </div>
                        <div class="card-body">
                            <p>Developing a full-stack website is a complex endeavor that involves various components and requires expertise in multiple disciplines. While AI can assist in certain aspects of coding, such as generating boilerplate code or suggesting optimizations, it cannot replace human ingenuity and problem-solving skills required for developing a complete and functional website. Writing code involves not just syntax but also understanding business logic, user experience, security considerations, and scalability. Moreover, effective communication between frontend and backend developers is crucial for seamless integration. Ultimately, successful website development demands a combination of technical proficiency, creativity, and collaboration, making it a challenging yet rewarding process.</p>
                        </div>
                    </div>
                </div>

                <!-- Contact Form -->
                <div class="col-md-8">
                    <div class="card">


                        <%

                            Message m = (Message) session.getAttribute("msg");
                            if (m != null) {

                        %>

                        <div class="alert <%= m.getCssClass()%>" role="alert">
                            <%= m.getContent()%>
                        </div>
                        
                        <%
                                session.removeAttribute("msg");
                            }
                        %>

                        <div class="card-header primary-bg text-white">
                            <h5 class="card-title">Contact Us</h5>
                        </div>
                        <div class="card-body">
                            <form action="ContactServlet" method="post" autocomplete="off" >

                                <div class="form-group">
                                    <label for="email">Email address</label>
                                    <input type="email"  name="con-email" class="form-control" id="email" placeholder="Enter your email">
                                </div>
                                <div class="form-group">
                                    <label for="message">Message</label>
                                    <textarea class="form-control" name="con-message" id="message" rows="8" placeholder="Enter your message"></textarea>
                                </div>
                                <button type="submit" class="btn primary-bg text-white">Submit</button>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
