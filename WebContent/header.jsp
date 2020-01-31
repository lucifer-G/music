<%@page import="com.music.entity.User"%>
<%@page pageEncoding="utf-8" contentType="text/html;charset=utf-8" %>
<div id="header">
		<div id="logo">
			<h1>智慧云语音</h1>
		</div>
		<div id="search">
			<form action="findMusic.do">
				<input id="search-key"  placeholder="请输入您要搜索的歌曲" name="str">
				<input id="search-sub" type="submit" value="搜索">
			</form>
		</div>
		<div id="menu">
			<ul>
				<li><a href="index.jsp">首页</a></li>
				<li><a href="findMusic.do">歌单</a></li>
				<li><a href="musicbox.jsp">视频</a></li>
				<li><a href="message.jsp">留言栏</a></li>
				<%
					User user = (User)session.getAttribute("user");
					if(user==null){
						%>
						<li><a href="login.jsp">登陆</a></li>
						<li><a href="register.jsp">注册</a></li>
						<%
					}else{
						if("boy".equals(user.getGender())){
							%>
								<li class="dl_img"><a href="#"><img src="img/boy.png" height="40" ></a></li>
								<li><a href="cancel.do" onclick="return confirm('是否确定注销登陆?');"  style="text-decoration: underline;color: #2055ce;"><%=user.getUsername()%></a></li>
							<%
						}else{
							%>
								<li class="dl_img"><a href="#"><img src="img/girl.png" height="40"></a></li>
								<li><a href="cancel.do" onclick="return confirm('是否确定注销登陆?');" style="text-decoration: underline;color: #2055ce" ><%=user.getUsername()%></a></li>
							<%
						}
					}
		
				%>
				
			</ul>
			<div id="menu_time">
				<span id="time"></span>
			</div>
		</div>
	</div>