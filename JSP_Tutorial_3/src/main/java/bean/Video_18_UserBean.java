package bean;


/**
 * This class demonstrates a simple bean example.
 * 
 * The instance field "id" used to be "userID" but was changed during
 * testing for Video #20. See one of the bottom notes of Video #20's notes.
 * 
 * 	This was changed, by the way, to determine if the .jsp was zeroing in on
 * actual property names or the getters and setters. Result: it looks for
 * the getter and setter names and infers there's a property that matches the
 * naming convention of the getter and setter.
 * 
 * 	At any rate, for videos prior to Video #20 the "id" field was "userID".
 * 		See notes below for more clarification.
 * @author Ross Studtman
 *
 */
public class Video_18_UserBean {
	
	// Bean's instance fields -- can also be called "properties"
	 String userName = null;
	 
	 // This was changed from "userID" to "id" to test if would still work.
	 // Note the name of the getters and setters, though. That's what the .jsp keys in on.
	 int id = 0;
	
	// Default Constructor
	public Video_18_UserBean(){
		// No-arg constructor is required.
		// But, don't need to explicitly include no-arg constructor
		// unless you define another constructor.
	}
	

	
	// Typical Getters & Setters for instance fields.
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	// For testing was changed from "return userID" to "return id"
	public int getUserID() {
		return id;
	}
	
	// For testing was changed from "this.userId = userID" to "this.id = userID"
	public void setUserID(int userID) {
		this.id = userID;		
	}	
}
