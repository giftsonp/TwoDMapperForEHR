package servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;





import service.Service;
import bean.Annotation;
import bean.Disease;
import bean.Registration;


/*
 * Servlet implementation class AddAnnotationAction
 */

@WebServlet("/AddAnnotationAction")
public class AddAnnotationAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAnnotationAction() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		String qdone;
		try {
			Annotation ann = new Annotation();
			Service service = new Service();
			Annotation[] annotation;
			Disease[] listOfDiseases;
			Annotation[] annotationCount;
			int BID = Integer.parseInt(request.getParameter("BID"));
			ann.setBID(BID);
			ann.setX_Coord(Float.parseFloat(request.getParameter("x_Offset")));
			ann.setY_Coord(Float.parseFloat(request.getParameter("y_Offset")));
			ann.setDateOfDiag(request.getParameter("dateofdiag"));
			//ann.setDoctorId(Integer.parseInt(request.getParameter("doctorId")));
			ann.setDiseaseCode(request.getParameter("diseaseCode"));
			ann.setDiseaseDesc(request.getParameter("diseaseDesc"));
			ann.setLevel(request.getParameter("level"));
			ann.setDisplay(request.getParameter("display"));
			ann.setStatus(request.getParameter("status"));
			System.out.println("Printing Side:----"+ann.getDisplay());
			qdone = service.addAnnotation(ann);
			annotationCount = service.getNotifications(BID);	
			
			Registration reg = service.getPatientDetails(BID);
			annotation = service.diseasesForReport(BID);				
			/*listOfDiseases = service.getAllDiseases();*/
	
			

			HttpSession session = request.getSession();
			if (qdone.equalsIgnoreCase("true")) {
				session.setAttribute("userSession", session);
				request.setAttribute("message",
						"Annotation added successfully...");
				request.setAttribute("patient",reg);
				request.setAttribute("annotation",annotation);
				request.setAttribute("annotationCount", annotationCount);
				/*request.setAttribute("listOfDiseases", listOfDiseases);*/
				
				// Enter path of page to be forwarded to
				String nextPage = "/DoctorEditMode.jsp";
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);

			} else {
				request.setAttribute("message", "Unable to add new Annotation!" + qdone);

				// Enter path of page to be forwarded to
				String nextPage = "";
				RequestDispatcher dispatcher = getServletContext()
						.getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}