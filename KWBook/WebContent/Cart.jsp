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
<% String ID = request.getParameter("id");
   String PW = request.getParameter("pw");
   String BookID = request.getParameter("bookID");
   
 String strisManger = request.getParameter("ismanager");
   boolean isManager = new Boolean(strisManger).booleanValue();
   
%>
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
font-style: italic ;  
font-weight: bold;  
font-size: 1.0em;
line-height: 0.8em;  
color: firebrick;
font-family: arial;
    }
    
   
.myPageResultBox{
    position:relative;  background-color: white;
    width: 800px;
    height: 165px;
    border: 3px solid firebrick;
    padding: 20px;
    margin: 25px;  left: 5%; 
    }
    
    .costBox{
    position:absolute;  background-color: white;
    width: 300px;
    height: 100px;
    border: 3px solid firebrick;
    padding: 20px;
    margin: 25px;  left: 70%; top: 120px;
    }
    
.mileageInput{ position:relative; top: -10px; left: 20%; }
.costinfo{ position:relative; top: -5px; left: 30%; }
.searchResultinfo{ position:relative; top: -135px; left: 20%; }
.searchImg{  position:absolute; top:10px; left: 90%;   }
.searchbox{ position:absolute; top:25px; width: 400px; left :35%; border:3px solid; padding:10px; color: firebrick;}
.BuyImg {  position:relative; top:15px; left: 50%;   }


.Logo { width: 200px; }
</style>

</head>
<body>
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" src="image\Logo.png" width="200" name="id" value=<%=ID%>>
<input type ="hidden" name="pw" value=<%=PW%>>
</form>

<!-- 여기는 검색 form -->
<div class="searchbox">
<form action ="SearchResult.jsp" method="POST">
<!-- 검색 종류 머할지 정함. -->
<select name="searchSubject">
    <option value="title" id = "title" selected> title </option>
    <option value="author" id = "author"> author </option>
    <option value="publisher" id = "publisher"> publisher </option> 
    <!-- 검색 입력 -->
</select>

<input type="text" name="searchObject" size="35"> 
<input type="hidden" name="id" value=<%=ID%> > 
<input type="hidden" name="pw" value=<%=PW%> > 
<input type="hidden" name="ismanager" value=<%=isManager%> > 
<!-- 검색 버튼 클릭 -->
<div class="searchImg">
<input type="image" src="image\SearchLogo.png" width="30"> </div>
</form>

</div>
<br>
<h1 style="color: firebrick; position:absolute; left: 40%;"> 
CART LIST </h1> <hr> <br>
<!-- 검색 결과 출력 JSP 활용 -->
<%
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

if(BookID != null)
{
  int ididi = Integer.parseInt(BookID);
  stmt.executeUpdate("insert into cartlist(`userID`, `bookID`) VALUES ('"+ID+"','"+ididi+"');");
}

rs = stmt.executeQuery("select * from book,cartlist where `book_id` = `bookID` AND `userID` = '"+ID+"'");             

while(rs.next()) {        
	String CID = rs.getString("cart_id");
	String BID = rs.getString("book_id");
%>


<!-- 여기는 검색 결과 form -->

<div class="myPageResultBox">

<form action="BuyProcess.jsp" method="POST">
<img src="image\<%=rs.getString("image")%>.jpg" width="120"> 

<div class="searchResultinfo">

 <div class="titleFont"> <%= rs.getString("title")%> <br><br></div> 
 <div style="display:inline" class="infoFont"> Author | </div> <%= rs.getString("author")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Publisher | </div> <%= rs.getString("publisher")%>  &nbsp; &nbsp;
 <br>
 <div style="display:inline" class="infoFont"> Order Date | </div> <%= rs.getString("date")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Cost | </div> <%= rs.getString("cost")%> $ &nbsp; &nbsp; 
 
  <div class="BuyImg">
<input type="image" src="image\BuyLogo.png" width="80"> 
</div>
 <input type="hidden" name="id" value=<%=ID%> > 
 <input type="hidden" name="pw" value=<%=PW%> > 
  <input type="hidden" name="bookID" value=<%=BID%> >
 <div class ="mileageInput">Mileage <input type="text"  name="mileage" value=0 size="10" > </div>
<input type="hidden" name="cartID" value=<%=CID%> >
 </div>
 
</form>
 
</div>

<% } 

rs = stmt.executeQuery("select * from user where `ID` = '"+ID+"'");             
while(rs.next()) { 
%>


<div class="costBox">

<div class="costinfo">
 <div class="titleFont"> My Cash Info <br> </div> </div>
 <div style="display:inline" class="infoFont"> MyCash | </div> <%= rs.getString("Money")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> MyMileage | </div> <%= rs.getString("Mileage")%>  &nbsp; &nbsp;
 <br>
</div>



<%
} } 
catch(SQLException e) {
}
%>

</body>
</html>