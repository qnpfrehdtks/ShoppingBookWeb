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
.DeleteResult {  position:absolute; top:300px; left: 35%;   }

</style>
</head>
<body>


<!-- DB에서 정보 가져온다. 아이디나 pw를  -->
<% 

String ID =request.getParameter("id");
String PW =request.getParameter("pw");

int Stock = Integer.parseInt(request.getParameter("stock"));
int Cost = Integer.parseInt(request.getParameter("cost"));
String Title = request.getParameter("title");
String Author = request.getParameter("author");
String Publisher = request.getParameter("publisher");
String Image = request.getParameter("image");


int BookCost= 0;
int Mileage = 0;

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
stmt.executeUpdate("INSERT INTO book(`title`,`author`,`publisher`,`cost`,`image`,`stock`)"+
		"VALUES ('"+Title+"','"+Author+"','"+Publisher+"','"+Cost+"','"+Image+"','"+Stock+"')");

%>
<!-- 광운 서점 로고 누르면 ID Pass!! -->
<img src ="image\Logo.png" class="logo" width="400">
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" class="DeleteResult" src="image\InsertSuccess.png" width="500" name="id" value=<%=ID%>>
<input type ="hidden" name="pw" value=<%=PW%>>
</form> 

<% 
}
catch(SQLException e) { 
%>
out.println("DB connection error! : " + e.getMessage() ); 
<!-- 실패시 화면 -->
<img src ="image\Logo.png" class="logo" width="400">
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" class="DeleteResult" src="image\InsertFail.png" width="500" name="id" value=<%=ID%>>
<input type ="hidden" name="pw" value=<%=PW%>>
</form>
<%  } %>
 
</body>
</html>