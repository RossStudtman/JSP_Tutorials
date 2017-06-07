<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Get Application Scope Bean</title>
</head>
<body>

	<h1>How to Get Data from a Bean Using Application Scope</h1>
	
	<!-- A bean tag -->
		<jsp:useBean id="applicationBean" class="bean.Video_18_UserBean" scope="application"></jsp:useBean>
		
				
	<!-- Get bean tag -->
		<h2>Application scope:</h2>
		
		<p>If bean has been set one time during the running of this Tomcat server then the bean is set for as long as that server is running.</p>
		<p>You can close browsers, open browsers, wait a 100 years... the bean lives!</p>
		
		<p>User name: <%= applicationBean.getUserName() %></p>
		<p>User ID: <%= applicationBean.getUserID() %></p>

</body>
</html>