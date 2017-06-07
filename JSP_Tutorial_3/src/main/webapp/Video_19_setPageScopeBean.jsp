<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Set Page Scope Bean</title>
</head>
<body>

	<h1>How To Set Data in a Bean Using Page Scope</h1>
	
	<!-- A bean tag -->
		<jsp:useBean id="pageBean" class="bean.Video_18_UserBean" scope="page"></jsp:useBean>
		
	<!-- Set bean tag -->
		<jsp:setProperty name="pageBean" property="userName" value="Ross" />
		<jsp:setProperty name="pageBean" property="userID" value="007" />
		
	<p>...bean has been set.</p>
	
		<h2>Now immediately use that bean data:</h2>
		<p>Data inside the bean:</p>
		<ul>
			<li>User name: <%= pageBean.getUserName() %></li>
			<li>User ID: <%= pageBean.getUserID() %></li>
		</ul>

</body>
</html>