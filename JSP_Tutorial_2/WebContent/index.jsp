<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>

	<!-- code inside these will be added to the doGet() method: -->
	<%= "<p>print this directly to the page</p>" %>


	<!-- a page directive applies to the whole .jsp page  -->
	<%@page import="java.util.Date, myClasses.*"%>

	<%= "Today's date is: " +new Date()%>
	
	<%
		RossClass rossClass = new RossClass("Firefly");
	
		out.println("<p>You just imported your own class! And can access it, too!</p>");
		out.println("<p>Use a RossClass method: " + rossClass.getStringData() + "</p>");
		out.println("<p>Run a method from the class just because: " + rossClass.foo() + "</p>");
	
	%>



</body>
</html>