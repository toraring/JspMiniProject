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
	function idopen() 
	{
		window.open('member/idSearchForm.jsp', 'w', 'width=250px, height=150px, left=500px, top=100px');
	}
	
	function check(f) {
		//입력체크
		if(f.id.value.length == 0)
			{
			alert("아이디 입력 버튼을 눌러주세요");
			return false;
			}
		//2개의 비번이 같은지
		//만약 비번1과 2의 값이 같이 않으면 
		if(f.pass.value!=f.pass2.value)
			{
			alert("비번이 달라요");
			f.pass.value = '';
			f.pass2.value='';
			f.pass.focus();
			return false;
			}
	}
	</script>
</head>
<%
//프로젝트 경로 구하기
String path = request.getContextPath();
 
%>


<body>
	<form action="<%=path %>/member/memberAction.jsp" method="post"  name="frm"
	onsubmit="return check(this)">
		<table class="table table-borderd" style="width: 500px" >
			<caption >회원 가입</caption>
			<tr>
				<th> 이름 </th>
				<td> 
					<input type="text" size="8" name="name" 
					required="required" autofocus="autofocus" placeholder="이름"> 
					
				</td>
			</tr>
			
			<tr>
				<th> 아이디 </th>
				<td> 
					<input type="text" size="10" name="id"
					required="required" readonly="readonly"> <!-- readonly; 텍스트 못쓰게 함 -->
					
					<input type="button" value="아이디입력" onclick="idopen()">
					
				</td>
			</tr>
			
			<tr>
				<th> 비밀번호 </th>
				<td> 
					<input type="password" size="10" name="pass"
					required="required" placeholder="비밀번호">					
				</td>
			</tr>
			
			<tr>
				<th> 비밀번호 확인</th>
				<td> 
					<input type="password" size="10" name="pass2"
					required="required" placeholder="비밀번호 확인">					
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="회원가입">
					<input type="button" value="회원명단" 
					onclick="location.href='<%=path%>/index.jsp?body=member/memberList.jsp'">
					
				</td>
			</tr>
		</table>
	</form>

</body>
</html>