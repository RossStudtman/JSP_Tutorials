<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Display POJO</title>
</head>
<body>

	<%-- Import POJO class --%>
	<%@ page import="myObjects.Video_27_POJO" %>
	
	<h1>Display object that is inside session object</h1>
	
	<p>Display some property of your POJO object:</p>
	<%-- The following safe-guard was added in Video 28, if users have turned off cookies: --%>
	<% 
		Video_27_POJO pojo = (Video_27_POJO)session.getAttribute("pojo");	
	%>
	<%= pojo == null ? "POJO object not in session object" : pojo.getInfo() %>
	
	<%-- VIDEO 28 --%>
	<h1>Video 28 stuff</h1>
	
	<p>Create a link to Video_28_displayPojo.jsp</p>
	<ul>
		<li>This is the version that wont work if user has cookies turned off:</li>
		<li><a href="/JSP_Tutorial_Five/Video_27_Controller?director=vid28">Link to Video_28_displayPojo.jsp -- goes through controller</a></li>
	</ul>
	<ul>
		<li>This is the version that will work if user has cookies turned off:</li>
		<li><a href="<%= response.encodeURL(request.getContextPath() + "/Video_27_Controller?director=vid28") %>" >Link to Video_28_displayPojo.jsp -- goes through controller</a></li>
		
	</ul>
	<ul>
		<li>Note: response.encodeUrl() has been deprecated:
			<ul>
				<li>Instead use: URLEncoder.encode("name", "UTF-8") </li>
				<li>Trying that out: ...didn't work for me, here's what I had when I left off:</li>
				<li>&lt;a href=&quot;&lt;%= URLEncoder.encode(request.getContextPath() + &quot;/Video_27_Controller?director=vid28&quot; , &quot;UTF-8&quot;) %&gt; &quot; &gt;link&lt;/a&gt;</li>
			
			<li><a href="<%= URLEncoder.encode(request.getContextPath() + "/Video_27_Controller?director=vid28" , "UTF-8") %> " >link to Video_28_displayPojo.jsp</a></li>
			</ul>		
		</li>
	</ul>
	
	
	<%-- VIDEO 29 --%>
	<h1>Video 29 Stuff:</h1>
	
	<p>Display attribute given to ServletContext object.</p>
	<p>You can get ServletContext object in .jsp via the 'application' variable.</p>
	<p>Display the hit counter:</p>
	<ul>
		<li>Hit counter is: <%= application.getAttribute("hitCounterForSomeURL") %></li>
	</ul>

	<%-- VIDEO 30 --%>
	<h1>Video 30 Stuff:</h1>
	
	<p>Display key-value (name-value, actually) from the web.xml's &lt;context-param&gt;</p>
	<ul>
		<li>Admin name is: <%= application.getInitParameter("adminName") %></li>
	</ul>
	
	
	<%-- VIDEO 32 --%>
	<h1>Video 31 Stuff:</h1>
	
	<h2>Show cookies associated with this...server domain?</h2>
	
	<ul>
		<%-- If the following looks really confusing: see Video_10_ScriptletManipulations.jsp --%>
		<%
			// Get cookies
			Cookie[] cookies = request.getCookies();
		
			if(cookies == null){
		%>
				<li>No cookies found.</li>
		<%
			}else{				
				// Open for-loop
				for(int i = 0; i < cookies.length; i++){
					String name = cookies[i].getName();
					String value = cookies[i].getValue();						
		%>
				<li>Cookie <%=i %>: name = <%= name %>, value = <%= value %></li>
		<%
				// Close for-loop
				}	
			// Close else
			}
		%>
	</ul>
	
</body>
</html>