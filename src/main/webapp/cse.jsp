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
<style>
tr{
background-color:#4CAF50;
}
</style>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style="color:white;margin:50px;">
<%
 try
    {
	 String pin=request.getParameter("pin");
	 Class.forName("oracle.jdbc.driver.OracleDriver");
     Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","hr","aditya");
     Statement st=con.createStatement();
     ResultSet rs=st.executeQuery("select * from cse5A6 where pin="+pin);
ResultSetMetaData rm=rs.getMetaData();
     int no=rm.getColumnCount();
     out.print("<table width=40% border=1 style=border-collapse:collapse; cellpadding=20 align=center>");
      out.print("<tr>");
     for(int i=1;i<=no;i++)
   {
     out.println("<th>"+rm.getColumnName(i)+"</th>");
   }
    out.print("</tr>");
      out.print("<tr>");
     while(rs.next())
     {
	out.print("<td>"+rs.getString(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4));
	
     }
     out.print("</tr></table>");
    
	
	st.close();
	con.close();
     }
   catch(Exception e)
   { 
   }%>
</body>
</html>