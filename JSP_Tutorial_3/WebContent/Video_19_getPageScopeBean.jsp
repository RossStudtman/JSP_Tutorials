<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Get Page Scope Bean</title>
</head>
<body>

	<h1>How to Get Data from a Bean Using Page Scope</h1>
	
	<!-- A bean tag -->
		<jsp:useBean id="pageBean" class="bean.Video_18_UserBean" scope="page"></jsp:useBean>
		
				
	<!-- Get bean tag -->
		<h2>Date inside bean is null:</h2>
		
		<p>User name: <%= pageBean.getUserName() %></p>
		<p>User ID: <%= pageBean.getUserID() %></p>
		
		<h3>Why?</h3>
		<p>Because the bean data was set within a .jsp where the bean tag was given page scope.</p>

</body>
</html>