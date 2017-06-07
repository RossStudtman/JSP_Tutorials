package demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
import javax.sql.DataSource;

/**
 * 
 * Servlet implementation class Video_34_DataSource
 */
@WebServlet("/Video_34_DataSource")
public class Video_34_DataSource extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	/**
	 * The datasource object found by looking up "jdbc/webshop" on a context object.
	 */
	private DataSource dataSource; 			// import javax.sql.DataSource
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_34_DataSource() {
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

		// Define outside of try-catch to enlarge scope of Connection object
		Connection connection = null;
		
		// Make a connection
		try {
			connection = dataSource.getConnection();		// add import java.sql.connection
		} catch (SQLException e) {
			// maybe forward to a .jsp error page?
			e.printStackTrace();
		}		
		
		// Use your connection to do stuff:
		PrintWriter out = response.getWriter();
		out.println("<h1>Dude! You SO connected to the database. Like, so! HARD!</h1>");
		
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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
