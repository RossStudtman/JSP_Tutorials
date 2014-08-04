<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%-- Add this so you can use jstl   --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<style >
body div:first-child{
	float: left;
}
body div:last-child{
	float: left;
	padding-left: 5em;
}
h1{
	color: blue;
}
table, th, td
{
border-collapse:collapse;
border:1px solid black;
}
th, td
{
padding:5px;
}
</style>
<title>Vid 45</title>
</head>
<body>
<div>
	<h1>Video 45</h1>
	
	<h3>Get value from beans:</h3>
	<ul>
		<li>Bean1: <c:out value="${bean1.email }" /></li>
		<li>Bean2: <c:out value="${bean2.email }" /></li>
		<li>Bean3: <c:out value="${bean3.email }" /></li>
	</ul>
	
	
	<h2>Video 46</h2>
	<h3>Get Bean data from scoped objects.</h3>
	<p>Scoped objects that JSTL has access to:</p>
	<ul>
		<li>pageScope</li>
		<li>requestScope</li>
		<li>sessionScope</li>
		<li>applicationScope</li>
	</ul>
	
	<p>Example of using sessionScope object:</p>
	<ul>
		<li>The email for bean 2 is: <c:out value="${sessionScope.bean2.email }"></c:out></li>
		<li>For giggles, try to get session scoped object with applicationScope: <c:out value="${applicationScope.bean2.email }"></c:out>
			<ul><li>As expected, it doesn't give any data.</li></ul>
		</li>		
	</ul>
	
	
	<h1>Video 47</h1>
	<h2>Iterating over a collection: a map</h2>
	
	<p>Key is a state, Value is the Capitol</p>
	<ul>
		<li>Key "Oregon" and the value is: <c:out value="${myMap['Oregon'] }"/></li>
	</ul>
	
</div>
<div>
	<h1>Video 48</h1>
	<h2>Iterating over a collection: a map</h2>
	<p>Display the html string: &lt;c:out&gt; escapes the URL string: (view source code to see it)</p>
	<ul>
		<li>The c:out tag: <c:out value="${myLink }" /></li>
		<li>Using EL directly: ${myLink }</li>
	</ul>
	
	
	<h1>Video 49</h1>
	<h2>Iterating over lists</h2>
	
	<ul>
		<li>The whole bean list: ${myList }</li>
		<li>Iterating through that list:
			<ul>
				<c:forEach var="bunnyRabbit" items="${myList }">
					<li>User email: ${bunnyRabbit.email }, user password: ${bunnyRabbit.password }</li>				
				</c:forEach>			
			</ul>		
		</li>
	</ul>
	<ul>
		<li>The cities String array: ${cities }</li>
		<li>Iterating through that list:
			<ul>
				<c:forEach var="bunnyRabbit" items="${cities }">
					<li>City: ${bunnyRabbit }</li>				
				</c:forEach>			
			</ul>		
		</li>		
	</ul>
	
	<p>Turn a list into select options:</p>
	<select>
		<c:forEach var="i" items="${cities }"> 
			<option value="${i }">${i }</option>
		</c:forEach>
	</select>
	
	<p>Turn the bean list into a table:</p>
	<table>
		<tr><th>Bean number</th><th>email</th><th>password</th></tr>
		<c:forEach var="i" items="${myList }" varStatus="varStatus">	
			<tr>
			<th>Bean number <c:out value="${varStatus.index}" />:</th>			
			<td>${i.email }</td><td>${i.password }</td>
			</tr>	
		</c:forEach>	
	</table>
	
	
</div>	
</body>
</html>