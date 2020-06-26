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

String saveok = (String)session.getAttribute("saveok");
String id = (String)session.getAttribute("idok");
MemberDAO dao=new MemberDAO();
String name=dao.getName(id);
%>
</head>
<body>
<form action="<%=path%>/login/loginAction.jsp" method="post">
	<table class="table table-bordered" style="width: 400px;">
		<caption><b style="font-size: 15pt;">세션로그인</b></caption>
		<tr>
			<td colspan="2">
			
			<%
			if(saveok == null)
			{%>
			<input type="checkbox" name="savechk">아이디 저장
			<%}else
			{%>
				<input type="checkbox" name="savechk"
				checked="checked">아이디 저장				
			<%}
			
			%>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<b>보안로그인</b> 
			</td>
		</tr>
		
		<tr>
			<th>아이디</th>
			<td>
			
			<%
			if(saveok == null)
			{%>
				<input type="text" name="id" size="10"
				autofocus="autofocus" required="required" value="">
			<%}else
			{%>
				<input type="text" name="id" size="10"
				autofocus="autofocus" required="required"
				value="<%=id%>">				
			<%}
			%>
			</td>
		</tr>
		
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="pass" size="10"
				autofocus="autofocus" required="required">
			</td>
		</tr>
		
		<tr>
			<td colspan="2" align="left">
				<input class="btn btn-info" type="submit" value="로그인">
				<input class="btn btn-info" type="submit" value="회원가입"
				onclick="locatin.href='<%=path%>/index.jsp?body=member/memberForm.jsp">
			</td>
			<form action="<%=path%>/guest/guestAction.jsp" method="post">
  <table class="table table-bordered" style="width: 400px;">
  	<tr>
  	  <td>
  	    작성자: <b><%=name %>(<%=id %>)</b><br><br>
  	    <textarea rows="5" cols="40" name="content"
  	    autofocus="autofocus" style="border: 2px dotted pink;">
  	    </textarea>
  	  </td>
  	  
  	  <td valign="middle" align="center">
  	    <input type="hidden" name="id" value="<%=id%>">
  	    <input type="hidden" name="name" value="<%=name%>">
  	    <input type="submit" value="메모하기">
  	  </td>
  	</tr>
  	
  	<tr>
  	  <td colspan="2">
  	    <%
  	    	for(int i=1;i<=8;i++)
  	    	{%>
  	    		<input type="radio" value="<%=i%>"
  	    		<%=i==3?"checked":"" %> style="width: 30px;" name="avata">
  	    	<%}
  	    %>
  	    
  	    <!-- 아이콘 이미지 -->
  	    <br>
  	    <%
  	  		for(int i=1;i<=8;i++)
  	  		{%>
  	  			<img alt="" src="<%=path%>/avata/b<%=i%>.png"
  	  			style="width: 30px;">
  	  		<%}
  	    %>
  	  </td>
  	</tr>
	</table>

</form>

</body>
</html>