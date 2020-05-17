package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.SQLException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.DriverManager;
import java.sql.Connection;

public final class generalq_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>JSP Page</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js\"></script>\n");
      out.write("        <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("        <script>\n");
      out.write("            var counter = 1;\n");
      out.write("            function visible(n)\n");
      out.write("            {\n");
      out.write("                counter = n;\n");
      out.write("                document.getElementById(\"a\" + n).style.display = \"block\";\n");
      out.write("\n");
      out.write("                for (var i = 1; i <= 5; i++)\n");
      out.write("                {\n");
      out.write("                    if (i == n) {\n");
      out.write("                        document.getElementById(\"l\" + i).className = \"active\";\n");
      out.write("                    }\n");
      out.write("                    else\n");
      out.write("                    {\n");
      out.write("                        document.getElementById(\"a\" + i).style.display = \"none\";\n");
      out.write("                        document.getElementById(\"l\" + i).className = \"\";\n");
      out.write("                    }\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("            function load()\n");
      out.write("            {\n");
      out.write("                document.getElementById(\"a1\").style.display = \"block\"\n");
      out.write("            }\n");
      out.write("\n");
      out.write("            function check(a)\n");
      out.write("            {\n");
      out.write("                if (a == 'next')\n");
      out.write("                {\n");
      out.write("                    if (counter == 5)\n");
      out.write("                    {\n");
      out.write("                        counter = 0;\n");
      out.write("                    }\n");
      out.write("                    counter++;\n");
      out.write("                    visible(counter);\n");
      out.write("                }\n");
      out.write("                else\n");
      out.write("                {\n");
      out.write("                    if (counter == 1)\n");
      out.write("                    {\n");
      out.write("                        counter = 6;\n");
      out.write("                    }\n");
      out.write("                    counter--;\n");
      out.write("                    visible(counter);\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        </script>\n");
      out.write("    </head>\n");
      out.write("\n");
      out.write("    <body class=\"pagebackground\" onload=\"load()\" background=\"quizback.jpg\">\n");
      out.write("    ");
if(session.getAttribute("uname")== null)
        {
            response.sendRedirect("Login.html");
        }
      out.write("\n");
      out.write("    <center>\n");
      out.write("        <div class=\"page\" >\n");
      out.write("            <div class=\"main\" style=\"font-size: 2em\">     \n");
      out.write("                <center><b><h1>!!BEST OF LUCK FOR GENERAL KNOWLEDGE QUIZ!!</h1></b></center><br>                <form method=\"post\" action=\"result.jsp\">  \n");
      out.write("                    ");

                        try {
                            Class.forName("com.mysql.jdbc.Driver");
                        } catch (ClassNotFoundException cnfe) {
                            System.err.println("Driver not found.");
                        }
                        try {
                            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/quiz", "root", "");
                            String sql = "select * from questions where subject='gq' order by RAND()";
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
                    
      out.write("\n");
      out.write("                    <div id=\"a");
      out.print(count);
      out.write("\" name=\"a");
      out.print(count);
      out.write("\" style=\"display: none;\">");
      out.print(count);
      out.write(") <b>");
      out.print(q);
      out.write("</b><br><br>\n");
      out.write("                        A&nbsp;<input type=\"radio\" name=\"opt");
      out.print(count);
      out.write("\" value=\"");
      out.print(op1);
      out.write("\" >&nbsp;&nbsp;");
      out.print(op1);
      out.write(" <br><br>\n");
      out.write("                        B&nbsp;<input type=\"radio\" name=\"opt");
      out.print(count);
      out.write("\" value=\"");
      out.print(op2);
      out.write("\" >&nbsp;&nbsp;");
      out.print(op2);
      out.write(" <br><br>\n");
      out.write("                        C&nbsp;<input type=\"radio\" name=\"opt");
      out.print(count);
      out.write("\" value=\"");
      out.print(op3);
      out.write("\" >&nbsp;&nbsp;");
      out.print(op3);
      out.write(" <br><br>\n");
      out.write("                        D&nbsp;<input type=\"radio\" name=\"opt");
      out.print(count);
      out.write("\" value=\"");
      out.print(op4);
      out.write("\" >&nbsp;&nbsp;");
      out.print(op4);
      out.write(" <br><br>\n");
      out.write("                    </div>\n");
      out.write("                    ");

                                count++;
                                i++;
                            }
                            session.setAttribute("qarr", arr);
                        } catch (SQLException e) {
                            out.println(e.getMessage());
                        }
                    
      out.write("\n");
      out.write("\n");
      out.write("                    <ul class=\"pagination\">\n");
      out.write("                        <li ><a href=\"#\" id=\"prev\"  onclick=\"check(this.id)\" >Previous</a></li>\n");
      out.write("                        <li id=\"l1\" class=\"active\"><a  href=\"#a1\" id=\"1\" onclick=\"visible(this.id)\">1</a></li>\n");
      out.write("                        <li id=\"l2\"><a href=\"#a2\" id=\"2\" onclick=\"visible(this.id)\">2</a></li>\n");
      out.write("                        <li id=\"l3\"><a href=\"#a3\" id=\"3\" onclick=\"visible(this.id)\">3</a></li>\n");
      out.write("                        <li id=\"l4\"><a href=\"#a4\" id=\"4\" onclick=\"visible(this.id)\">4</a></li>\n");
      out.write("                        <li id=\"l5\"><a href=\"#a5\" id=\"5\" onclick=\"visible(this.id)\">5</a></li>\n");
      out.write("                        <li ><a  href=\"#\" id=\"next\" onclick=\"check(this.id)\"  >Next</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                    \n");
      out.write("\n");
      out.write("                    <input type=\"hidden\" value=\"gq\" name=\"sub\">\n");
      out.write("                    <br>\n");
      out.write("                    <input type=\"submit\" class=\"btn btn-success\" style=\"border:1px solid black;\"  name=\"button\" value=\"Result\">\n");
      out.write("                    <br>\n");
      out.write("                    <a href=\"Profile.jsp\" class=\"btn btn-danger\" style=\"border:1px solid black;\" >Exit</a>\n");
      out.write("                    </center\n");
      out.write("                </form>\n");
      out.write("                </center\n");
      out.write("\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </center>\n");
      out.write("</body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
