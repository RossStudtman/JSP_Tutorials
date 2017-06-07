 package vid_35;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Used for Videos 35 & 36.
 * 
 * Note: there is some serious code repetition that could be refactored out of
 * "verifyAccountInfor()", "userInDatabase()", and "createNewAccount()" but I'm 
 * not doing that at this time as learning sometimes feasts on repetition.
 * 
 * Servlet implementation class Video_35_Controller
 */
@WebServlet("/Video_35_Controller")
public class Video_35_Controller extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * The Datasource object
	 */
	private DataSource dataSource; 			// import javax.sql.DataSource	
	
	/**
	 * The Connection object
	 */
	Connection connection = null;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_35_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		
		// Make InitialContext object
		try {
			InitialContext iContext = new InitialContext();
			
			// Make Context object
			Context context = (Context)iContext.lookup("java:comp/env");
			
			// Create DataSource object by "looking up" datasource object using Context object
			dataSource = (DataSource)context.lookup("jdbc/webshop");
			
			
		} catch (NamingException e) {
			throw new ServletException("failure to initialize context");
		}		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		
		String director = request.getParameter("director");
		
		// If URL key "director" is "login" set form defaults:
		if(director != null && director.equals("login")){
			
			// Assign attributes to the request object - will assign defaults to form's <input>
			request.setAttribute("email", "email");
			
			// Probably don't want to send back the password like this...but fine for tutorial.
			request.setAttribute("password", "password");
			
			// Assign error message to attribute
			request.setAttribute("errorMessage", ""); 	// Empty in doGet so it doesn't show up in form.
		}
		
		// If URL key "director" is "new_account" set form defaults:
		if(director != null && director.equals("new_account")){
			request.setAttribute("email", "email");
			request.setAttribute("password", "");
			request.setAttribute("rPassword", "");
			request.setAttribute("errorMessage", "");
		}
		
		// Send user to where "director" key points them
		whereDoIGo(director, request, response);					
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		// Send user to where "director" indicates they should go
		whereDoIGo(request.getParameter("director"), request, response);				
	}
	
	
	/**
	 * Convenience method: moving logic out of doGet() and doPost()
	 * 
	 * @param urlParameter is the URL parameter "director" supplied to doGet() & doPost().
	 * @param request is a HttpServletRequest object 
	 * @param response is a HttpServletResponse object 
	 */
	private void whereDoIGo(String urlParameter, HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException{
		
		// URL string for the file the user should be taken to next.
		String whereToGo;
		
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
			whereToGo = "/Video_35_login.jsp";
			break;
		case DOLOGIN:			
			whereToGo = doLogin(request);
			break;
		case NEW_ACCOUNT:
			whereToGo = "/Video_36_NewAccount.jsp";
			break;
		case NEW_ACCOUNT_FORM:
			whereToGo = newAccount(request);
			break;
		case INCORRECT_VALUE:
			whereToGo = "/Video_35_errorPage.jsp";
			break;
		case NO_VALUE:
			whereToGo = "/index.jsp";
			break;
		default:
			whereToGo = "Error in Switch Statement"; // yep, that'll throw an error but I want to see it should that happen.
			break;		
		}		
		
		// Forward to page		
		request.getRequestDispatcher(whereToGo).forward(request, response);	
	}
	

	

	
	/**
	 * doLogin performs validation of form data and if data is in proper format then
	 * checks database for email and password combo.
	 * 
	 * @param request is an HettpServletRequest object.
	 * @return URL String for the file the user should be directed to.
	 */
	private String doLogin(HttpServletRequest request){
		
		// URL string
		String whereToGo;
		
		// Get parameters associated with form
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		// Check form data for valid format
		if(validateFormData(request, email, password)){
			
			// Format valid, does email + password exist in database?
			if(verifyAccountInfo(email, password)){
				
				// Correct account information
				whereToGo = "/Video_35_innerSanctum.jsp";	
				
			}else{
				
				// Incorrect login information: no email + password combo in database
				request.setAttribute("email", email);
				request.setAttribute("password", password);		// not wise, but fine for tutorial
				request.setAttribute("errorMessage", "email or password not recognized");
				
				// Send user back to form
				whereToGo = "/Video_35_login.jsp";
			}			
		}else{
			// invalid format for login data
			
			// Send user back to form
			whereToGo = "/Video_35_login.jsp";
		}				
		// Return URL string
		return whereToGo;
	}
	
	/**
	 * validateFormData assess whether data from form is in proper format.
	 * If form data in invalid format set request attributes
	 * to failed data (these can be used to repopulate the form with this data) and
	 * set error message as a request attribute.
	 * 
	 * @param email is the email supplied to the login form.
	 * @param password is the password supplied to the login form.
	 * @return Return <code>true</code> if login information is in valid format. 
	 * Return <code>false</code> if login information is in invalid format.
	 */
	private boolean validateFormData(HttpServletRequest request, String email, String password){
		
		// Create a Video_35_UserBean bean
		vid_35.Video_35_UserBean userBean = new Video_35_UserBean(email, password);
		
		// Validate bean
		if(userBean.validate()){
			
			// Validation success			
			return true;
			
		}else{			
			
			// Validation failure		
			
			// Set request attributes to be sent back to Video_35_login.jsp		
			request.setAttribute("email", email);
			request.setAttribute("password", password);		// not wise, but fine for tutorial
			request.setAttribute("errorMessage", userBean.getErrorMessage());	// set error message
			
			return false;
		}		
	}		
	
	/**
	 * verifyAccountInfo contains the logic that writes the database query to check if the user
	 * has entered a email + password combination that exists in the database.
	 * 
	 * @param email is one-half of the string combo to check if exists in database.
	 * @param password is the other-half of the string combo to check if exists in database.
	 * @return <code>true</code> if email + password combo exist in database, otherwise <code>false</code>.
	 */
	private boolean verifyAccountInfo(String email, String password){
	
		// Protect against SQL injection attacks by using ?s
		String sqlString = "SELECT COUNT(*) AS count FROM users WHERE email=? AND password=?";
		
		int count = 0;
		
		// make database connection
		openDatabaseConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(sqlString); // import java.sql.PreparedStatement
			
			// Set question marks 
			statement.setString(1, email);
			statement.setString(2, password);
			
			// Get result set			
			ResultSet resultSet = statement.executeQuery();			
			
			// Result set's pointer is positioned before the first result
			if(resultSet.next()){
				count = resultSet.getInt("count");
			}
			
			// Close your result set!
			resultSet.close();
			
		} catch (SQLException e) {
			// "Do something sensible here," says John :) --> forward to error.jsp page or something.
			e.printStackTrace();
		}finally{
			
			// close database connection
			closeDatabaseConnection();
		}
		
		// If count equals zero, there's no record of that email and password combo.
		if(count == 0){
			return false;
		}else{
			return true;
		}		
	}
	
	/**
	 * Open a database connection
	 * 
	 * @return a Connection object.
	 */
	private void openDatabaseConnection(){
		
		// Make a database connection
		try {
			connection = dataSource.getConnection();		// add import java.sql.connection
		} catch (SQLException e) {
			// maybe forward to a .jsp error page?
			e.printStackTrace();
		}		
	}
	
	/**
	 * Close database connection
	 */
	private void closeDatabaseConnection(){
		
		// Close your connection:
		if(connection != null){
			try {
				connection.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}		
	
//////////////////////////////////////////////
/*
 * 		VIDEO #36 CODE
*/
/////////////////////////////////////////////	
	
	/**
	 * newAccount determines:
	 * 	<ul>
	 * 		<li>if form data is in a valid format</li> 
	 * 		<li>then if the email is already in the database
	 * 			<ul><li>If already in database show hyperlink in "error" message
	 * 					that goes to login page.</li></ul></li>	 
	 * 		<li>then if the passwords are equal 	
	 * 			<ul>
	 * 				<li>if passwords are equal add user to database</li>
	 * 				<li>if passwords are not equal send error message</li>
	 * 			</ul>
	 * 		</li>
	 * 	</ul> 
	 */
	private String newAccount(HttpServletRequest request){
		
		// URL String
		String whereToGo;
		
		// Get parameters associated with form
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String rPassword = request.getParameter("rPassword");
		
		
		// Validate data on form is in proper format
		if(validateFormData(request, email, password)){
			
			// Form data in valid format, is user already in database?
			if(userInDatabase(email)){
				// User Already in database
				request.setAttribute("email", email);
				request.setAttribute("password", "");		
				request.setAttribute("rPassword", "");
				
				String message = "Email already registered. Try logging in. Forgot password? Request new password via email: " +
						"<a href='/JSP_Tutorial_Six/Video_35_Controller?director=login'>Log in page (but pretend its an email request hyperlink)</a>";
				request.setAttribute("errorMessage", message);
				
				// send user to login page
				whereToGo = "/Video_35_login.jsp";
			}else{
								
				// Check if user's retyped passwords match
				if(password.equals(rPassword)){
					
					// Add user to database
					if(createNewAccount(email, password)){
						
						// User added to database, create a UserBean and attach to session object
						HttpSession session = request.getSession();
						
						session.setAttribute("user", new vid_35.Video_35_UserBean(email, password));
						
						// Send user to account success page
						whereToGo = "/Video_36_accountCreated.jsp";	
					}else{
						
						// Send user to error page
						whereToGo = "/Video_35_errorPage.jsp";
					}

					
				}else{					
					// User's passwords do not match
					request.setAttribute("email", email);
					request.setAttribute("password", password);		
					request.setAttribute("rPassword", rPassword);
					request.setAttribute("errorMessage", "Passwords do not match.");
					
					// Send user back to form
					whereToGo = "/Video_36_NewAccount.jsp";					
				}
			}
			
		}else{
			// invalid data form
			
			// Add rPassword to request object
			request.setAttribute("rPassword", "");
			
			// Return user to new account form
			whereToGo = "/Video_36_NewAccount.jsp";
		}
		
		return whereToGo;
	}
	
	/**
	 * userInDatabase determines if an email already exists in the database.
	 * 
	 * In the tutorial this is the method John named "exists" and is in the "Account"
	 * class in the video.
	 * 
	 * @param email is the email string to check the database
	 * @return <code>true</code> if email is in database, else <code>false</code>.
	 */
	private boolean userInDatabase(String email){
		
		// Protect against SQL injection attacks by using ?s
		String sqlString = "SELECT COUNT(*) AS count FROM users WHERE email=?";
		
		int count = 0;
		
		// make database connection
		openDatabaseConnection();
		
		try {
			PreparedStatement statement = connection.prepareStatement(sqlString); // import java.sql.PreparedStatement
			
			// Set question marks 
			statement.setString(1, email);
			
			// Get result set			
			ResultSet resultSet = statement.executeQuery();			
			
			// Result set's pointer is positioned before the first result
			if(resultSet.next()){
				count = resultSet.getInt("count");
			}
			
			// Close your result set!
			resultSet.close();
			
		} catch (SQLException e) {
			// "Do something sensible here," says John :) --> forward to error.jsp page or something.
			e.printStackTrace();
		}finally{
			
			// close database connection
			closeDatabaseConnection();
		}
		
		// If count equals zero, there's no record of that email in the database.
		if(count == 0){
			return false;
		}else{
			return true;
		}	
	}
	
	/**
	 * createnewAccount adds a user's email and password to the database.
	 * 
	 * 
	 * @param email is the email string.
	 * @param password is the password string.
	 * @return <code>true</code> if account successfully added, else return <code>false</code>.
	 */
	private boolean createNewAccount(String email, String password){
		
		// Protect against SQL injection attacks by using ?s
		String sqlString = "INSERT INTO users (email, password) values(?, ?)";		
		
		// make database connection
		openDatabaseConnection();
		
		int result = 0;
		
		try {
			PreparedStatement statement = connection.prepareStatement(sqlString); // import java.sql.PreparedStatement
			
			// Set question marks 
			statement.setString(1, email);
			statement.setString(2, password);
			
			// Perform UPDATE			
			result = statement.executeUpdate();
			
			// close statement
			statement.close();
			
		} catch (SQLException e) {
			// "Do something sensible here," says John :) --> forward to error.jsp page or something.
			e.printStackTrace();
		}finally{
			
			// close database connection
			closeDatabaseConnection();
			
			// close statement
			
		}
		
		// If record added to database return from executeUpdate should be 1 row affected.		
		return result == 0? false : true;
	}
}
