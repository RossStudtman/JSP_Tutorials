<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.io.IOException"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Video_13_declarationTag</title>
</head>
<body>

	<h1>The Declaration Tag</h1>
	
	<!-- Create a declaration tag. It writes code to the **class** that the .jsp is compiled into. -->
	
		<%!
			// Declaration tag code
			
			// An instance variable that is added to the compiled .jsp class
			private String someVariable = "a string inside declaration tag";
		
			// A method that is added to the compiled .jsp class
			private String someMethod(){
				return "returned from method added to .jsp's compiled class";
			}
			
			// NOTE: someMethod() does not have access to the variables that can be accessed in doGet() and doPost().
			// This includes the JspWriter's out variable; or the response and request variables, etc.
			// This is likely because doGet() and doPost() are passed these variables "behind the scenes".
			// BUT, what you CAN DO is, if you want, pass those same variables to your method like so:
			private void anotherMethod(JspWriter out){
				try{
					out.println("<p>anotherMethod was called. We have access to a JspWriter object.</p>");
				}catch (IOException e){
					e.printStackTrace();
				}
								
			}
		
		%>
		
	<!-- Now that the declaration tag has added code to the .jsp class... -->
	<!-- ...use a scriptlet tag, which remember puts code into the doGet() or doPost()...  -->
	<!-- ...to call the added members of the .jsp class: -->
	
	<%
		// use the instance variable
		out.println("<p>" + someVariable +"</p>");
	
		// use the first added method
		out.println(someMethod());
		
		// use the second added method
		anotherMethod(out);
		
	%>

</body>
</html>