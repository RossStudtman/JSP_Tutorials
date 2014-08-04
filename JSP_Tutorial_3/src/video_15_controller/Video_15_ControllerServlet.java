package video_15_controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Video_15_ControllerServlet
 */
@WebServlet("/Video_15_ControllerServlet")
public class Video_15_ControllerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_15_ControllerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// String for which page to forward to (assigned after switch)
		String goToThisPage = null;
		
		// Get parameter
		String director = request.getParameter("director");
		
		///////////////////////////////////////////////////////////
		// 		!!	Important Note !! 	
		//
		//		You would probably have the logic for determining
		//		which web page to go to in its own class, not all
		//		gummed up in here. But for the tutorial I keep it
		//		in here.
		///////////////////////////////////////////////////////////		
		
		
		// Check if parameter is null, ie, was not supplied.
		if(director == null){
			director = DirectorEnums.NO_VALUE.name(); 	// Assign String name of an enum.
		}
		
		// Convert parameter to uppercase (Enum.ValueOf() uses uppercase argument)
		director = director.toUpperCase();
		
		// Define outside of try-catch
		DirectorEnums enumDirector;
		
		// Get enum associated with parameter
		try{
			enumDirector = DirectorEnums.valueOf(director);		// Attempts to return Enum constant given a String argument.
		}catch (IllegalArgumentException e){
			enumDirector = DirectorEnums.INCORRECT_VALUE;		// If String not in enum set, assign an enum from the set.
		}
		
		// Switch statement using enum
		switch (enumDirector) {
		case ABOUT:
			goToThisPage = "/Video_15_about.jsp";
			break;
		
		// These cases lumped together because individual pages were not created for each of them.
		case ERROR:
		case INCORRECT_VALUE:
		case NO_VALUE:
			goToThisPage = "/Video_15_error.jsp";
			break;
		case INDEX:
			goToThisPage = "/index.jsp";
			break;
		case LOGIN:
			goToThisPage = "/Video_15_login.jsp";
			break;
		default:
			goToThisPage = null;
			break;
		}
		
		/*
		 * The method of forwarding taught in Video #12:
		 * 
		 * 		request.getRequestDispatcher(goToThisPage).forward(request, response);
		 * 
		 * John wants to show another way this time:
		 */
		getServletContext().getRequestDispatcher(goToThisPage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
