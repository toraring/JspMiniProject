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
<script type="text/javascript">
function check(f) {
	/* 아이디 최하 길이는 5 */
	if(f.id.value.length<5)
	{
	alert("5글자 이상 입력바람");
	close();
	return false; 
	}
	/* 공백 체크 */
	var idx = f.id.value.indexOf(' '); //공백의 위치
	if(idx >= 0)
	{
	alert("아이디에 공백이 있습니다");
	close();
	return false;
	}
	
}
function goUse(id) {
	//전달받은 id값 오픈한 윈도우로 보내고,
	opener.frm.id.value = id;
	//현재 윈도우는 닫기.
	window.close();
}

</script>
</head>

<body>
<%
//프로젝트 경로 구하기
String path = request.getContextPath();

//키값이 null이면 폼을 나타내려한다.
String key = request.getParameter("key");
if(key==null)
{%>
	<!-- 아이디 입력 폼 -->
	<form action="<%=path%>/member/idSearchForm.jsp" 
	method="post" onsubmit="check(this)"> <!-- this는 이벤트 발생시 쓰임 -->
		<table>
			<tr>
				<td> 
					<b>아이디 입력 : </b>
					<input type="text" name="id" size="10">
					<input type="hidden" name="key" value="result">
					<input type="submit" value="중복체크">
				</td>
			</tr>		

		</table>
	</form>
<%}else
{
	//<!-- 입력결과 -->
	String id = request.getParameter("id");
	MemberDAO dao = new MemberDAO();
	boolean flag = dao.searchId(id);
	
	if(flag)
	{
		//이미 아이디가 존재한다면
		%>
		<table>
			<tr>
				<td>
					<img alt="" src="<%=path%>/image/ani1.jpg">
					<b style="color: magenta;"><br>이미 존재하는 아이디에요~<br>
					다른 아이디로 입력해주세여</b><br>
					<input type="button" value="아이디 다시 입력"
					onclick="location.href = '<%=path%>/member/idSearchForm.jsp'">
					
				</td>
			</tr>	
		</table>
	
	<%}else
	{%>
		<!-- 아이디가 없는 경우 -->
		<table>
			<tr>
				<td>
					<img alt="" src="<%=path%>/image/friend.jpg">
					<b style="color: cyan;"><br>사용가능한 아이디입니다</b><br>
					<!-- 전달받은 id값 쓰기. 그리고 ""안의 문자는 ''로 구분할 것. -->
					<input type="button" value="사용하기" onclick="goUse('<%=id%>')"><br>
					<input type="button" value="아이디 다시 입력"
					onclick="location.href = '<%=path%>/member/idSearchForm.jsp'">
					
				</td>
			</tr>	
		</table>
		
	<%}



%>
<%}

%>

</body>
</html>