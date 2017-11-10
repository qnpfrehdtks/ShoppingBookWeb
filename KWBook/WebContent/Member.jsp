<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

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
   // searchObject는 검색 대상   searchSubject 찾을 대상의 주제(제목, 작가 등등)
   String searchObject =request.getParameter("searchObject");
   String searchSubject =request.getParameter("searchSubject");
   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/kwbook";
   conn = DriverManager.getConnection(url,"root", "0909qq");
   stmt = conn.createStatement();
   stmt.executeQuery("USE kwbook");

%>
<script>
function BookToCart()
{
	

	
}
</script>




    <!-- CSS!! ㅎㅎ -->
<style>

.titleFont{
style="
font-style: italic ;  
font-weight: bold;  
font-size: 1.5em;
line-height: 1.0em;  
color: firebrick;
font-family: arial;
    }
    
.infoFont{
style="
font-style: italic;  
font-weight: bold;  
font-size: 1.0em;
line-height: 0.8em;  
color: firebrick;
font-family: arial;
    }
    
   
.searchResultBox{
    position:relative;  background-color: white;
    width: 1000px;
    height: 50px;
    border: 3px solid firebrick;
    padding: 10px;
    margin: 15px;  left: 5%; 
    }

.searchResultinfo{ position:relative; top: 30px; left: 20%; }
.DeleteImg {  position:relative; top:-30px; left: 70%;   }
.Logo { width: 200px; }

</style>

</head>
<body>

<form action ="MainHomepage.jsp" method="POST">
<input type ="image" src="image\Logo.png" width="200" name="id" value=<%=ID%>>
<input type ="hidden" name="pw" value=<%=PW%>>
</form>
<h1 style="color: firebrick; position:absolute; left: 40%;"> 
Member Information </h1> <hr> <br>  <br>
<!-- 검색 결과 출력 JSP 활용 -->
<%
 

try 
{

rs = stmt.executeQuery("select * from user");             

while(rs.next()) {           
	
%>
<!-- 여기는 검색 결과 form -->

<div class="searchResultinfo">
<!--  회원 정리 -->

 <div style="display:inline" class="infoFont"> ID | </div> <%= rs.getString("ID")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Name | </div> <%= rs.getString("Name")%>  &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Address | </div> <%= rs.getString("Address")%> $ &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Phone Number | </div> <%= rs.getString("PNumber")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Cash | </div> <%= rs.getString("Money")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Mileage | </div> <%= rs.getString("Mileage")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Grade | </div> <%= rs.getString("Grade")%> &nbsp; &nbsp;
  

<form action="DeleteUserProcess.jsp" method="POST">
 <div class="DeleteImg">
<input type="image" src="image\DeleteLogo.png" width="80"> 
</div>

 <input type="hidden" name="id" value=<%=ID%> > 
 <input type="hidden" name="pw" value=<%=PW%> > 
  <input type="hidden" name="userID" value=<%=rs.getString("ID")%> >
</form>
</div>
<hr>
<%
} }
catch(SQLException e) 
{
out.println("DB connection error! : " + e.getMessage() ); 
}

 %><br><br>


</body>
</html>