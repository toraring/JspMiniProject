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

//로그인에 대한 세션값을 삭제
session.removeAttribute("loginok");

//로그인 메인으로 이동.. 항상 메인을 통해 이동하게끔 만들어야함.
response.sendRedirect(path+"/index.jsp?body=login/loginMain.jsp");

%>
</head>
<body>


</body>
</html>