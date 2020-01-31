<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.*,com.music.entity.*"%>
<html>
<head>
<title>视频</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/header.js"></script>
</head>
<body>
	<!-- header-->
	<%@include file="header.jsp" %>

	<div id="wrap_show">
		<div id="top_content">
			<div id="content" >
				<p id="whereami"></p>
				<h1>智慧云</h1>
				<p>
					<video src="video/dy1.mp4" controls="controls" poster=""  
					 width=15%></video>
					 
					
				</p>
				
			</div>
		</div>
		
	</div>
		
	
</body>
</html>