<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    	<%--taglib directive --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>JSP Tutorial 8</title>
</head>
<body>

<h1>Index.jsp: This is the Landing Page JSP_Tutorial_8</h1>

<p>Website Hyperlinks</p>

<ul>
	<li><a href="${pageContext.request.contextPath }/rabbit">Video 52: using vid_52 database. Video_50_Controller --&gt; Video_51_home.jsp</a></li>
	<li><a href="${pageContext.request.contextPath }/Video_53_Controller?director=vid_52_home">Video 52: using vid_53 database. Video_53_Controller --&gt; Video_52_home.jsp</a></li>
	<li><a href="${pageContext.request.contextPath }/Video_53_Controller?director=vid_53_home">Video_53_Controller --&gt; Video_53_home.jsp</a></li>
</ul>

</body>
</html>