<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>SUCCESS</title>
</head>
<body>
<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String email=request.getParameter("email");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bldms","root",""); 
Statement st= con.createStatement(); 
String sql = "delete from bloodbank where email="+email;

try{

 st.executeUpdate(sql);
 
} catch (SQLException e) {
  e.printStackTrace();
}
%>
<br><br>
<b><center>Successfully deleted</center></b><br>
<center><a href="managebldbnk.jsp"><button value="Back">Back</button></a></center>
</body>
</html>