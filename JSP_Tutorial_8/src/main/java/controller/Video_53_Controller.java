package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Video_53_Controller
 */
@WebServlet("/Video_53_Controller")
public class Video_53_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//Map for URL key "director" 
	Map<String, String> directorMap = new HashMap<>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_53_Controller() {
        super();
		// put some values in it for now
		directorMap.put("vid_52_home", "/Video_52_home.jsp");
		directorMap.put("vid_53_home", "/Video_53_home.jsp");
		directorMap.put("vid_56", "/Video_56_displayImage.jsp");
		directorMap.put("rankImage", "/Video_56_displayImage.jsp");
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String whereToGo = request.getParameter("director");
		
		// Check for null or if "director" value not in directorMap
		if(whereToGo == null || !directorMap.containsKey(whereToGo)){
			
			whereToGo = "/Video_52_home.jsp";
		
		}else{
		
			whereToGo = directorMap.get(whereToGo);
		}
		
		request.getRequestDispatcher(whereToGo).forward(request, response);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String whereToGo = request.getParameter("director");
		
		// Check for null or if "director" value not in directorMap
		if(whereToGo == null || !directorMap.containsKey(whereToGo)){
			
			whereToGo = "/Video_52_home.jsp";
		
		}else{
		
			whereToGo = directorMap.get(whereToGo);
		}
		
		request.getRequestDispatcher(whereToGo).forward(request, response);	
	}

}
