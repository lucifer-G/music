<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page contentType="text/html;charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>登陆页面</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/style.css" />
</head>

<body>

	<div id="wrap">
		<div id="top_content">
			<div id="logo_login">
				<a href="index.jsp"><h1>智慧云</h1></a>
			</div>
			<div id="content">
				<p id="whereami"></p>
				<h1>欢迎登陆</h1>
				<form action="login.do" method="post">
					<table cellpadding="0" cellspacing="0" border="0"
						class="form_table">
						<tr>
							<td valign="middle" align="right">用户名</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="username" />  </td>
						</tr>
						<tr>
							<td valign="middle" align="right">密码</td>
							<td valign="middle" align="left"><input type="password"
								class="inputgri" name="password" /></td>
						</tr>
						<tr>
							<td valign="middle" align="right">验证码</td>
							<td valign="middle" align="left"><input type="text"
								class="inputgri" name="validatecode" />
								<img src="code" onclick="this.src='code?'+Math.random();" class="c_code" title="点击更换">
							</td>
						</tr>
					</table>
					<p>
						<input type="submit" class="button" value="登陆" />&nbsp;&nbsp;&nbsp;&nbsp;
						<span style="color: red; font-size: 20px;">${login }</span>
					</p>
				</form>
			</div>
		</div>

	</div>
</body>
</html>