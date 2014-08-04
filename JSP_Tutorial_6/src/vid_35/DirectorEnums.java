package vid_35;

/**
 * An enum to contain values we want to recognize for the URL parameter key "director".
 * 
 * @author Ross Studtman
 *
 */
public enum DirectorEnums {
	
	// take user to log in page
	LOGIN,
	
	// validate log in form
	DOLOGIN,
	
	// take user to new account page
	NEW_ACCOUNT,
	
	// validate new account form
	NEW_ACCOUNT_FORM,
	
	// No value given for parameter key.
	NO_VALUE, 
	
	// Value given for parameter key but it is unrecognized.
	INCORRECT_VALUE
}
