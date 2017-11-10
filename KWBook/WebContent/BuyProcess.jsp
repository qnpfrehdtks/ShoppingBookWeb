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
String tempID = request.getParameter("bookID");
int BookID = Integer.parseInt(tempID);
int CartID = Integer.parseInt(request.getParameter("cartID"));
int MileageCost = Integer.parseInt(request.getParameter("mileage"));
int BookCost= 0;
int bonusMileage = 0;


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
rs = stmt.executeQuery("select * from book where `book_id`='"+BookID+"'");   

while(rs.next())
{
BookCost = Integer.parseInt(rs.getString("cost"));
bonusMileage = BookCost / 10;
}

rs = stmt.executeQuery("select * from user where `ID`='"+ID+"'");

int curMoney = 0;
int curMileage = 0;

while(rs.next())
{
	// 고객이 가진 현재 돈과 현재 마일리지 가져옴.
	curMoney = Integer.parseInt(rs.getString("Money"));
	curMileage = Integer.parseInt(rs.getString("Mileage"));
	
	
	// 내가 사용하고자 하는 마일리지가 내가 가진 마일리지 보더 부족하면 예외 발생
	if(curMileage < MileageCost)
	{
		throw new SQLException();
	}
	// 만약 돈이 부족하면 예외 발생.
	if(curMoney < BookCost - MileageCost )
	{           
		throw new SQLException();
	}
	
	
	
}

stmt.executeUpdate("insert into orderlist(`userID`,`bookID`) VALUES ('"+ID+"','"+BookID+"');");
stmt.executeUpdate("DELETE FROM cartlist WHERE `cart_id` = '"+CartID+"'");

if(MileageCost > 0)  // 마일리지를 1원이라도 사용하면 마일리지 안줌.
stmt.executeUpdate("UPDATE user SET `Money` = `Money` - '"+BookCost+"', `Mileage` = `Mileage` - '"+MileageCost+"' WHERE `ID`='"+ID+"'");
else  // 마일리지 현금으로만 계산하면 줌.
	stmt.executeUpdate("UPDATE user SET `Money` = `Money` - '"+BookCost+"', `Mileage` = `Mileage` + '"+bonusMileage+"' WHERE `ID`='"+ID+"'");

%>
<!-- 광운 서점 로고 누르면 ID Pass!! -->
<img src ="image\Logo.png" class="logo" width="400">
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" class="joinResult" src="image\BuySuccess.png" width="500" name="id" value=<%=ID%>>
<input type ="hidden" name="pw" value=<%=PW%>>
</form> 

<% 
}
catch(SQLException e) { 
	out.println("DB connection error! : " + e.getMessage() );
%>


<!-- 실패시 화면 -->
<img src ="image\Logo.png" class="logo" width="400">
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" class="joinResult" src="image\BuyFail.png" width="500" name="id" value=<%=ID%> >
<input type ="hidden" name="pw" value=<%=PW%>>
</form>
<%  } %>
 





</body>
</html>