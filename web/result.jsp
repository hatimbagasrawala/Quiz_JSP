<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
  <title>Result</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  


</head>
 
    <body background="img/1.jpg"  >
       <div class="page" >
        <div class="main" style="font-size: 3em">     
        <%

            try {
                 Class.forName("com.mysql.jdbc.Driver");
            } catch (ClassNotFoundException cnfe) {
                System.err.println("sql driver not found.");
            }
            try {
                String name = "";
                if (null != request.getParameter("sub")) {
                    name = request.getParameter("sub");
                   
                }
                  Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz","root","");
                String sql = "select answer,question from questions where subject='" + name + "'";
                Statement st = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY);

                ResultSet rs = st.executeQuery(sql);
                int count = 1;
                float result = 0, count1 = 0;
                //String n = "";

                String arr[] = (String[]) session.getAttribute("qarr");

                out.println("<h1 style=\"text-align:center;\">Result</h1><br>");
                out.println("<table style=\"font-size: 0.8em\" class=hovertable border=3 cellspacing=20 cellpadding=20>");
                out.println("<center><tr style=\"font-size:1.3em; font-variant:small-caps;\">"
                        + "<th style=\"text-align: center;\" >QUESTION</th>"
                        + "<th style=\"text-align: center;\" >YOUR ANSWER</th>"
                        + "<th style=\"text-align: center;\" >SAHI JAWAB</th>"
                        + "</tr></center>");
                for (int i = 0; i < 5; i++) {
                    String ques = arr[i];
                    count1++;
                    out.println("<tr align=center>");
                    while (rs.next()) {
                        if (ques.equals(rs.getString("question")))
                        {
                            if (null != request.getParameter("opt" + (i + 1))) 
                            {
                                String ans = request.getParameter("opt" + (i + 1));

                                if (ans.equals(rs.getString("answer"))) 
                                {
                                    out.println("<td><h3 style=text-align:center;color:green>Q" + (i + 1) +". "+ques+"</td>"
                                            + "<td style=color:brown;><h3>"+ans+"</h3>"
                                            +"<td style=color:brown;><h3>"+rs.getString("answer")+"</h3>"
                                            + "</td>");
                                    result++;
                                } 
                                else 
                                {
                                       out.println("<td><h3 style=text-align:center;color:red>Q" + (i + 1) +". "+ques+"</td>"
                                               + "<td style=color:brown;><h3>"+ans+"</h3>"
                                                       +"<td style=color:brown;><h3>"+rs.getString("answer")+"</h3>"
                                                + "</td>");
                                 }

                            } 
                            else {
                                    out.println("<td><h3 style=text-align:center;color:blue>Q" + (i + 1) +". "+ques+"</td>"
                                            + "<td style=color:brown;><h3>----</h3></td>"
                                             +"<td style=color:brown;><h3>"+rs.getString("answer")+"</h3>"
                                            + "");
              
                            }

                        }
                    }
                    out.println("</tr>");
                    rs.first();
                    rs.beforeFirst();
                }
                out.println("</table>");

                float percentage = ((result / count1) * 100);
                out.println("<h1 style=\"text-align:center;\" class=\"result\">Percentage :" + percentage + "%</h1><br>");

            } catch (SQLException e) {
                out.println(e.getMessage());
            }
        %>
        <center><a href="Profile.jsp" class="btn btn-warning">BACK TO PROFILE</a></center>
        >         </div>
    <div class="footer">
      
    </div>
    </div>
    

     
</body>
</html>
