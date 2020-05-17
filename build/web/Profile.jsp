<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    </head>
    <%
    
    if(session.getAttribute("uname")==null)
        {
            response.sendRedirect("Login.html");
        }
          %>    
    <body background="img/1.jpg"> 
        <div style="margin: 0px 100px;padding: 0px 220px;">
            <div class="row">
                <div class="card" style="width:450px">
                    <img class="card-img-top" src="img/java.jpg" alt="Card image">
                    <div class="card-img-overlay">
                        <h4 class="card-title">JAVA BASIC QUIZ</h4>
                        <p class="card-text"></p>
                        <a href="javaq.jsp" class="btn btn-primary">TAKE QUIZ</a>
                    </div>
                </div>    
                <div class="card" style="width:450px">
                    <img class="card-img-top" src="img/PHP.jpg" alt="Card image">
                    <div class="card-img-overlay">
                        <h4 class="card-title">PHP BASIC QUIZ</h4>
                        <p class="card-text"></p>
                        <a href="phpq.jsp" class="btn btn-primary">TAKE QUIZ</a>
                    </div>
                </div>   
            </div>
        </div>
        <div style="margin: 0px 100px;padding: 0px 220px;">
            <div class="row">
                <div class="card" style="width:450px">
                    <img class="card-img-top" src="img/mq_1.jpg" alt="Card image">
                    <div class="card-img-overlay">
                        <h4 class="card-title">MOVIE QUIZ</h4>
                        <p class="card-text"></p>
                        <a href="movieq.jsp" class="btn btn-primary">TAKE QUIZ</a>
                    </div>
                </div>    
                <div class="card" style="width:450px">
                    <img class="card-img-top" src="img/gk.png" alt="Card image">
                    <div class="card-img-overlay">
                        <h4 class="card-title">RANDOM QUIZ</h4>
                        <p class="card-text"></p>
                        <a href="generalq.jsp" class="btn btn-primary">TAKE QUIZ</a>
                    </div>
                </div>   
            </div>
        </div>
    <center><h1 style="color: black; font-family: fantasy; ">WELCOME <%= session.getAttribute("uname")%></h1>
        <a href="Rules.jsp" class="btn btn-warning">RULES</a>
         <a href="Login.html" class="btn btn-danger">LOGOUT</a>  </center> 
    </body>
</html>
