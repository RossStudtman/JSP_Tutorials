package controller;

/**
 * An enum to contain values we want to recognize for the URL parameter key "director".
 * 
 * @author Ross Studtman
 *
 */
public enum DirectorEnums {
	
	// Login page
	LOGIN,
	
	// Dologin
	DOLOGIN,
	
	// No value given for parameter key.
	NO_VALUE, 
	
	// Value given for parameter key but it is unrecognized.
	INCORRECT_VALUE
}
