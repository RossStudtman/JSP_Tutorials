<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="beans.Video_24_UserBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Vid 26 login form</title>
</head>
<body>

	<%-- Associate this .jsp with a Bean --%>
	<%/* 
		This is no longer needed since we are obtaining attributes contained in the HttpServletRequest object.
	
		<jsp:useBean id="vid26" class="beans.Video_24_UserBean" scope="session"></jsp:useBean>
	*/%>
	
	<%-- Error Message if form validation failed --%>
	<h2><%= request.getAttribute("errorMessage")  %></h2>

	<h1>Video 26 Login Form</h1>
	
	<%-- Form should submit to controller --%>
	<form action="/JSP_Tutorial_4/Video_26_Controller" method="post">	
	
		<%-- hidden input field: if this form is submitted the key (name) and value (value) will be added to the URL parameter list --%>
		<input type="hidden" name="director" value="doLogin" />
		
		<fieldset>				
		<legend>Video #26's MVC Form</legend>		
		
		<%-- 		
			User was sent her by the controller. The controllers doGet and doPost add attributes to the request object
			that was sent by the controller. Use getAttribute to obtain those added attributes and assign to <input> 
			elements.		
		 --%>
		 
		<label>Email:</label>
			<input type="text" name="email" value="<%= request.getAttribute("email") %>" />	
		
		<label>Password:</label>
			<input type="text" name="password" value="<%= request.getAttribute("password") %>"  />	
				
		<label>Submit button</label>
			<input type="submit" value="submit to  /JSP_Tutorial_4/Video_26_Controller"  />
			
		</fieldset>		
	</form>
</body>
</html>