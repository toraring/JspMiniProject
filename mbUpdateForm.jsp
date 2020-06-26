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
<%
//프로젝트 경로 구하기
String path = request.getContextPath();
String num = request.getParameter("num");
MemberDAO dao = new MemberDAO();
MemberDTO dto = dao.getData(num);

%>
</head>
<body>
<form action="<%=path%>/member/mbUpdateAction.jsp" method="post"  name="frm">
		<table class="table table-borderd" style="width: 500px" >
			<caption >회원 가입</caption>
			<tr>
				<th> 이름 </th>
				<td> 
					<input type="text" size="8" name="name" 
					autofocus="autofocus" value="<%=dto.getName()%>"> 
					
				</td>
			</tr>
			
			<tr>
				<th> 아이디 </th>
				<td> 
					<b style="color: red;"><%=dto.getId() %></b>
					<input type="button" value="아이디입력" onclick="idopen()">
					
				</td>
			</tr>
			
			<tr>
				<th> 비밀번호 </th>
				<td> 
					<input type="password" size="10" name="pass"
					value="<%=dto.getPass()%>">					
				</td>
			</tr>
			
			<tr>
				<th> 비밀번호 확인</th>
				<td> 
					<input type="password" size="10" name="pass2"
					value="<%=dto.getPass()%>">					
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				  <input type="hidden" name="num" value="<%=num%>">
					<input type="submit" value="수정완료">
					<input type="button" value="회원명단" 
					onclick="location.href='<%=path%>/index.jsp?body=member/memberList.jsp'">
					<!-- location:href가 아니고 location.href -->
				</td>
			</tr>
		</table>
	</form>

</body>
</html>