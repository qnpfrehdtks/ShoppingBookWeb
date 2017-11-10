<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<% 
   String BookID = "";
   String ID = request.getParameter("id");
   String PW = request.getParameter("pw");
   String strisManger = request.getParameter("ismanager");
   
   boolean isManager = new Boolean(strisManger).booleanValue();


   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/kwbook";
   conn = DriverManager.getConnection(url,"root", "0909qq");
   stmt = conn.createStatement();
   stmt.executeQuery("USE kwbook");

%>



<style> 
.RegisterImg {  position:absolute; top:340px; left: 18%;   }
.Logo { width: 200px; }
.registerbox{ position:absolute; top:230px; width: 350px; height: 400px; left :40%; border:5px solid; padding:10px; color: firebrick;}
</style>
</head>
<body>


<form action ="MainHomepage.jsp" method="POST">
<input type ="image" src="image\Logo.png" width="200" name="id" value=<%=ID%>>
<input type ="hidden" name="pw" value=<%=PW%>>
</form>


<h1 style="color: firebrick; position:absolute; left: 40%; top:120px;"> 
    Register BOOK!! </h1> <br> <hr>


<!-- 여기는 책 등록 form -->
<div id ="loginform" class="registerbox">
<form action ="BookRegisterProcess.jsp" method="POST">
    <br>
<br>
 Title <br> <input type="text" name="title" size="30"> <br>
 Author <br> <input type="text" name="author" size="30"><br>
 Publisher <br> <input type="text" name="publisher" size="30"> <br> 
 Cost <br> <input type="text" name="cost" size="30">$  <br>
 Image <br> <input type="text" name="image" size="30">  <br>
 Stock <br> <input type="text" name="stock" size="5">  <br>

 <!-- 책 등록 완료 버튼 -->
 <div class="RegisterImg">
<input type="image" src="image\BookRegisterLogo2.png" width="250"> </div>
<input type="hidden" name="id" value=<%=ID%>>
<input type="hidden" name="pw" value=<%=PW%>>
</form>
</div>
</body>
</html>