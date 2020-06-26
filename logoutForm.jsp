<%@page import="member.model.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"/></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>
<%
//프로젝트 경로 구하기
String path = request.getContextPath();

%>
</head>
<body>
<%
//세션으로부터 아이디를 얻어온다
String id = (String)session.getAttribute("idok");
//아이디에 해당하는 이름을 dao로부터 얻어온다
MemberDAO dao = new MemberDAO();
String name = dao.getName(id);
%>

<br><br>
<b style="color: cyan;"><%=name %>님이 로그인 하셨습니다.</b>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="button" value="로그아웃" 
	onclick="location.href='<%=path%>/login/logoutAction.jsp'">
<hr>
<img alt="" src="<%=path%>/image/mainimg.jpg">	


</body>
</html>