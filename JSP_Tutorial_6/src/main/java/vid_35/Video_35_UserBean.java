package vid_35;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * A JavaBean that is virtually identical to Video_24_UserBean.java 
 * 
 * @author Ross Studtman
 *
 */
public class Video_35_UserBean {
	
	// Instance fields
	private String email = "email";
	private String password = "password";
	
	/*
	 * Message for if this Bean cannot be validated. 
	 */
	private String errorMessage = "";
	
	// Default constructor -- JavaBean must have one.
	public Video_35_UserBean(){}
	
	// Custom constructor
	public Video_35_UserBean(String email, String password) {
		super();
		this.email = email;
		this.password = password;
	}
	
	// Validate this bean
	public boolean validate(){
		
		// If either password or email is null
		if(email.equals("email") || password.equals("password")){
			errorMessage = "Email and password must be set.";
			
			// Null values, return false
			return false;
		}
		
		// Regex req: digit, lower case, upper case, no white space, at least 5 in length;
		final String PASSWORD_REGEX = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=\\S+$).{5,}$";
		
		// Initialize
		Pattern pattern = Pattern.compile(PASSWORD_REGEX);
		Matcher matcher = pattern.matcher(password);
		
		// Validate password
		if(!matcher.matches()){
			
			errorMessage = "Password must be 5 characters in length and requires at least one digit, one lower case letter, one upper case letter, no spaces.";
			
			// Password doesn't validate, return false.
			return false;
		}
		
		// Validate email
		final String EMAIL_REGEX = "^[\\w-]+[\\.\\w-]*@[\\w-]+\\.[\\.\\w+]*\\w{2,6}$";
		
		// Re-assign
		pattern = Pattern.compile(EMAIL_REGEX);
		matcher = pattern.matcher(email);
		
		if(!matcher.matches()){
			errorMessage = "Invalid email.";
			
			// Email doesn't validate, return false.
			return false;
		}
		
		// Password & Email validate, return true.
		return true;
	}
	
	// Getters & Setters
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}

	// Error message only has a getter.
	public String getErrorMessage() {
		return errorMessage;
	}
}
