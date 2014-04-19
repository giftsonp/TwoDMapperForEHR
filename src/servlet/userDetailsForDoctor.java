package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.Service;

import com.google.gson.Gson;

import bean.Registration;


/**
 * Servlet implementation class userDetailsForDoctor
 */
@WebServlet("/userDetailsForDoctor")
public class userDetailsForDoctor extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userDetailsForDoctor() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("i am inside servlet --------------------1 ");
		Service service = new Service();
		Registration[] registration;
		System.out.println("servlet - going to call proxy ");

		registration = service.getAllUserDetails();		
		System.out.println("servlet - after calling proxy ");
		
		/*Gson gson = new Gson();
		String content = gson.toJson(registration);
		System.out.println("Content"+content);
		response.setContentType("text/json");
		response.getWriter().print(content);*/
		HttpSession session = request.getSession();

		session.setAttribute("registration", registration);
		
		String next = "/DoctorLandingPage.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(next);
		dispatcher.forward(request, response);
	
	}

}
