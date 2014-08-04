package myClasses;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Video_9_MyAwesomeServlet
 */
@WebServlet("/Video_9_MyAwesomeServlet")
public class Video_9_MyAwesomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_9_MyAwesomeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Get a parameter sent in URL
		String key1 = request.getParameter("key1");
		String key2 = request.getParameter("key2");
		
		// Get a way to send output
		PrintWriter out = response.getWriter();
		
		// The output.
		out.println("<html>");
		out.println("<h1>Greetings from the doGET method!!</h1>");
		out.println("<p>URL parameter value of the key \"key1\": " + key1 +"</p>");
		out.println("<p>URL parameter value of the key \"key2\": " + key2 +"</p>");
		
		// Why not use the parameters to instantiate your own custom object? Go for it!
		RossClass myCustomObject = new RossClass(key1);
		
		// Output something from that custom object:
		out.println("<p>Use a method in RossClass: " + myCustomObject.foo() + "</p>");
		
		// More interesting: what will be the result when no key1 key is present in the URL and we have asked
		// for a RossClass object to be built using that data? That is, what happens when NULL is passed to the 
		// constructor of RossClass? Lets find out.
		out.println("<p>Data inside the RossClass object: " + myCustomObject.getStringData() + "</p>");
		
		out.println("</html>");
	}

}
