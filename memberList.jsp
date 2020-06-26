<%@page import="java.text.SimpleDateFormat"%>
<%@page import="member.model.MemberDTO"%>
<%@page import="java.util.Vector"%>
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
<%
//프로젝트 경로 구하기
String path = request.getContextPath();

MemberDAO dao = new MemberDAO();
Vector<MemberDTO>list = dao.getMemberList();

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH");
%>

<body>
<div class="container">
	<b style="color: cyan">총<%=list.size()%>명의 회원이 있습니다</b>
	
	<table class="table table-striped">
		<caption><b style="font-size: 13pt;">회원명단</b></caption>
		
		<tr>
			<th> No. </th>
			<th> 회원명 </th>
			<th> ID </th>
			<th> 가입일 </th>
			<th> 편집 </th>
		</tr>
		<%
		for(int i =0; i<list.size(); i++)
		{
			MemberDTO dto = list.get(i);
			%>
			<tr>
				<td> <%=i+1 %> </td>
				<td> <%=dto.getName() %> </td>
				<td> <%=dto.getId() %> </td>
				<td> <%= sdf.format(dto.getGaipday()) %></td>
				<td> <a href="<%=path%>/index.jsp?body=member/mbUpdatePassForm.jsp?num=<%=dto.getNum()%>">수정</a>
				/<a href="<%=path%>/index.jsp?body=member/memberDelPass.jsp?num=<%=dto.getNum()%>"> 삭제 </a> </td>
				
			</tr>
		<%}
		%>
		
		
	</table>

</div>
</body>
</html>