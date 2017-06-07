<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
	<%--taglib directive --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

	<%-- Video 52 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

	<%-- Video 56 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<%-- Video 59 --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>	

	<%-- Video 60 --%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="rs" %>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />

	<%-- LINK THE STYLE SHEET --%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/styles/Video_50_homePage.css" />

<title>Vid 56</title>
<style >
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
</head>
<body>


<c:import url="Video_51_header.jsp">
	<c:param name="tagLine" value="Take My Love, Take My Land...You Can't Take The Sky From Me!"></c:param>
</c:import>
	
		
	
	<sql:transaction dataSource="jdbc/vid_53" >
	
	<sql:query var="rabbit" >
		SELECT * 
		FROM images
		WHERE id=?
		<sql:param>${param.imageID }</sql:param>		
	</sql:query>
	
	<c:set scope="page" var="oneResult" value="${rabbit.rows[0]}" />
	
	<c:set scope="page" var="imageName" value="${oneResult.imageName }.${oneResult.image_extension }" />
	
	<c:set scope="page" var="average_ranking" value="${oneResult.average_ranking}" />
	
	<c:if test='${param.director == "rankImage"}' >	
		
		<c:set scope="page" var="newAverageRank" value="${ (oneResult.average_ranking * oneResult.number_of_rankings + param.ranking) / (oneResult.number_of_rankings +1) }" />
				
		<c:set scope="page" var="average_ranking" value="${newAverageRank}" />	
		
		<sql:update>
			UPDATE images
			SET average_ranking=?
			WHERE id=?
			<sql:param>${newAverageRank }</sql:param>
			<sql:param>${param.imageID }</sql:param>
		</sql:update>
		
		<sql:update>
			UPDATE images
			SET number_of_rankings=?
			WHERE id=?
			<sql:param>${oneResult.number_of_rankings +1 }</sql:param>
			<sql:param>${param.imageID }</sql:param>
		</sql:update>
	
	</c:if>
	
	</sql:transaction>
<div id="wrapper">	
<div id="content">		


	
	<h1><c:out value="${fn:substring(oneResult.imageName, 0, 6)}: ${fn:substring(oneResult.imageName, 6, -1)}" /></h1>
	
	<p id="ranked">Average Rank: <fmt:formatNumber value="${average_ranking }" maxFractionDigits="1" /></p>
	
		<%-- Video 60 custom tag --%>
		
	<rs:Video_60_CustomTags width="300" fileName="${oneResult.imageName}" fileExtension="${oneResult.image_extension}" />
	
	<%/* 
	<img width="300" src="${pageContext.request.contextPath }/images/${imageName}" />
	*/%>
	
	<form action="${pageContext.request.contextPath }/Video_53_Controller?director=rankImage&imageID=${oneResult.id }" method="post">
		<fieldset>
			<legend>Rank it!</legend>
			<label><input type="radio" name="ranking" value="5" />5 - Amazing</label>
			<label><input type="radio" name="ranking" value="4" />4 - Good</label>
			<label><input type="radio" name="ranking" value="3" />3 - Average</label>
			<label><input type="radio" name="ranking" value="2" />2 - Bad</label>
			<label><input type="radio" name="ranking" value="1" />1 - Horrendous</label>
		</fieldset>		
		<label><input type="submit" value="submit" /></label>	
	</form>
	
</div>
	
<c:import url="Video_51_footer.jsp"></c:import>
		
</div>		
</body>
</html>