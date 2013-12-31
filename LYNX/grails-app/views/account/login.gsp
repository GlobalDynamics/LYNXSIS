<!DOCTYPE HTML>
<html>
<head>
<title>Simple Login Form</title>
<meta charset="UTF-8" />
<link rel="stylesheet" href="${resource(dir: 'css', file: 'login.css')}" type="text/css">
</head>

<body>

	<g:form action="authenticate" method="post" class = "box login">
		<div id="login-box">

			<H2>Login</H2>
			<p>${flash.message}</p>
			<br /> <br />
			<div id="login-box-name" style="margin-top: 20px;">User Name:</div>
			<div id="login-box-field" style="margin-top: 20px;">
				<input name="Username" id="Username" class="form-login"
					title="Username" value="" size="30" maxlength="2048" />
			</div>
			<div id="login-box-name">Password:</div>
			<div id="login-box-field">
				<input name="password" id="password" type="password"
					class="form-login" title="Password" value="" size="30"
					maxlength="2048" />
			</div>
			<br /> <br /> <input type="image" src="${resource(dir: 'images', file: 'login/login-btn.png')}"
				width="103" height="42" style="margin-left: 90px;" />


		</div>
	</g:form>
</body>
</html>