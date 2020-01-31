<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*,com.music.entity.*"%>
<html>
<head>
<title>歌单</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/header.js"></script>
<script type="text/javascript" src="js/audio.js"></script>
</head>
<body>
	<!-- header-->
	<%@include file="header.jsp" %>

	<div id="wrap_show">
		<div id="top_content">
			<div id="content" >
				<p id="whereami"></p>
				<h1>智慧云</h1>
				<table class="table">
					<tr class="table_header">
						<td>歌名</td>
						<td>歌手</td>
						<td>操作</td>
					</tr>
					<%
							List<Music> musics = (List<Music>)request.getAttribute("findMusic");
							for(int i=0;i<musics.size();i++){
								Music m = musics.get(i);
								%>
					<tr class="row<%=i%2+1%>">
						<td><%=m.getTitle() %></td>
						<td><%=m.getSinger() %></td>
						<td><a href="#"><audio src="/file/<%=m.getUrl() %>" controls="controls" preload="auto" loop="loop"></audio></a></td>
					</tr>
					<%
							}
						%>
					
				</table>
				
			</div>
		</div>
		
	</div>
		<%@include file="footer.jsp" %>
	
</body>
</html>