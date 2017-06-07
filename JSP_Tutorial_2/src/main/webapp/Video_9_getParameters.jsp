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

	<!-- This .jsp gets compiled into a servlet so we have handles in here to the same stuff
			you would find in a doGet() method -->
			
	<!-- To show the process to get parameters from the URL is basically the same as is used inside a
			servlet I'll copy and paste the code from Video_9_MyAwesomeServlet.java into here: -->
			
	<%
			
		// Get a parameter sent in URL
		String key1 = request.getParameter("key1");
		String key2 = request.getParameter("key2");
		
		// Get a way to send output
		// PrintWriter out = response.getWriter();  // we don't need this, we get one for free :)		
		
		// The output.
		// out.println("<html>"); 					// we don't need this, we're already in an HTML tag
		out.println("<h1>Greetings from the doGET method!!</h1>");
		out.println("<p>URL parameter value of the key \"key1\": " + key1 +"</p>");
		out.println("<p>URL parameter value of the key \"key2\": " + key2 +"</p>");
		
	%>
		
	<!-- Import the RossClass -->
	<%@page import="myClasses.RossClass" %>
		
	<% 
		// Why not use the parameters to instantiate your own custom object? Go for it!		
		RossClass myCustomObject = new RossClass(key1);
		
		
		// Output something from that custom object:
		out.println("<p>Use a method in RossClass: " + myCustomObject.foo() + "</p>");
		
		// More interesting: what will be the result when no key1 key is present in the URL and we have asked
		// for a RossClass object to be built using that data? That is, what happens when NULL is passed to the 
		// constructor of RossClass? Lets find out.
		out.println("<p>Data inside the RossClass object: " + myCustomObject.getStringData() + "</p>");
		
		//out.println("</html>"); 					// we don't need this, we're already in an HTML tag.		
	%>

</body>
</html>