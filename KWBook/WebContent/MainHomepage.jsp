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
.searchbox{ position:absolute; top:25px; width: 400px; left :35%; border:3px solid; padding:10px; color: firebrick;}
.Logo { width: 200px; }
.MainBook { width: 1400px; }


.PresidentImg {
    animation-name: PresidentAnimation;
    animation-duration: 1300ms;
    animation-fill-mode:forwards;
    animation-direction:normal;
}

@keyframes PresidentAnimation {
  0% {
    transform: translate(1000px, 111px);
  }
  100% {
    transform: translate(20px, 111px);
  }
}

.KWVerb1 {
    position:absolute;
    top: 130px; 
    left: 40%;
    color: white;
    font-size: 40px;
    font-weight: bold;
    animation-name: KWVerb1;
    animation-duration: 6500ms;
    animation-fill-mode:forwards;
    animation-direction:normal;
}

@keyframes KWVerb1 {
  0% {
    opacity: 0.0;
  }
  100% {
     opacity: 1.0;
  }
}
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

<% if(isLogin){ %>
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
<div class="seachImg">
<input type="image" src="image\SearchLogo.png" width="30"> </div>
</form>
</div>
     <br> <hr>
<%} %>

<!-- 책 메인 이미지 -->
<img class ="MainBook" src ="image\MainBook.jpg">

<!-- 총장님 사진 ㅎ -->
  <div style="position: relative; left:10px; top: -550px;" class ="PresidentImg">
<img src ="image\handle.png"> 
</div>

<!-- 총장님 명언 ㅎ -->
  <div class ="KWVerb1">
 <P>광운대는 서울대를 이길 수 없지만, <br> <br> 광운대생은 서울대생을 이길 수 있다.</P>
</div>


<!--  로그인 한 상태이면  isLogin == true 임. 로그인 한 상태이면 로그 아웃 이미지 뜨게 하자!!! -->
<% if(isLogin){ %>
<form action ="MainHomepage.jsp" method="POST">
<input type ="image" class="logoutImg" src="image\LogoutLogo.png" width="70" name="id" value=<%="null"%>>
</form>
<% } 
else {%>
<!-- 로그인 안한 상태일때 누르면 Login 창으로 -->
<a href=Login.html class="loginImg"><img src="image\LoginLogo.png" width="50"> </a>
<!-- 회원가입 창으로 회원가입도 로그인 한 상태이면 보이지 않음. -->
<a href=Join.html class="JoinImg"><img src="image\JoinLogo.png" width="40"> </a>
<a href=Login.html class="MyPageImg"><img src="image\MyPageLogo.png" width="70"> </a>
<a href=Login.html class="CartImg"><img src="image\CartLogo.png" width="40"> </a>
<% } %>

<% if(isLogin && !isManager){ %>
<!-- 로그인 했을 때 마이페이지로 가는거 -->
<form action ="MyPage.jsp" method="POST">
<input type="hidden" name="id" value=<%=ID%> > 
<input type="hidden" name="pw" value=<%=PW%> > 
<!-- 마이페이지 버튼 클릭 -->
<div class="MyPageImg">
<input type="image" src="image\MyPageLogo.png" width="70"> </div>
</form>

<!-- 로그인 했을 때 카트로 가는거 -->
<form action ="Cart.jsp" method="POST">
<input type="hidden" name="id" value=<%=ID%> > 
<input type="hidden" name="pw" value=<%=PW%> > 
<input type="hidden" name="ismanager" value=<%=isManager%> > 
<!-- 카트 버튼 클릭 -->
<div class="CartImg">
<input type="image" src="image\CartLogo.png" width="40"> </div>
</form>
<!--  매니저가 로그인 한 경우 아이콘의 상태 변회 -->
<%} else if(isLogin && isManager) {%>

<!-- 매니저가 멤버 정보창으로 가는거 -->
<form action ="Member.jsp" method="POST">
<input type="hidden" name="id" value=<%=ID%> > 
<input type="hidden" name="pw" value=<%=PW%> > 
<!-- 마이페이지 버튼 클릭 -->
<div class="MemeberImg">
<input type="image" src="image\MemberLogo.png" width="80"> </div>
</form>

<!-- 매니저가 책 등록 창으로 가는거 -->
<form action ="RegisterBook.jsp" method="POST">
<input type="hidden" name="id" value=<%=ID%> > 
<input type="hidden" name="pw" value=<%=PW%> > 
<!-- 카트 버튼 클릭 -->
<div class="RegisterImg">
<input type="image" src="image\BookRegisterLogo.png" width="130"> </div>
</form>

<!-- 매니저가 판매 현황 등록 창으로 가는거 -->
<form action ="SaleResearch.jsp" method="POST">
<input type="hidden" name="id" value=<%=ID%> > 
<input type="hidden" name="pw" value=<%=PW%> > 
<!-- 카트 버튼 클릭 -->
<div class="SaleImg">
<input type="image" src="image\SaleResultLogo.png" width="110"> </div>
</form>

<% } %>







</body>
</html>