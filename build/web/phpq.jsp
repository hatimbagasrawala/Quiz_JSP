<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script>
            var counter = 1;
            function visible(n)
            {
                counter = n;
                document.getElementById("a" + n).style.display = "block";

                for (var i = 1; i <= 5; i++)
                {
                    if (i == n) {
                        document.getElementById("l" + i).className = "active";
                    }
                    else
                    {
                        document.getElementById("a" + i).style.display = "none";
                        document.getElementById("l" + i).className = "";
                    }
                }
            }
            function load()
            {
                document.getElementById("a1").style.display = "block"
            }

            function check(a)
            {
                if (a == 'next')
                {
                    if (counter == 5)
                    {
                        counter = 0;
                    }
                    counter++;
                    visible(counter);
                }
                else
                {
                    if (counter == 1)
                    {
                        counter = 6;
                    }
                    counter--;
                    visible(counter);
                }
            }
        </script>
    </head>

    <body class="pagebackground" onload="load()" background="quizback.jpg">
        <%if(session.getAttribute("uname")== null)
        {
            response.sendRedirect("Login.html");
        }%>
    <center>
        <div class="page" >
            <div class="main" style="font-size: 2em">     
                <center><b><h1>!!BEST OF LUCK FOR PHP QUIZ!!</h1></b></center><br>
                <form method="post" action="result.jsp">  
                    <%
                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                        } catch (ClassNotFoundException cnfe) {
                            System.err.println("Driver not found.");
                        }
                        try {
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "");
                            String sql = "select * from questions where subject='php' order by RAND()";
                            Statement st = conn.createStatement();
                            ResultSet rs = st.executeQuery(sql);
                            int count = 1;
                            int i = 0;
                            String arr[] = new String[5];
                            while (rs.next()) {
                                String q = rs.getString(2);
                                String op1 = rs.getString(3);
                                String op2 = rs.getString(4);
                                String op3 = rs.getString(5);
                                String op4 = rs.getString(8);
                                arr[i] = q;
                    %>
                    <div id="a<%=count%>" name="a<%=count%>" style="display: none;"><%=count%>) <b><%=q%></b><br><br>
                        A&nbsp;<input type="radio" name="opt<%=count%>" value="<%=op1%>" >&nbsp;&nbsp;<%=op1%> <br><br>
                        B&nbsp;<input type="radio" name="opt<%=count%>" value="<%=op2%>" >&nbsp;&nbsp;<%=op2%> <br><br>
                        C&nbsp;<input type="radio" name="opt<%=count%>" value="<%=op3%>" >&nbsp;&nbsp;<%=op3%> <br><br>
                        D&nbsp;<input type="radio" name="opt<%=count%>" value="<%=op4%>" >&nbsp;&nbsp;<%=op4%> <br><br>
                    </div>
                    <%
                                count++;
                                i++;
                            }
                            session.setAttribute("qarr", arr);
                        } catch (SQLException e) {
                            out.println(e.getMessage());
                        }
                    %>

                    <ul class="pagination">
                        <li ><a href="#" id="prev"  onclick="check(this.id)" >Previous</a></li>
                        <li id="l1" class="active"><a  href="#a1" id="1" onclick="visible(this.id)">1</a></li>
                        <li id="l2"><a href="#a2" id="2" onclick="visible(this.id)">2</a></li>
                        <li id="l3"><a href="#a3" id="3" onclick="visible(this.id)">3</a></li>
                        <li id="l4"><a href="#a4" id="4" onclick="visible(this.id)">4</a></li>
                        <li id="l5"><a href="#a5" id="5" onclick="visible(this.id)">5</a></li>
                        <li ><a  href="#" id="next" onclick="check(this.id)"  >Next</a></li>
                    </ul>
                    

                    <input type="hidden" value="php" name="sub">
                    <br>
                    <input type="submit" class="btn btn-success" style="border:1px solid black;"  name="button" value="Result">
                    <br>
                    <a href="Profile.jsp" class="btn btn-danger" style="border:1px solid black;" >Exit</a>
                    </center
                </form>
                </center

            </div>
        </div>
    </center>
</body>
</html>
