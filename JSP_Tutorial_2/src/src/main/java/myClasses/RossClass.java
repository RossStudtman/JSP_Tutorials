package myClasses;

/**
 * A simple class for demonstrating that .jsp page imports can import my own 
 * classes.
 * 
 * @author Ross Studtman
 *
 */
public class RossClass {
	// A POJO data field.
	String stringData;
	
	// POJO constructor.
	public RossClass(String stringData) {
		this.stringData = stringData;
	}	
	
	// A simple method to call and demonstrate something happening.
	public String foo(){
		return "Hello from RossClass method!";
	}
	
	// POJO getters & Setters
	public String getStringData() {	return stringData;	}
	public void setStringData(String stringData) {	this.stringData = stringData; }

	// POJO toString()
	@Override
	public String toString() {
		return "RossClass [stringData=" + stringData + "]";
	}
	
	
	
}
