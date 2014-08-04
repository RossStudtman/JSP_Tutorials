<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%@ attribute name="width" required="false" type="java.lang.Integer" description="image width in pixels" %>
<%@ attribute name="fileName" required="true" type="java.lang.String" description="file name without extension" rtexprvalue="true" %>
<%@ attribute name="fileExtension" required="true" type="java.lang.String" description="file extension" rtexprvalue="true" %>


<c:if test="${empty width}" >

	<c:set var="width" value="200" />
	
</c:if>


<c:set scope="page" var="imageName" value="${fileName }.${fileExtension }" />


<img width="${width }" src="${pageContext.request.contextPath }/images/${imageName}" />


