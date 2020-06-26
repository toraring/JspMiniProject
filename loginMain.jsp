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
//세션에 저장된 loginok값 찾기
String loginok = (String)session.getAttribute("loginok");

if(loginok == null || loginok.equals("")) //로그아웃
{%>
	<jsp:include page="loginForm.jsp"></jsp:include>
<%}
else//로그인 상태
{%>
	<jsp:include page="logoutForm.jsp"></jsp:include>
<%}

%>

</body>
</html>