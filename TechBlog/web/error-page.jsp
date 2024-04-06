
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Error</title>

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

        <div class="container text-center">
            <img src="images/error.png" class="img-fluid" />
            <h3 class="display-3">Sorry ! something went wrong...</h3>
            <p><%= exception%></p>
            <a href="index.jsp" class="btn btn primary-bg btn-lg text-white mt-3">Home</a>
        </div>




    </body>
</html>
