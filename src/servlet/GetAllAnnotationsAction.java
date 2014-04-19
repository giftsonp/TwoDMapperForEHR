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
import bean.Disease;
import bean.Registration;
import bean.patientDetails;


/**
 * Servlet implementation class GetAllAnnotations
 */
@WebServlet("/GetAllAnnotationsAction")
public class GetAllAnnotationsAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetAllAnnotationsAction() {
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

		Service service = new Service();
		
		Annotation[] annotation;
		Annotation[] annotationCount;
		Registration reg = new Registration();
		
		System.out.println("Servlet");
		
		int bid = Integer.parseInt(request.getParameter("bid"));
		String page=request.getParameter("page");
		Disease[] listOfDiseases;
		
		
		annotationCount = service.getNotifications(bid);	
		
		/* for(int i=0;i<annotationCount.length;i++)
		{
			System.out.println("inside annotation array in servlet "+annotationCount[i].getSkinCount());
			System.out.println("inside annotation array in servlet "+annotationCount[i].getOrganCount());
			System.out.println("inside annotation array in servlet "+annotationCount[i].getSkeletonCount());
		} */
		
		System.out.println("servlet - after calling proxy ");


			
		System.out.println("inservlet"+bid+page);
		
			/*to display diseases on the body map for both pages doc view and doc edit*/
			annotation = service.diseasesForReport(bid);
			
			/*to display side profile panel*/
			reg=service.getPatientDetails(bid);
			
			/*to be able to annotate after searching for a person, else in modal diseases will not populate*/
			/*listOfDiseases = service.getAllDiseases();*/
			
			String error="Incorrect BID. No such patient Exists in our records";
			
			if(reg==null)
			{
				request.setAttribute("error", error);
			}

			
			System.out.println("inservlet Return");
			request.setAttribute("annotationCount", annotationCount);
			request.setAttribute("annotation", annotation);
			request.setAttribute("reg", reg);
	
			
			patientDetails patientExtra=service.getPatientExtra(bid);
			request.setAttribute("patientExtra", patientExtra);
				
			if(page.equals("view"))
				
			{
				String nextPage = "/DoctorViewMode.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
				
				
			}
			else if(page.equals("edit"))
			{
			
				String nextPage = "/DoctorEditMode.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
				
			}
			else if(page.equals("DPR"))
			{
			
				String nextPage = "/DoctorPrintReport.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
				
			}
			else if(page.equals("Report"))
			{
			
				String nextPage = "/Report.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
				
			}
			
	/*		}*/
			
		
	}
}
