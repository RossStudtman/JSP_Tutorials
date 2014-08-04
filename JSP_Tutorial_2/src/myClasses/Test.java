package myClasses;

import java.util.HashMap;

/**
 * This class exists to test how to take a parameter obtained from a URL and use 
 * that within a switch statement. 
 * 
 * Two algorithms are used within "Video_11_addFilesToMe.jsp" to achieve the goal of this class.
 * 		One of the algorithms only uses the enum.
 * 		The other makes use of the HashMap and enum.
 * 
 * 		Of the two algorithms I favor the enum-only version because it is lighter.
 * 
 * 		However, a notch in the HashMap's favor is thinking of a scenario where the
 * 		parameter is the key and instead of an enum as the value there are HTML
 * 		files or hyperlinks to direct traffic. 
 * 		...I don't know, I'm still learning, but there are interesting possibilities.
 * 
 * @author Ross Studtman
 *
 */
public final class Test {
	
	/**
	 * An enum to contain values we want to recognize for the URL parameter key "weather".
	 * 
	 * @author Ross Studtman
	 *
	 */
	public enum EnumURLparameters {SUNNY, RAINY, NO_VALUE, INCORRECT_VALUE};

	/**
	 * This HashMap is used in one of the algorithms in "addFilesToMe.jsp" to achieve
	 * using a URL parameter in a switch statement.
	 * 
	 * @param String is the URL string key, which should be supplied as an uppercase argument.
	 * @param EnumURLparameters is an enum-type value.
	 */
	public static final HashMap<String, EnumURLparameters > map = new HashMap<String, EnumURLparameters>();
	
	// Statically filling the map with accepted values for the URL parameter key 'weather'.
	static{
		map.put("SUNNY", EnumURLparameters.SUNNY );
		map.put("RAINY", EnumURLparameters.RAINY);
		map.put("NO_VALUE", EnumURLparameters.NO_VALUE);				
		map.put("INCORRECT_VALUE", EnumURLparameters.INCORRECT_VALUE);
	}
	
	
	
	
	 
	 
}
