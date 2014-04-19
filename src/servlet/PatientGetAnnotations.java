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
import bean.Registration;


/**
 * Servlet implementation class PatientGetAnnotations
 */
@WebServlet("/PatientGetAnnotations")
public class PatientGetAnnotations extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public PatientGetAnnotations() {
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
		
		try{
			Service service = new Service();
			
			Annotation[] annotation;
			Annotation[] annotationCount;
			
			System.out.println("Servlet");
			
			int bid = Integer.parseInt(request.getParameter("bid"));
			annotationCount = service.getNotifications(bid);	
			
			System.out.println("inservlet"+bid);
			
		
				annotation = service.diseasesForReport(bid);
			
				
				System.out.println("inservlet Return");
				request.setAttribute("annotationCount", annotationCount);
				request.setAttribute("annotation", annotation);
				String nextPage = "/PatientLandingPage.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
					
			
			
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
			
		}
		
			
		
	}
}
