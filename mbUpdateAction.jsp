<%@page import="member.model.MemberDTO"%>
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

%>
<body>
<%
request.setCharacterEncoding("utf-8");
String num = request.getParameter("num");
String name = request.getParameter("name");
String pass = request.getParameter("pass");

MemberDTO dto = new MemberDTO();
dto.setName(name); //파라메타로 받은 값을 가져오기?
dto.setNum(num);
dto.setPass(pass);

MemberDAO dao = new MemberDAO();
dao.updateMember(dto);

response.sendRedirect(path+"/index.jsp?body=member/successPage2.jsp");
%>
</body>
</html>