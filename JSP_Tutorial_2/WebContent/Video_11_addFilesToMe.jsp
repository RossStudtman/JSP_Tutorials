<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@page import="myClasses.Test.EnumURLparameters"%>
<%@page import="java.net.URLPermission"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert title here</title>
</head>
<body>

	<!-- Add an include directive for your three files -->
	
		<!-- This way of including files is good for content that is more static in nature. -->
		<%@include file="Video_11_AddFiles/fileOne.txt" %>
		<%@include file="Video_11_AddFiles/fileTwo.txt" %>
		<%@include file="Video_11_AddFiles/fileThree.txt" %>
	
	
	<!-- Use the following way for content that changes frequently : -->
	
		<!-- Using a jsp:include prompts this small portion to make a separate call to the server. -->
		<jsp:include page="Video_11_AddFiles/hourlyWeather.txt" />
	
	<!-- Now include a .jsp that has ONLY java code in it: -->
			
		<%@ include file="Video_11_AddFiles/jspFragment.jsp" %>
	
		<!-- Now access a variable from within that added .jsp: -->
		<%=variableInsideJSPFragment%>
	
	<!-- Now load a file based on a URL parameter. -->		
	
		<!-- 
			!! Presenting two algorithms for using parameter in switch statement !!  
					myClasses/Test.java was created for these algorithms.				
		-->
		
		<h1>Using URL supplied parameter in a switch-condition:</h1>
		
		<!-- Import class created for these algorithms. -->
		<%@page import="myClasses.Test" %>
		
		<!-- Implement algorithms. -->	
		<%
			// Get the parameter.
			String weather = request.getParameter("weather");
				
			// Check if parameter is null, ie was not supplied.
			if(weather == null){
				weather = EnumURLparameters.NO_VALUE.name();	// Assign String name for an enum in Test class.
			}				

				
			////////////////////////////////////////////////////////
			////		 1st Algorithm: uses Enum. 				////
			////////////////////////////////////////////////////////
				/*	
			
				// Convert parameter to uppercase (Enum.valueOf() needs uppercase argument).
				weather = weather.toUpperCase();
				
				// Define outside of try-catch
				EnumURLparameters enumParameter;
				
				// Get enum associated with parameter (an uppercase string at this point in time).
				try{
					enumParameter = EnumURLparameters.valueOf(weather); 	// Attempts to return Enum constant given a String argument.
				}catch (IllegalArgumentException e){
					enumParameter = EnumURLparameters.INCORRECT_VALUE;		// If String not in enum set, assign an enum from the set.
				}
			
			
				*/
			////////////////////////////////////////////////////////
			////	 	2nd Algorithm: Uses HashMap	& Enum	    ////
			////////////////////////////////////////////////////////
									
				
				// Convert parameter to uppercase (map keys are in uppercase).
				weather = weather.toUpperCase();
				
				// Get value (an enum) from map using parameter as the key. 
				EnumURLparameters enumParameter = Test.map.get(weather);
				
				// If key-value pair not in the Map the Enum variable 'enumParameter' will be null.
				if(enumParameter == null){
					enumParameter = EnumURLparameters.INCORRECT_VALUE;	// Assign value from enum in Test class.
				}		
				
		%>		
		<!-- Switch statement: determine what to do based on URL parameter (which is now an enum) -->
		<% 
			switch(enumParameter){
			case SUNNY:
				// include sunnyWeather.html
				%>
					<jsp:include page="Video_11_AddFiles/sunnyWeather.html" />
				<%
				break;
			case RAINY:
				// include rainyWeather.html
				%>
					<jsp:include page="Video_11_AddFiles/rainyWeather.html" />
				<%
				break;
			case NO_VALUE:
				// HTML to show weather parameter was not given
				%>
					<p>URL did not contain a 'weather' parameter key.</p>
				<%
				break;
			case INCORRECT_VALUE:
				// HTML to show an incorrect value was given to the key
				%>
					<p>URL contained parameter key 'weather' key but the value assigned to it was not recognized</p>
				<%
				break;
			default: 
				// This HTML should never (?) run.
				%>
					<h2>Something funky happened with the key 'weather' and the value supplied in the URL. Sorry.</h2>
				<%
				
			// Close switch-conditional.
			}
		%>	

</body>
</html>