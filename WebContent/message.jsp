<%@ page pageEncoding="utf-8" contentType="text/html;charset=utf-8"%>
<%@page import="java.util.*,com.music.entity.User"%>
<html>
<head>
<title>留言栏</title>
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/message.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/header.js"></script>
</head>
<body>
	<%@include file="header.jsp"%>

	<div id="message">
		<form action="message.do" method="post">
			<div>
				<textarea name="comment" id="message_ly" cols="168" rows="8"></textarea>
				<br /> 昵称： <br />
				<%if(user!=null){ %>
				<input type="text" name="username" value="<%=user.getUsername() %>" />
				<%}else{ %>
				<input type="text" name="username" value="游客" />
				<%} %>
				<input type="submit" name="button" id="message_ly_sub" value="留言" />
			</div>
		</form>

		<div id="message_date">
			<h1>最近留言</h1>
		</div>
		<div id="message_content">
			<%
			List<String> list = (List<String>)session.getAttribute("messages");
			if(list !=null){
				for(int i=list.size()-1;i>=0;i--){
					String str = list.get(i);
					%>
			<p><%=str%></p>
			<% 					
				}
			}
			%>
		</div>
	</div>
</body>
</html>