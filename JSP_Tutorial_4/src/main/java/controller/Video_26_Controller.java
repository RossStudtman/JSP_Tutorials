package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Video_24_UserBean;

/**
 * Servlet implementation class Video_26_Controller
 */
@WebServlet("/Video_26_Controller")
public class Video_26_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_26_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// URL parameter value for "director"
		String goToThisPage = whereDoIGo(request.getParameter("director"), request);
		
		// Assign attributes to the request object - will assign defaults to form's <input>
		request.setAttribute("email", "email");
		
		// Probably don't want to send back the password like this...but fine for tutorial.
		request.setAttribute("password", "password");
		
		// Assign error message to attribute
		request.setAttribute("errorMessage", ""); 	// Empty in doGet so it doesn't show up in form.
		
		// Forward to page		
		request.getRequestDispatcher(goToThisPage).forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// URL parameter value for "director"
		String goToThisPage = whereDoIGo(request.getParameter("director"), request);
		
		// Forward to page
		request.getRequestDispatcher(goToThisPage).forward(request, response);		
		
	}
	
	
	/**
	 * Convenience method: moving logic out of doGet() and doPost()
	 * 
	 * @param urlParameter is the URL parameter "director" supplied to doGet() & doPost().
	 * @param request is a HttpServletRequest object because when doPost is sent bean information, we need to get at it.
	 * @return URL string
	 */
	private String whereDoIGo(String urlParameter, HttpServletRequest request){
		
		// URL string to be returned
		String urlResult;
		
		// Check if parameter is null, ie, was not supplied
		if(urlParameter == null){
			urlParameter = DirectorEnums.NO_VALUE.name(); 	// Assign name of enum to String.
		}
		
		// Convert parameter to uppercase (give Enum.ValueOf() an uppercase argument)
		urlParameter = urlParameter.toUpperCase();
		
		// Define outside of try-catch
		DirectorEnums enumDirector;
		
		// Get enum associated with string
		try{
			enumDirector = DirectorEnums.valueOf(urlParameter);	// return enum associated with this string
		}catch (IllegalArgumentException e){
			enumDirector = DirectorEnums.INCORRECT_VALUE;		// no enum associated with given string, assign enum.
		}
		
		// Switch statement using enums
		switch(enumDirector){
		case LOGIN:
			urlResult = "/Video_26_loginForm.jsp";
			break;
		case DOLOGIN:
			urlResult = validateLoginForm(request);
			break;
		case INCORRECT_VALUE:
			urlResult = "/Video_26_errorPage.jsp";
			break;
		case NO_VALUE:
			urlResult = "/index.jsp";
			break;
		default:
			urlResult = "should not be here"; // yep, that'll throw an error but I want to see it should that happen.
			break;
		
		}		
		
		// Return URL string.
		return urlResult;
	}
	
	/**
	 * Validates the Video_26_loginForm.jsp
	 * 
	 * @param request contains the URL parameters the form sent.
	 * @return URL string
	 */
	private String validateLoginForm(HttpServletRequest request){
				
		// URL string to return
		String urlResult;
		
		// URL parameter value for "email"
		String email = request.getParameter("email");
		
		// URL parameter value for "password"
		String password = request.getParameter("password");
		
		// Create a Video_24_UserBean bean
		beans.Video_24_UserBean userBean = new Video_24_UserBean(email, password);
		
		// Validate bean
		if(userBean.validate()){
			
			// Validation success
			urlResult = "/Video_26_WelcomeToInnerSanctum.jsp";
			
		}else{			
			// Validation failure
			
			// Set request.Attribute so parameters are sent back to Video_26_loginForm
				/*	Works because "request" is an object, objects are passed by reference value,
				 *	so changing the object here changes the same object that is in doPost. */			
			request.setAttribute("email", email);
			
			// Probably don't want to send back the password like this...but fine for tutorial.
			request.setAttribute("password", password);
			
			// Set error message attribute to Bean's error message
			request.setAttribute("errorMessage", userBean.getErrorMessage());		
			
			// Send them back to form
			urlResult = "/Video_26_loginForm.jsp";
		}		
		
		// Return URL string
		return urlResult;
	}

}
