package controllers;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import myObjects.Video_27_POJO;

/**
 * Servlet implementation class Video_27_Controller
 */
@WebServlet("/Video_27_Controller")
public class Video_27_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_27_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get session object.
		HttpSession session = request.getSession();
		
		// Attempt to get POJO stored inside session object.
		Video_27_POJO pojo = (Video_27_POJO)session.getAttribute("pojo");
		
		// If POJO object isn't in session object, put it in there
		if(pojo == null){
			pojo = new Video_27_POJO();
			session.setAttribute("pojo", pojo);
		}
		
		String director = request.getParameter("director");
		if(director == null){ 
			director = "Video_27_displayPojo.jsp";
		}else{
			// Re-assign director to URL
			if(director.equals("vid27")){
				director = "Video_27_displayPojo.jsp";
			}else if(director.equals("vid28")){
				director = "Video_28_displayPojo.jsp";
			}
			
		}
		
		
			/*
			 * A bit of Video 32 has to go up here.
			 * If you're on a video prior to that, ignore this small bit about cookies.
			 * You'll get here soon enough :)
			 */
				// create cookie
				Cookie cookie = new Cookie("key", "fabulous cookie value");
				
				// Increase shelf life of cookie (seconds)
				cookie.setMaxAge(300);
				
				// add cookie to response HTTP header
				response.addCookie(cookie);

		
		// Video 27 - 32 results generally shown in Video_27_displayPojo.jsp
		request.getRequestDispatcher(director).forward(request, response);		

		
		// VIDEO 29 Stuff:
		
		// Get ServletContext object
		ServletContext context = getServletContext();
		
		// Get attribute from context object
		Integer hitCounterForSomeURL = (Integer)context.getAttribute("hitCounterForSomeURL");
		
		if(hitCounterForSomeURL == null){
			hitCounterForSomeURL = 0;
		}else{
			hitCounterForSomeURL++;
		}
		
		// Set an attribute on the SevletContext object
		context.setAttribute("hitCounterForSomeURL", hitCounterForSomeURL);
		

		
		// VIDEO 30 Stuff:
		
			// located in Video_27_displayPojo.jsp
		
			// Tried this but cannot do it after the servlet has been initialized:
			// context.setInitParameter("adminname", "test value");
		
		
		
		// VIDEO 32 Stuff:
		
			// See Video_27_displayPojo.jsp
		
			/* 	The following is for testing */
		
			// Get all the cookies sent to the server in the browsers HTTP request header
			Cookie[] cookies = request.getCookies();
		
			if(cookies == null){	
				System.out.println("No cookies");
			}else{				
				
				// Loop through cookies and display in console
				for(int i = 0; i < cookies.length; i++){
					String name = cookies[i].getName();
					String value = cookies[i].getValue();						
				
					System.out.println("Cookie " +i +": name=" +name +", value=" +value);
				}	
			}		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
