<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"/></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"></link>

</head>
<%
//프로젝트 경로 구하기
String path = request.getContextPath();
 
%>

<body>
<p style="text-align: left; font-size: 20pt; color: blue;">
	삭제가 완료되었습니다. <br><br>
	<a href=""> 로그인 </a>
	<a href="<%=path%>/index.jsp?body=member/memberList.jsp"> 회원 명단 </a>
	
</p>
</body>
</html>