<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>注册页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/style.css" />
<script type="text/javascript" src="js/register.js"></script>
</head>

<body>
	<div id="wrap">
		<div id="top_content">
			<div id="logo_login">
				<a href="index.jsp"><h1>智慧云</h1></a>
			</div>
			<div id="content">
				<p id="whereami"></p>
				<h1>欢迎注册</h1>
				<form action="register.do" method="post" onsubmit="return checkUser()*checkEma()==1">
					<table cellpadding="0" cellspacing="0" border="0"
						class="form_table">
						<tr>
							<td valign="middle" align="right">用户名</td>
							<td valign="middle" align="left">
								<input type="text" class="inputgri" name="username" id="user" onblur="checkUser();"/>
								<span id="user_span"></span>
							</td>
						</tr>
						<tr>
							<td valign="middle" align="right">密码</td>
							<td valign="middle" align="left">
								<input type="password" class="inputgri" name="password" />
							</td>
						</tr>
						<tr>
							<td valign="middle" align="right">确定密码</td>
							<td valign="middle" align="left">
								<input type="password" class="inputgri" name="OKpassword" />
							</td>
						</tr>
						<tr>
							<td valign="middle" align="right">年龄</td>
							<td valign="middle" align="left">
								<select class="inputgri" name="age">
									<option>请选择</option>
										<%
											for(int i=1;i<=100;i++){
												%>
												<option><%=i%></option>
												<%
											}
										%>
								</select>
							</td>
						</tr>
						
						<!-- <tr>
							<td valign="middle" align="right">年龄</td>
							<td valign="middle" align="left">
								<input type="text" class="inputgri" name="age" />
							</td>
						</tr> -->
						<tr>
							<td valign="middle" align="right">邮箱</td>
							<td valign="middle" align="left">
								<input type="text" class="inputgri" name="email" id="ema" onblur="checkEma();" />
								<span id="ema_span"></span>
							</td>
						</tr>
						<tr>
							<td valign="middle" align="right">性别</td>
							<td valign="middle" align="left">
								<input type="radio" name="gender" maxlength="8" checked="checked" value="boy" id="auto1"/><label for="auto1">男</label> 
								<input type="radio" name="gender" maxlength="8" value="girl" id="auto2"/><label for="auto2">女</label>
							</td>
						</tr>
					</table>
					<p>
						<input type="submit" class="button" value="注册" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="font-size: 20px; color: red;"> <%
									String msg = (String)request.getAttribute("error");
								%> <%=msg == null? "":msg%>
						</span>

					</p>
				</form>
			</div>
		</div>
	</div>
</body>
</html>