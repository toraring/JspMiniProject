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
String num = request.getParameter("num");
%>
<body>
<form action="<%=path%>/member/mbUpdatePassAction.jsp" method="post">
<!-- 수정 비번 처리 과정 -->
	<table class="table table-bordered" style="width: 300px;">
		<tr height="150" valign="middle">
			<td>
			<b>가입 시 입력한 <br>비밀번호를 입력해주세요</b><br>
			<input type="password" name="pass" size="7" autofocus="autofocus"
			required="required">
			<!-- hidden으로 num값 처리 -->
			<input type="hidden" name="num" value="<%=num%>">
			<input type="submit" value="확인">
			</td>
		</tr>	
	</table>
</form>

</body>
</html>