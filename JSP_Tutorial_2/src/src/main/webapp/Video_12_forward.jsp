<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Forward</title>
</head>
<body>

	<!-- You won't actually see this h1 tag because the server will see the redirect and serve the other page instead. -->
	
		<h1>Using a JSP forward tag: &lt;jsp:forward page=&quot; &quot;&gt; </h1>
	
	<!-- jsp forward tag: forward to another .jsp -->
	
		<jsp:forward page="index.jsp" />  
		
		
	<!-- Another way to forward to another page, this time using java rather than using jsp:forward HTML tag -->
	
		<%
			// Forward to another .jsp
			request.getRequestDispatcher("index.jsp").forward(request, response);		
		%>

</body>
</html>