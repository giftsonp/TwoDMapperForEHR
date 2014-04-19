package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;
import bean.patientDetails;

/**
 * Servlet implementation class updatePatientDetails
 */
@WebServlet("/updatePatientDetails")
public class updatePatientDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public updatePatientDetails() {
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
		PrintWriter out=response.getWriter();
		System.out.println("before bid");
		int id=Integer.parseInt(request.getParameter("BID"));
		System.out.println("after bid"+id);
		
		patientDetails patient= new patientDetails();
		patient.setBID(id);
		
		System.out.println("bp"+Double.parseDouble(request.getParameter("bp")));
		System.out.println("bp"+Double.parseDouble(request.getParameter("temp")));
		System.out.println("bp"+Double.parseDouble(request.getParameter("heig")));
		System.out.println("bp"+Double.parseDouble(request.getParameter("weig")));
		
		patient.setBloodPressure(Double.parseDouble(request.getParameter("bp")));
		System.out.println("bp"+Double.parseDouble(request.getParameter("bp")));
		patient.setTemperature(Double.parseDouble(request.getParameter("temp")));
		patient.setHeight(Double.parseDouble(request.getParameter("heig")));
		patient.setWeight(Double.parseDouble(request.getParameter("weig")));
	    patient.setDateOfDiag(request.getParameter("dateofdiag"));
		String result=service.updatePatient(patient);
		if(result.equalsIgnoreCase("Success"))
		{
	/*RequestDispatcher dis = request.getRequestDispatcher("/DoctorEditMode.jsp");
	dis.forward(request, response);*/
			System.out.println("Resultstatus:  "+result);
			out.println(result);
		}
		else 
		{
			// write some error code here if its not able to update it
		}
		}

}
