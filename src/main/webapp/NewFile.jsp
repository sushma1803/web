<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
 try
    {
    
	 Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","aditya");
     Statement st=con.createStatement();
      ResultSet rs=st.executeQuery("select * from cse5A6");
     ResultSetMetaData rm=rs.getMetaData();
     int col=rm.getColumnCount();
     while(rs.next())
     {
        out.print("<html><body><table cellpadding=20  ALIGN=CENTER HEIGHT=50 WIDTH=100 border=1>"); 
        out.print("<tr>");
      
      for(int i=1;i<=col;i++)
       {
    	 
         out.print("<td>"+rs.getString(i)+"</td>");
          
        }
      out.print("</tr>");
      out.println("</table></body></html>");
     }
	rs.close();
	st.close();
	con.close();
     }
   catch(Exception e)
   { 
   }%>
</body>
</html>