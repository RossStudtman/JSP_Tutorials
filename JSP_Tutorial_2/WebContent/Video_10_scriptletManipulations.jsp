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

	<h1>Scriptlet Manipulations</h1>
	
	<!-- this is a "scriptlet" -->
	<%
		// Open the for-loop in one scriptlet, close it in another.
		// And between the two write some HTML.
		// ...the stuff between the scriptlets will be looped!
		for(int i = 0; i < 5; i++){
	%>
	
	<!-- stuff between the scriptlets BUT inside the for-loop. -->
	<!-- side note: these comments are also iterated. Browser: view source to see. -->
	
	<p>This HTML is inside a scriptlet loop.</p>
	
	<% 
		// Close the for-loop
		} 
	%>
	
	<!-- Same idea as above but slightly more fancy: -->
	
		<!-- HTML before for-loop, open HTML tag. -->
		<ol>
		
		<!-- begin for-loop -->
		<%
			for(int i = 0; i < 5; i++){	
		%>
		
		<!-- stuff inside for-loop. -->
		<li>This is iteration number: <%= i %></li>
		
		<!-- Close for-loop -->	
		<% 	} %>
		
		<!-- Close HTML tag -->
		</ol>
		
	<!-- Use a URL parameter and an if-condition. -->
		<!-- Get parameter and open if-condition-->
		<%
			String key1 = request.getParameter("key1");
				
			if(key1 == null){
		%>
		
		<!-- If key1 is null write this HTML -->	
		<h2>Key1 parameter was not supplied!</h2>
		<p>No value for key1.</p>
		<p>Maybe send you to a specific webpage to remedy?</p>	
		<p>Maybe redirect to a login page if this key were associated with login.</p>
		
		<!-- Close if-condition, open else-condition -->
		<% 
			} 
			else {
		%>
		
		<!-- If key1 has text then write this HTML -->
		<p>The value of key1 is: <%= key1 %></p>
		
		<!-- Close else-condition. -->
		<%
			// close else-condition -- just to note that comments would
			// be better in here because this isn't written to the HTML file!
			// But for this tutorial what we are doing is okay.
			}
		%>
		
	

</body>
</html>