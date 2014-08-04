<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>JSP Form Handler</title>
</head>
<body>

	<h1>JSP Form Handler</h1>
	<p>A .jsp form is sent here for processing.</p>
	<p>This breaks Model One architecture.</p>

	<%-- Associate this .jsp with the Bean --%>
		<jsp:useBean id="vid23" class="beans.Video_23_UserBean" scope="session"></jsp:useBean>
		
	<%-- look for any URL parameters that match Bean properties --%>
		<jsp:setProperty name="vid23" property="*" />
		
	<%-- Output bean values to show they've been set:  --%>	
		
		<%-- Get property using an Expression tag: --%>
		<p>User Name: <%=vid23.getUserName() %></p>
		
		<%-- Get property using a jsp:getProperty element: --%>
		<p>User ID: <jsp:getProperty name="vid23" property="userID" /></p>
</body>
</html>