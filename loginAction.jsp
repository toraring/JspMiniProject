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

String id = request.getParameter("id");
String pass = request.getParameter("pass");
String save = request.getParameter("savechk");

//아이디에 비번이 맞는지 확인
MemberDAO dao = new MemberDAO();
boolean flag = dao.isLogin(id, pass);

//맞으면 세션에 저장후 로그인 메인으로 이동
if(flag)
{
	//로그인 중인지 알 수있는 세션에 저장
	session.setAttribute("loginok", "yes");
	
	//아이디와 체크값 저장
	session.setAttribute("idok", id);
	
	//체크하면 값으로 on이 안하면 null이 저장
	session.setAttribute("saveok", save);
	
	//세션에서 유지시간
	//8시간 동안 서버에 정보가 유지됨
	session.setMaxInactiveInterval(60*60*8);
	
	//로그인 메인으로 이동
	response.sendRedirect(path+"/index.jsp?body=login/loginMain.jsp");
}else
{%>
	<script type="text/javascript">
	alert("아이디와 비번 안맞아요");
	history.back();
	
	</script>

<%}


%>
</head>
<body>


</body>
</html>