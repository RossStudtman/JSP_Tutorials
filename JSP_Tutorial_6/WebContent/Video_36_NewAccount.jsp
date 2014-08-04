<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
	<%-- LINK THE STYLE SHEET --%>
		<link rel="stylesheet" type="text/css" href="Video_36_css.css" />
<title>Vid 36 New Account</title>
</head>
<body>


<div id="wrapper">
	<h2>New Account</h2>
	<h3>Please enter your email and password</h3>
	<form id="newAccountForm" method="post" action="<%= response.encodeURL(request.getContextPath() + "/Video_35_Controller?director=new_account_form") %>">

		<label>	Email:
			<input type="text" id="email" name="email" value="<%= request.getAttribute("email") %>" /></label>

		<label>Password:
			<input type="password" id="password" name="password" value="<%= request.getAttribute("password") %>" /></label>
			
		<label>Repeat Password:
			<input type="password" id="rPassword" name="rPassword" value="<%= request.getAttribute("rPassword") %>" /></label>

		<p>		
			<button id="submit">submit to  /JSP_Tutorial_Six/Video_35_Controller</button></p>
			
		<p id="error"><%= request.getAttribute("errorMessage") %></p>
	
	</form>
</div>

</body>
</html>