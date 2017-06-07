<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Vid 28</title>
</head>
<body>

	<%-- Import POJO class --%>
	<%@ page import="myObjects.Video_27_POJO" %>
	<h1>Video 28 stuff</h1>
	
	<h1>Display object that is inside session object</h1>
	
	<p>Display some property of your POJO object:</p>
	
	<%-- Use session object to get our nested POJO object --%>
	<% 
		Video_27_POJO pojo = (Video_27_POJO)session.getAttribute("pojo");	
	%>
	
	<%-- Check if our POJO object was attached to the session object --%>
	<%= pojo == null ? "POJO object not in session object" : pojo.getInfo() %>
	
	<h1>Video 28 stuff</h1>
	


</body>
</html>