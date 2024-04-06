
<%@page import="com.techBlog.helper.ConnectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <!--CSS-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        
        <style>
            .banner-bg{
               clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 89%, 62% 85%, 31% 100%, 0 89%, 0 0);
            }
        </style>
    </head>
    <body>

        <!--Navbar-->

        <%@include file="Navbar.jsp" %>

        <!--Banner-->

        <div class="container-fluid p-0 m-0 banner-bg">

            <div class="jumbotron text-white primary-bg" style="background: #3f51b5">

                <div class="container">
                    <h3 class="display-3">Welcome to tech blog</h3>
                    <p>A programming language is a system of notation for writing computer programs.[1]

                        Programming languages are described in terms of their syntax (form) and semantics (meaning), usually defined by a formal language.</p>
                    <p>Computer architecture has strongly influenced the design of programming languages, 
                        with the most common type (imperative languages—which implement operations in a specified order) developed to perform well on the popular von Neumann architecture.
                    </p>

                    <a href="register-page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-plus"></span>  Start now</a>
                    <a href="login-page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-user-circle fa-spin"></span>  Login</a>
                </div>

            </div>


        </div>

        <!-- cards-->
        <div class="container">
            <div class="row mb-3">

                <div class="col-md-4">
                    <div class="card" ">
                        
                        <div class="card-body">
                            <h5 class="card-title">Java Programming Language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-bg text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" ">
                        
                        <div class="card-body">
                            <h5 class="card-title">Python Programming Language</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-bg text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" ">
                        
                        <div class="card-body">
                            <h5 class="card-title">Android Development</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-bg text-white">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">

                <div class="col-md-4">
                    <div class="card" ">
                        
                        <div class="card-body">
                            <h5 class="card-title">Data Structures</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-bg text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" ">
                        
                        <div class="card-body">
                            <h5 class="card-title">Spring framework</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-bg text-white">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card" ">
                        
                        <div class="card-body">
                            <h5 class="card-title">MySQL</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn primary-bg text-white">Read more</a>
                        </div>
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


    </body>
</html>
