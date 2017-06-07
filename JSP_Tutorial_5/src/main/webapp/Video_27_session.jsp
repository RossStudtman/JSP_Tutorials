<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Vid 27 Session Object</title>
</head>
<body>

	<h1>Session Object</h1>
	
	<p>The maximum a user can be inactive and a session object still exists is:</p>
	<ul>
		<li><%= session.getMaxInactiveInterval() %> seconds</li>
	</ul>
	
	<p>Links:</p>
	<ul>
		<li><a href="/JSP_Tutorial_Five/Video_27_Controller?director=vid27">Link to Video_27_displayPojo.jsp: goes through controller</a></li>
	</ul>
	

</body>
</html>