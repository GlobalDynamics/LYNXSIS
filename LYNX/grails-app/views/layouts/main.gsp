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
<%--		<div id="header">--%>
<%--		 	<div class="submenu">--%>
<%--	        	<div class="layout">--%>
<%--		            <ul class="submenu">--%>
<%--		                <li><g:link controller="account" action="logout"><span>Logout</span></g:link></li>--%>
<%--		                <li><a  href="${createLink(uri: '/')}"><span><g:message code="default.home.label"/></span></a></li>--%>
<%--		            </ul>--%>
<%--        		</div>--%>
<%--        	</div>--%>
<%--        </div>--%>
<%--		--%>
<%--		<div id="status">--%>
<%--			<h1>Administration</h1>--%>
<%--			<div id = "accountShow" style = "cursor: pointer;">Account</div>--%>
<%--			<div id = "accountMenu" style="display: none; padding-left:10px;">--%>
<%--				<ul>--%>
<%--					<li><g:link controller="account" action="list">Modify Accounts</g:link></li>--%>
<%--					<li><g:link controller="account" action="create">Create Account</g:link></li>--%>
<%--					<li><g:link controller="account" action="search">Search Accounts</g:link></li>--%>
<%--					<li><g:link controller="account" action="delete">Delete Account</g:link></li>--%>
<%--				</ul>--%>
<%--			</div>--%>
<%--			--%>
<%--			<div id = "personShow" style = "cursor: pointer;">People</div>--%>
<%--			<div id = "personMenu" style="display: none; padding-left:10px;">--%>
<%--				<ul>--%>
<%--					<li><g:link controller="person" action="list">People List</g:link></li>--%>
<%--					<li><g:link controller="person" action="create">Create Person</g:link></li>--%>
<%--					<li><g:link controller="person" action="edit">Update Person</g:link></li>--%>
<%--					<li><g:link controller="person" action="delete">Delete Person</g:link></li>--%>
<%--				</ul>--%>
<%--				--%>
<%--				<ul>--%>
<%--					<li><g:link controller="account" action="list">Address List</g:link></li>--%>
<%--					<li><g:link controller="account" action="create">Create Address</g:link></li>--%>
<%--					<li><g:link controller="account" action="edit">Update Address</g:link></li>--%>
<%--					<li><g:link controller="account" action="delete">Delete Address</g:link></li>--%>
<%--				</ul>--%>
<%--			</div>--%>
<%--			--%>
<%--			--%>
<%--		</div>--%>
<%--		<div id="page-body">--%>
<%--		<g:layoutBody/>--%>
<%--		</div>--%>
<%--		<div class="footer" role="contentinfo"></div>--%>
<%--		<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>--%>
		<g:javascript library="application"/>
		<r:layoutResources />
<div id="panel"> <!-- START panel -->
		<div id="menu">
			<ul>
				<li class="current"><g:link controller="account" action="index">Home</g:link></li>
			</ul>
		</div>
		
		<div id="session">
			<span>Logged in as <a title="User" href="#">
			<g:if test="${ session.person }">
    			${ session.person?.firstName + " " + session.person?.lastName }
			</g:if>
			<g:else>
    			${ session.user?.username }
			</g:else></a> - <g:link controller="account" action="logout">Logout</g:link></span>
		</div>
		
		<div class="clear"></div>
	</div>


<div class="clear"></div>

	<div id="primary"> <!-- START primary -->
		<h2 class="head">
			<g:if test="${controllerName == "account" && actionName == "index"}">
		     	Dashboard
			</g:if>
			<g:elseif test="${ controllerName && actionName }">
		    	${ controllerName?.toUpperCase() } > ${ actionName?.toUpperCase() }
			</g:elseif>
			<g:else>
		    	Error
			</g:else>
		</h2>
	
		<div class="content">
			<g:layoutBody/>
		</div>				
	</div>


<div id="sidebar"> <!-- START sidebar -->
	<div class="content">
			
			<h6 style = "padding-bottom:10px;">Administration</h6>
			
			<div id = "accountShow" style = "cursor: pointer;padding-bottom:10px;">Account</div>
			<div id = "accountMenu" style="display: none; padding-left:10px;">
				<ul class = "slist">
					<li><g:link controller="account" action="list">Modify Accounts</g:link></li>
					<li><g:link controller="account" action="create">Create Account</g:link></li>
					<li><g:link controller="account" action="search">Search Accounts</g:link></li>
<%--					<li><g:link controller="account" action="delete">Delete Account</g:link></li>--%>
				</ul>
			</div>
			
			<div id = "personShow" style = "cursor: pointer;padding-bottom:10px;">People</div>
			<div id = "personMenu" style="display: none; padding-left:10px;">
				<ul class = "slist">
					<li><g:link controller="person" action="list">People List</g:link></li>
					<li><g:link controller="person" action="create">Create Person</g:link></li>
					<li><g:link controller="person" action="edit">Update Person</g:link></li>
					<li><g:link controller="person" action="delete">Delete Person</g:link></li>
				</ul>
				
<%--				<ul>--%>
<%--					<li><g:link controller="account" action="list">Address List</g:link></li>--%>
<%--					<li><g:link controller="account" action="create">Create Address</g:link></li>--%>
<%--					<li><g:link controller="account" action="edit">Update Address</g:link></li>--%>
<%--					<li><g:link controller="account" action="delete">Delete Address</g:link></li>--%>
<%--				</ul>--%>
			
			
			
		</div>
	</div>
</div>
	</body>
</html>
