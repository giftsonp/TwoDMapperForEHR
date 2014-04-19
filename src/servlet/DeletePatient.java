package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;
import bean.Annotation;


/**
 * Servlet implementation class DeletePatient
 */
@WebServlet("/DeletePatient")
public class DeletePatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePatient() {
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
		Service service = new Service();
		String result;
		int id=Integer.parseInt(request.getParameter("Id"));
		
		System.out.println(id);
		
				result = service.deleteUser(id);	
				System.out.println("servlet - after calling proxy ");

				request.setAttribute("success", result);
				System.out.println("Printing result"+result);
				
		        if(result.equals("Success"))	
		        {
		        	System.out.println("inside if sucess");		          
		    		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/DoctorLandingPage.jsp");
		    		dispatcher.forward(request, response);	
		        }
				
		        		
			}

}
