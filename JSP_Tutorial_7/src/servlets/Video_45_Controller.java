package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Video_40_UserBean;

/**
 * Servlet implementation class Video_45_Controller
 */
@WebServlet("/Video_45_Controller")
public class Video_45_Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Video_45_Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// Make 3 UserBean objects
		Video_40_UserBean bean1 = new Video_40_UserBean("1@1.com", "aaA12");
		Video_40_UserBean bean2 = new Video_40_UserBean("2@1.com", "bbB12");
		Video_40_UserBean bean3 = new Video_40_UserBean("3@1.com", "ccC12");
		
		// Get three scoped objects (you already have a request scoped object)
		HttpSession session = request.getSession();
		ServletContext context = getServletContext();
		
		// Assign objects to scoped objects
		request.setAttribute("bean1", bean1);
		session.setAttribute("bean2", bean2);
		context.setAttribute("bean3", bean3);
		
		// Video 47: Add a map
		Map<String, String> map = new HashMap<>();
		map.put("Oregon", "Salem");
		
		request.setAttribute("myMap", map);
		
		// Video 48:
		request.setAttribute("myLink", "<a href='goSomewhere.com'>some link</a>");
		
		// Video 49:
		List<Video_40_UserBean> beanList = new ArrayList<>();
		
		beanList.add(bean1);
		beanList.add(bean2);
		beanList.add(bean3);
		
		String[] cities = {"Portland", "Springfield", "Eugene"};
		
		session.setAttribute("cities", cities);
		session.setAttribute("myList", beanList);
		
		// Forward user to .jsp page
		request.getRequestDispatcher("/Video_45_showObjects.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
