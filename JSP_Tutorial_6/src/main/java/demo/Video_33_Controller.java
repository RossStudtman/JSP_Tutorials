package demo;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Video_33_Controller
 */
@WebServlet("/Video_33_Controller")
public class Video_33_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_33_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// PrintWriter for outputting response
		PrintWriter out = response.getWriter();
		
		// Load the driver. Should be here: JSP_Tutorial_6/ Java Resources / Libraries / mysqlconnector-java-5.1.30-bin.jar / com.mysql.jdbc / Driver.class
		try {
			Class.forName("com.mysql.jdbc.Driver");		// which you can visually see the Driver class located in com.mysql.jdbc package, with the .jar noted above.
		} catch (ClassNotFoundException e) {
			
			// Could not find the Driver file
			out.println("Can't load database driver");
			e.printStackTrace();
		}
		
		// Connection object
		Connection conn = null; 		// import the java.sql.Connection; not the com.mysql.jdbc.Connection
		
		// Connect to DB
		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/webshop", "webapp", "hello");
		} catch (SQLException e) {
			
			// Cannot connect to database			
			out.println("Can't connect to database"); 		// this should forward to a .jsp that handles not connecting to DB gracefully.
			e.printStackTrace();
		}
		
		// Connection was made successfully, output something!
		out.println("<h1>Connection to DB Successful!</h1>");
		
		
		// Close connection to DB
		try {
			if(conn !=null){
				conn.close();
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
