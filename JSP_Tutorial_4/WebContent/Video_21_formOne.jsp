<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Ross Studtman Notes</title>
</head>
<body>

	<!-- A form's "action" controls which URL the form goes to when submitted. -->
	<!-- Both of the following forms go to the same URL but each uses a different method. -->
	
	
	<!-- FIRST FORM for Video #21 -->
		<form action="/JSP_Tutorial_4/Video_21_Controller" method="get">
			<fieldset>	
			
				<legend>Video #21's form uses GET</legend>
				
				<label>Text field:</label>
				<input type="text" name="lookAtMeInURL"  />	
						
				<label>Submit button</label>
				<input type="submit" value="submit form one"  />
			
			</fieldset>	
		</form>
	
	<!-- quick and dirty input of space -->
		<br/> 
	
	<!-- SECOND FORM for Video #22 -->
		<form action="/JSP_Tutorial_4/Video_21_Controller" method="post">
			<fieldset>	
			
				<legend>Video #22's form uses POST</legend>
				
				<label>Text field:</label>
				<input type="text" name="lookAtMeInURL"  />	
						
				<label>Submit button</label>
				<input type="submit" value="submit form two"  />
			
			</fieldset>	
		</form>
	
	<!-- quick and dirty input of space -->
		<br/>	
	

	
	<!-- THIRD FORM for Video #23, the "bean form" on the video -->
		<form action="/JSP_Tutorial_4/Video_23_formHandler.jsp" method="post">
			<fieldset>	
			
				<legend>Video #23's form</legend>
				
				<%/*
				SUPER IMPORTANT:
					
					We are sending this form to another .jsp.
					That .jsp is using property="*" to find URL parameter that match our Bean's property names.
					Because of that, the names given to this form's elements need to match properties in our Bean.				
				
				*/ %>
				
				<label>User Name:</label>
				<input type="text" name="userName"  />	
				
				<label>User ID:</label>
				<input type="text" name="userID"  />	
						
				<label>Submit button</label>
				<input type="submit" value="submit form three to .jsp"  />
			
			</fieldset>	
		</form>
	

</body>
</html>