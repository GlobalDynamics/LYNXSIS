<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="Grails"/></title>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">--%>
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'dark.css')}" type="text/css">--%>
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'darkmain.css')}" type="text/css">--%>
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'style.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'navi.css')}" type="text/css">
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'other.css')}" type="text/css">--%>
<%--		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">--%>
		<g:layoutHead/>
		<g:javascript library="jquery" />
		<r:layoutResources />
		
		<g:javascript>
			$(document).ready(function() {
			    $('#accountShow').click(function() {
			            $('#accountMenu').slideToggle("fast");
			    });
			    $('#personShow').click(function() {
			            $('#personMenu').slideToggle("fast");
			    });
			});
		
		
		</g:javascript>
	</head>
	<body>
		<g:javascript library="application"/>
		<r:layoutResources />
<div class="wrap">
	<div id="header">
		<div id="top">
			<div class="left">
				<p>Logged in as, <strong>
					<g:if test="${ session.person }">
    					${ session.person?.firstName + " " + session.person?.lastName }
					</g:if>
					<g:else>
		    			${ session.user?.username }
					</g:else>
				
				</strong><g:link controller="account" action="logout">[ Logout ]</g:link></p>
			</div>
			<div class="right">
				<div class="align-right">
					<p>Last login: <strong>${ session.user?.lastLogin }</strong></p>
				</div>
			</div>
		</div>
		<div id="nav">
			<ul>
				<li class="upp"><g:link controller="account" action="index">Home</g:link>
					<ul>
						<li>&#8250; <a href="">Visit site</a></li>
						<li>&#8250; <a href="">Reports</a></li>
						<li>&#8250; <a href="">Add new page</a></li>
						<li>&#8250; <a href="">Site config</a></li>
					</ul>
				</li>
				<li class="upp"><a href="#">Manage People</a>
					<ul>
						<li>&#8250; <g:link controller="person" action="list">List/Modify/Delete People</g:link></li>
						<li>&#8250; <g:link controller="person" action="create">Add Person</g:link></li>
					</ul>
				</li>
				<li class="upp"><a href="#">Manage Accounts</a>
					<ul>
						<li>&#8250; <g:link controller="account" action="list">List/Modify/Delete Accounts</g:link></li>
						<li>&#8250; <g:link controller="account" action="create">Add Account</g:link></li>
						<li>&#8250; <g:link controller="usergroup" action="list">List/Modify/Delete Usergroups</g:link></li>
						<li>&#8250; <g:link controller="usergroup" action="create">Add Usergroup</g:link></li>
					</ul>
				</li>
				<li class="upp"><a href="#">Settings</a>
					<ul>
						<li>&#8250; <a href="">Site configuration</a></li>
						<li>&#8250; <a href="">Contact Form</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	<div id="content">
		<div id="main">		
				<div class="full_w">
				<div class="h_title">
					<g:if test="${controllerName == "account" && actionName == "index"}">
				     	Dashboard
					</g:if>
					<g:elseif test="${ controllerName && actionName }">
				    	${ controllerName?.toUpperCase() } > ${ actionName?.toUpperCase() }
					</g:elseif>
					<g:else>
				    	Error
					</g:else>
				
				</div>
				<div class="clear"></div>
					<g:layoutBody/>
				</div>
			<div class="clear"></div>
	</div>

	<div id="footer">
		<div class="right">
			<p><a href="">Celestial Dynamics</a></a></p>
		</div>
	</div>
</div>		
			
			
				
	</div>	
			
			



		
			
		



	</body>
</html>
