<!DOCTYPE html>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    




<html>
<head>
<% boolean isLogin = false; %>

<style> 

.logo {  position:absolute; top:150px; left: 37%;   }
.joinResult {  position:absolute; top:300px; left: 35%;   }

</style>
</head>
<body>


<!-- DB에서 정보 가져온다. 아이디나 pw를  -->
<% 

String ID =request.getParameter("id");
String PW =request.getParameter("pw");
String Name = request.getParameter("name");
String Address = request.getParameter("addr");
String PNumber = request.getParameter("pn");

Connection conn = null;
     Statement stmt = null;
     ResultSet rs = null;

try 
{

Class.forName("com.mysql.jdbc.Driver");
String url = "jdbc:mysql://localhost:3306/kwbook";
conn = DriverManager.getConnection(url,"root", "0909qq");
stmt = conn.createStatement();
stmt.executeQuery("USE kwbook");
stmt.executeUpdate("insert into user(`ID`, `Password`, `Name`, `Address`, `PNumber`) VALUES ('"+ID+"','"+PW+"','"+Name+"','"+Address+"','"+PNumber+"');");
%>
<!-- 광운 서점 로고 누르면 ID Pass!! -->
<img src ="image\Logo.png" class="logo" width="400">
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" class="joinResult" src="image\JoinResult.png" width="500" name="id" value=<%=ID%>>
<input type ="hidden" name="pw" value=<%=PW%>>
</form> 

<% 
}
catch(SQLException e) { 
%>
<!-- 실패시 화면 -->
<img src ="image\Logo.png" class="logo" width="400">
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" class="joinResult" src="image\JoinFail.png" width="500">

</form>
<%  } %>
 





</body>
</html>