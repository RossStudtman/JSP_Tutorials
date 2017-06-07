package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Video_21_Controller
 */
@WebServlet("/Video_21_Controller")
public class Video_21_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_21_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Simple response back
			// Get something to write HTML out
			PrintWriter out = response.getWriter();
			
			// Get URL parameter --> KEY matches name given in Video_21_formOne.jsp's text field
			String parameterValue = request.getParameter("lookAtMeInURL");
			
			// Write HTML response
			out.write("<html>");
			out.write("<h1>Response from Video_21_Controller.java's doGet():</h1>");
			out.write("You wrote: " +parameterValue);			
			out.write("</html>");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Simple response back
		
		// Get something to write HTML out
		PrintWriter out = response.getWriter();
		
		// Get URL parameter --> KEY matches name given in Video_21_formOne.jsp's text field
		String parameterValue = request.getParameter("lookAtMeInURL");
		
		// Write HTML response
		out.write("<html>");
		out.write("<h1>Response from Video_21_Controller.java's doPost():</h1>");
		out.write("You wrote: " +parameterValue);			
		out.write("</html>");
		
		// This next bit was added for Video #25 (not part of video but added anyway).
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		if(email != null & password != null){
			out.write("<html>");
			out.write("<h1>Greetings from Video # 25!</h1>");
			out.write("<h2>Bean was successfully validated!</h2>");
			out.write("<h3>Bean properties are:</h3>");
			out.write("<p>Email: " +email +"</p>");
			out.write("<p>Password: " +password +"</p>");
			out.write("<br/><p>PS: the &quotnull&quot response above is because we did not supply a" +
			"&quotlookAtMeInURL&quot parameter that was used in Video #'s 21 and 22. See Video_21_formOne.jsp for that.</p>");
			out.write("</html>");
		}
	}

}
