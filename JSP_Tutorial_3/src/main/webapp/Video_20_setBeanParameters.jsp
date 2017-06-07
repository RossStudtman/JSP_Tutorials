<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Set Bean Properties using URL Parameters</title>
</head>
<body>

	<!-- Associate this JSP with the JavaBean -->
		<jsp:useBean id="parameterBean" class="bean.Video_18_UserBean" scope="page"></jsp:useBean>

	<h1>Set Bean Properties using URL Parameters</h1>
	
	<h2>There are FOUR ways to use jsp:setProperty:</h2>
	
	<%/*   
	
	Hard code userName property:
	<jsp:setProperty name="vid23" property="userName" value="String" />
	
		...you have to specify the property you want set.
		...you have to specify the value you want it set to.
	
	Use URL parameter to set userName property:
	<jsp:setProperty name="vid23" property="userName" param="key_from_URL" />
	
		...you have to specify the property you want to set.
		...you have to specifically look for a parameter key in the URL.
	
	Use any URL parameters that match the userName property in our Bean:
	<jsp:setProperty name="vid23" property="userName" />
	
		...you have to specify the property you want set.
		...you do NOT have to specifically look for a parameter key in the URL.
	
	Use any URL parameters that match any of the properties in our Bean:
	<jsp:setProperty name="vid23" property="*" />
	
		...you do NOT have to specify the property to set.
		...you do NOT have to specifically look for a parameter key in the URL.	
	
	
	*/ %>
	
	<ol>
		<li>Hard code the property:
			<ul><li>&lt;jsp:setProperty name="parameterBean" property="userName" value="Ross Studtman" /&gt;</li></ul>
			<p/>
		</li>
		<li>Use URL parameter key to specify the value to look for (to insert into the property):
			<ul><li>&lt;jsp:setProperty name="parameterBean" property="userName" param="key_from_URL" /&gt;</li></ul>
			<p/>
		</li>		
		<li>Look for one URL parameter key that matches the Bean property name:
			<ul><li>&lt;jsp:setProperty name="parameterBean" property="userName" /&gt;</li></ul>
			<p/>
		</li>
		<li>Look for ANY URL parameter keys that match the properties in our Bean:
			<ul><li>&lt;jsp:setProperty name="parameterBean" property="*" /&gt;</li></ul>
			<p/>
		</li>
	</ol>
	
	
	<h2>Now use those four ways to set the properties of our bean:</h2>
		<ol>
			<li>
				<p>Hard coding:</p>
				<jsp:setProperty name="parameterBean" property="userName" value="Ross Studtman" />
				<jsp:setProperty name="parameterBean" property="userID" value="5" />
				<p/>
				<p>Add this to browser address: *nothing*</p>
			</li>		
			<li>			
				<p>Look inside URL for key designated by "param" (param set to key1 &amp; key2):</p>
				<jsp:setProperty name="parameterBean" property="userName" param="key1" />
				<jsp:setProperty name="parameterBean" property="userID" param="key2" />
				<p/>	
				<p>Add this to browser address: ?key1=Firefly&amp;key2=5</p>		
			</li>		
			<li>			
				<p>Look inside URL for ONE key with same name as our bean properties:</p>
				<jsp:setProperty name="parameterBean" property="userName" />
				<jsp:setProperty name="parameterBean" property="userID" />
				<p/>			
				<p>Add this to browser address: ?userName=Malcolm&amp;userID=1</p>
			</li>		
			<li>			
				<p>Look inside URL for ANY keys with same name as our bean properties</p>
				<jsp:setProperty name="parameterBean" property="*"  />	
				<p/>
				<p>Add this to browser address: ?userName=SameAsAbove&amp;userID=100</p>		
			</li>		
		</ol>		
		
	<p>Note the browser address changes in methods 1 through 3. The difference between technique 3 and 4 is three only 
		looks for keys that match the properties you specify; while four looks for keys that match all bean properties.</p>
	
	<%--Just learned this...it is a JSP comment that will NOT show up in the browser. --%>
	<!-- Access Bean properties: -->
		<h3>Results:</h3>
		<p>User Name is: <%= parameterBean.getUserName() %></p>
		<p>User ID is: <%= parameterBean.getUserID() %></p>
	
	
	

</body>
</html>