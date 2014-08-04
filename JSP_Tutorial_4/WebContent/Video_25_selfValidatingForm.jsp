<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Self Validating Form</title>
</head>
<body>

	<%-- Add jsp:useBean to associate a Bean with this .jsp --%>
	<jsp:useBean id="vid25" class="beans.Video_24_UserBean" scope="session"></jsp:useBean>
	
		<%-- ...first time this .jsp is accessed this creates a Video_24_UserBean object (unless some other page created it first, but that's not true in this tutorial. --%>
	
	<%-- Use jsp:setProperty to grab all URL parameters matching our Bean's getters and setters --%>
	<jsp:setProperty name="vid25" property="*" />
	
		<%-- ...first time this .jsp is accessed Video_24_UserBean's properties are at default. --%>
		<%-- ...if form has been submitted then there are URL parameters and the bean's properties will be set to these. --%>
	
	<%-- Use a scriptlet to determine: A) has the form been sent yet? B) does the bean validate? --%>
	<%
	
		// Get URL parameter that will only be present if form was submitted
		String formSent = request.getParameter("formSent");
	
		// Get value of URL parameter, if it is there NOW try to validate the bean.
		if(formSent != null && formSent.equals("true")){
			
			// Attempt to validate the bean.
			if(vid25.validate()){
				
				// Bean has validated, forward to new URL (eg, the controller).
				request.getRequestDispatcher("/Video_21_Controller").forward(request, response);
			}
		}
		
	%>
	
	<%-- 
	
		Header for reporting errors via the Video_24_UserBean's errorMessage property.
		Because this property has a default of "" it will not be "shown" on the page.
		Although the <h2> tag will be present in the HTML and be a block element.
	
	 --%>
	 <h2><jsp:getProperty name="vid25" property="errorMessage" /></h2>

	<h1>Self Validating Form</h1>
	
		<%-- Make the form submit to itself --%>
		<form action="/JSP_Tutorial_4/Video_25_selfValidatingForm.jsp" method="post">
		
			<%/* 
				Add a hidden input type. 
				When this .jsp is first accessed the value of this input element will NOT be in the URL's parameters.
				After hitting the submit button this hidden value WILL be in the URL parameters.
				
				With this knowledge you can decide wether to actually run the Video_24_UserBean.validate() method.
				And that's exactly what the logic in the scriptlet up above is doing.
				
					You don't want to run the validate() method when the page first loads because an error will be
					seen on the page (the "errorMessage" property will have content) and it would be alarming to the 
					users to see an error for input they haven't even tried to input yet.
			*/%>
			<input type="hidden" name="formSent" value="true" />
			
			<fieldset>	
			
				<legend>Video #25's Self Validating Form</legend>
				
				<%/*
				SUPER IMPORTANT:
					
					The names given to this form's elements should match properties in our Video_24_UserBean.	
					
					Additionally, <input>'s value is being set to a jsp:setProperty.
				
				*/ %>
				
				<label>Email:</label>
				<input type="text" name="email" value="<jsp:getProperty name="vid25" property="email" />"  />	
				
				<label>Password:</label>
				<input type="text" name="password" value="<jsp:getProperty name="vid25" property="password" />"  />	
						
				<label>Submit button</label>
				<input type="submit" value="submit"  />
			
			</fieldset>	
		</form>

</body>
</html>