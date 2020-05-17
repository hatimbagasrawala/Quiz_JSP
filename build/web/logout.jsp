<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
    <head >
        <title></title>
        <link href="Sites.css" rel="stylesheet" type="text/css" />
        <link rel =Stylesheet type="text/css" href="BaseStyles.css">

    </head>

    <body>

        <form id="Form1">
            <div class="page">
                <div class="header">

                    <div class="title">


                    </div>

                    <div class="clear hideSkiplink"></div>

                    <jsp:include page="nav.jsp"></jsp:include>

                    </div> 


                    <div class="main">
                    <%
                        HttpSession s = request.getSession();
                        session.invalidate();
                        response.sendRedirect("Login.html");
                    %>
                </div>
            </div>
            <div class="footer">

            </div>
        </form>


    </body>
</html>
