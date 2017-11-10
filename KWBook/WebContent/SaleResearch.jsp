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
<% boolean isLogin = false; 
   boolean isManager = false; 
%>

<style> 
.logoutImg {  position:absolute; top:32px; right: 25%;   }
.loginImg {  position:absolute; top:32px; right: 25%;   }
.JoinImg {  position:absolute; top:30px; right: 21%;   }
.MyPageImg {  position:absolute; top:32px; right: 15%;   }
.CartImg {  position:absolute; top:25px; right: 11%;   }
.MemeberImg {  position:absolute; top:32px; right: 19%;   }
.RegisterImg {  position:absolute; top:32px; right: 9%;   }
.SaleImg {  position:absolute; top:30px; right: 1%;   }

.seachImg{  position:absolute; top:10px; left: 90%;   }
.Datesearchbox{ position:absolute; top:200px; width: 400px; left :35%; border:3px solid; padding:10px; color: firebrick;}
.Monthsearchbox{ position:absolute; top:325px; width: 400px; left :35%; border:3px solid; padding:10px; color: firebrick;}
.Logo { width: 200px; }
.MainBook { width: 1400px; }

</style>
</head>
<body>


<!-- DB에서 정보 가져온다. 아이디나 pw를  -->
<% 
String id = null; String pw =null;
String ID =request.getParameter("id");
String PW =request.getParameter("pw");
String grade = null;
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
rs = stmt.executeQuery("select * from user where `ID` ='"+ID+"' AND `Password` ='"+PW+"'");  

while(rs.next()) {
	
	id = rs.getString("ID");
	pw = rs.getString("Password");
	grade = rs.getString("Grade");
	
	   if(id != null)
	       isLogin = true;
	   
	   if(!grade.equals("normal"))
		   isManager = true;
	   
 }
}
catch(SQLException e) {
	isLogin = false;
 } %>
 


<!-- 광운 서점 로고 누르면 ID Pass!! -->
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" src="image\Logo.png" width="200" name="id" value=<%=ID%>>
<input type ="hidden" name="pw" value=<%=PW%>>
</form>


<!-- 여기는 일일검색 form -->
<div class="Datesearchbox">
<form action ="SaleResult.jsp" method="POST">
<!-- 날짜 정하자. -->
<label for="dateSearch">일일 매출 검색</label>
<input name="date" type="date" min="2017-01-01" value="2017-06-01">
<input type="hidden" name="id" value=<%=ID%> > 
<input type="hidden" name="pw" value=<%=PW%> > 
<input type="hidden" name="ismanager" value=<%=isManager%> > 

<!-- 검색 버튼 클릭 -->
<div class="seachImg">
<input type="image" src="image\SearchLogo.png" width="30"> 
</div>
</form>
</div>
     <br> 
     
     
<!-- 여기는 월별검색 form -->
<div class="Monthsearchbox">
<form action ="SaleResult.jsp" method="POST">
<!-- 날짜 정하자. -->

<label for="dateSearch">월별 매출 검색</label>
<input name="month" type="month" min="2017-01" max="2017-06" value="2017-06">
<input type="hidden" name="id" value=<%=ID%> > 
<input type="hidden" name="pw" value=<%=PW%> > 
<input type="hidden" name="ismanager" value=<%=isManager%> > 

<!-- 검색 버튼 클릭 -->
<div class="seachImg">
<input type="image" src="image\SearchLogo.png" width="30"> 
</div>
</form>
</div>
     <br> <hr>


</body>
</html>