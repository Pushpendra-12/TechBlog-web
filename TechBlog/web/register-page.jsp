
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register</title>

        <!--CSS-->
        <link href="css/style.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <style>
            .banner-bg{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 88%, 66% 100%, 31% 94%, 0 99%, 0 0);
            }
        </style>
    </head>
    <body>

        <%@include file="Navbar.jsp" %>

        <main class="primary-bg banner-bg" style="padding-bottom: 80px">
            <div class="container">
                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <div class="card-header text-center text-white" style="background: #3f51b5;">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <br>
                            <p>Register here</p>
                        </div>

                        <div class="card-body">

                            <form id="reg-form" action="RegisterServlet" method="post" autocomplete="off" >

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter name">    
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="user_gender" value="male"> Male
                                    <input type="radio" id="gender" name="user_gender" value="female"> Female
                                </div>

                                <div class="form-group">
                                    <textarea name="about" class="form-control"  rows="5" placeholder="Enter about yourself"></textarea>
                                </div>

                                <div class="form-check">
                                    <input type="checkbox" name="check" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms and conditions</label>
                                </div>
                                <br>
                                <div class="container text-center" id="loader" style="display: none">
                                    <span class="fa fa-spinner fa-pulse fa-2x" style="color: #3f51b5"></span>
                                    <h4>Please wait....</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
                            </form>

                        </div>


                    </div>
                </div>
            </div>

        </main>






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
                    console.log("Loaded...");

                    $('#reg-form').on('submit', function (event) {
                        event.preventDefault();

                        let form = new FormData(this);

                        $("#submit-btn").hide();
                        $("#loader").show();

                        $.ajax({

                            url: "RegisterServlet",
                            type: 'POST',
                            data: form,
                            success: function (data, textStatus, jqXHR) {
                                console.log(data);
                                $("#submit-btn").show();
                                $("#loader").hide();
                                
                                if(data.trim() === 'done'){
                                    
                                swal("Registered successfully..  redirect to login ")
                                        .then((value) => {
                                            window.location = "login-page.jsp";
                                        });
                                    }else{
                                        swal(data);
                                    }
                            },

                            error: function (jqXHR, textStatus, errorThrown) {
                                $("#submit-btn").show();
                                $("#loader").hide();
                                swal("Something went wrong.. try again");
                                       
//                                console.log(jqXHR);
//                                $("#submit-btn").show();
//                                $("#loader").hide();
                            },

                            processData: false,
                            contentType: false

                        });

                    });
                });
        </script>
        
       
        
    </body>
</html>
