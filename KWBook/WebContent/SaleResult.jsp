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
   boolean isDateSearch = false;
   int DaySum = 0;
   int MonthSum = 0;
   String BookID = "";
   String ID = request.getParameter("id");
   String PW = request.getParameter("pw");
   String Date = request.getParameter("date");
   String Month = request.getParameter("month");
   String strisManger = request.getParameter("ismanager");
   
   boolean isManager = new Boolean(strisManger).booleanValue();


   if(Date!=null)
   {
	   isDateSearch = true;
   }
   else
   {
	   Month = Month+"-01";
   }
   
   
   
   Connection conn = null;
   Statement stmt = null;
   ResultSet rs = null;

   
   Class.forName("com.mysql.jdbc.Driver");
   String url = "jdbc:mysql://localhost:3306/kwbook";
   conn = DriverManager.getConnection(url,"root", "0909qq");
   stmt = conn.createStatement();
   stmt.executeQuery("USE kwbook");

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

.searchResultinfo{ position:relative; top: 30px; left: 10%; }
.sumResultinfo{ position:relative; top: 30px; left: 80%; }
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
Sale Result </h1> <hr> <br>  <br>
<!-- 검색 결과 출력 JSP 활용 -->
<%
 

try 
{
	if(isDateSearch)
	{
        rs = stmt.executeQuery("select * from user,orderlist,book WHERE ID = userID AND bookID = book_id AND buy_Date between '"+Date+"' and ADDDATE('"+Date+"', INTERVAL 1 DAY)");             
	}
	else
	{
		rs = stmt.executeQuery("select * from user,orderlist,book WHERE ID = userID AND bookID = book_id AND buy_Date between '"+Month+"' and LAST_DAY('"+Month+"')");
	}
while(rs.next()) 
{            
	DaySum += Integer.parseInt(rs.getString("cost"));
%>
<!-- 여기는 검색 결과 form -->

<div class="searchResultinfo">
<!-- 도서 판매 현황 -->

 <div style="display:inline" class="infoFont"> Order Number | </div> <%= rs.getString("orderID")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Buyer Name | </div> <%= rs.getString("Name")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Buyer ID | </div> <%= rs.getString("ID")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Buy Date | </div> <%= rs.getString("buy_Date")%> &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Book Title | </div> <%= rs.getString("title")%>  &nbsp; &nbsp;
 <div style="display:inline" class="infoFont"> Cost | </div> <%= rs.getString("cost")%> $ &nbsp; &nbsp;
 
</div>
<hr>
<%
} %>
<!-- 수입 총 힙계  -->

<div class="sumResultinfo">
<div style="display:inline" class="infoFont"> Sum | </div> <%=DaySum%> $ &nbsp; &nbsp;

</div>
<% }
catch(SQLException e) 
{
out.println("DB connection error! : " + e.getMessage() ); 
}

 %><br><br>


</body>
</html>