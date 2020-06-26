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

</head>
<body>
<%
//프로젝트 경로 구하기
String path = request.getContextPath();
String num = request.getParameter("num");
String pass = request.getParameter("pass");

MemberDAO dao = new MemberDAO();
boolean flag = dao.isEqualPass(num, pass); //쿼리재사용

if(flag)
{	
	dao.deleteMember(num);
	//String s = path+"/index.jsp?body=member/memberList.jsp?num="+num;
	response.sendRedirect(path+"/index.jsp?body=member/successPage3.jsp");
	//response.sendRedirect(s);
}else
{%>
	<script type="text/javascript">
	alert("비밀번호가 틀리네요");
	history.back();
	
	</script>
<%}
%>

</body>
</html>