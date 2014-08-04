<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%-- Add this so you can use jstl   --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<style>
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
</style>
<title>JSTL</title>
</head>
<body>

<div>

		<%-- A jstl tag --%>
		<%-- A c-out tag allows you to do the same kinds of things you could do with expressions' <%= %> --%>
		
		<h1>Video 39</h1>
		<h2>Using the &lt;c:out&gt;</h2>
		<p><c:out value="Hello from a c:out tag!"></c:out></p>
		
		
		
		<h1>Video 40</h1>
		<h2>Using EL: Expression Language to obtain data from a Bean.</h2>
		<%-- Associate a Bean with this .jsp page --%>
		
		<jsp:useBean id="vid_40" class="beans.Video_40_UserBean" scope="page"></jsp:useBean>
		
		<%-- Expression Language: EL --%>
		<p>Expression Language getting "info" from bean: <c:out value="${vid_40.info }" /></p>
		
		
		
		<h1>Video 41</h1>
		<h2>Getting URL Parameters.</h2>
		
		<%-- Getting URL parameters --%>
		<p>A URL parameter you've supplied (hint: put a ? and a key=value pair like ?ross=amazing):</p>
		<ul><li><c:out value="${param.ross }" /></li></ul>


		
		<h1>Video 42</h1>
		<h2>Using the JSTL "if" conditional</h2>
		
		<p>JSTL's "if" is limited, it cannot have an if-else.</p>
		
		<%-- Condition to be tested goes inside the test="" part. --%>
		<c:if test="${param.name == 'Ross' }">
			<ul><li>Hello Ross!</li></ul>
		</c:if>
		
		<c:if test="${param.name != 'Bob' }">
			<ul><li>You are NOT! Bob.</li></ul>
		</c:if>
</div>
<div>
		<h1>Video 43</h1>
		<h2>JSTL "choose" tag</h2>
		<p>The "choose" tag is a lot like a switch statement:</p>
		<ul>
			<li>&lt;c:when&gt; is a lot like an "case" in the switch</li>
			<li>You can have many &lt;c:when&gt; tags inside the &lt;c:choose&gt; tag</li>
			<li>And the &lt;c:otherwise&gt; is like the switch statement's "default": it takes no logic.</li>
		</ul>
		<c:choose>
			<%-- "if this --%>
			<c:when test="${param.id == 1 }">
				<ul><li>ID is equal to 1</li></ul>
			</c:when>
			<%-- "if this" --%>
			<c:when test="${param.id == 2 }">
				<ul><li>ID is equal to 2</li></ul>
			</c:when>
			<%-- "else this" --%>
			<c:otherwise>
				<ul><li>Param ID was neither 1 or 2</li></ul>
			</c:otherwise>
		</c:choose>
		
		
		
		<h1>Video 44</h1>
		<h2>JSTL "for each loop"</h2>
		
		<%-- 
			"var" is the loop counter variable. 
			"begin" is where the "var" starts?
			"end" is what the last value of "var" will be
			"step" describes how to advance the "var"
			"varStatus" does something...
		--%>
		<h4>Creating &lt;li&gt; elements inside &lt;c:forEach&gt;:</h4>
		<ul>
		<c:forEach var="i" begin="0" end="5" step="2" varStatus="myStatus">		
			<li>The loop counter "var" is: <c:out value="${i }" />
				<ul>
					<li>varStatus is: <c:out value="${myStatus}"></c:out>				
						<c:if test="${myStatus.first }">
							<ul>
								<li>This was the first iteration.</li>
							</ul>
						</c:if>
						<ul>
							<li>varStatus current: <c:out value="${myStatus.current }" /></li>
							<li>varStatus index:   <c:out value="${myStatus.index }" /></li>
							<li>varStatus count:   <c:out value="${myStatus.count }" /></li>
							<li>varStatus first:   <c:out value="${myStatus.first }" /></li>							
							<li>varStatus last:    <c:out value="${myStatus.last }" /></li>							
							<li>varStatus begin:   <c:out value="${myStatus.begin }" /></li>
							<li>varStatus end:     <c:out value="${myStatus.end }" /></li>
							<li>varStatus step:    <c:out value="${myStatus.step }" /></li>
						</ul>
						<c:if test="${myStatus.last }">
							<ul>
								<li>This was the last iteration.</li>
							</ul>
						</c:if>
					</li>			
				</ul>			
			</li>			
		</c:forEach>
		</ul>

</div>
</body>
</html>