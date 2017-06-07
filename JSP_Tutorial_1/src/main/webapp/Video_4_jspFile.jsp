<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>HTML from JSP file</title>
</head>
<body>

	
	<h1>This HTML is served up from aJSPfile.jsp</h1>
	
	<h2>Demonstrate how &lt;%= &quot;String content&quot; &gt; writes directly to the page:</h2>
		<ul>
			<li><%= "This writes directly to the HTML page." %></li>
		</ul>	
	
	<p>
		Putting a date directly on the page: <%= new Date() %>
	</p>
	
	<h1>A scriptlet:</h1>
		
	<!-- This is a "scriptlet" section -->
	<%
		Date today = new Date();
		String todayText = "Today is: " + today.toString();
		
		// In Eclipse use ctrl+space to show pre-defined variables of a scriptlet.
		// Because .jsp files are compiled into servlets you have access to servlet stuff.
		
			// Like this JspWriter object:
			out.println("<ul><li>\'out\' is a JspWriter object.</li></ul>");	
		
	%>
	
	<p>This paragraph is outside the scriptlet but we can use stuff from inside the scriptlet:</p>		
	<ul>
		<li><%= todayText %></li>
	</ul>
	

</body>
</html>