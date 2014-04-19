package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.*;
import service.Service;
import bean.patientDetails;

/**
 * Servlet implementation class updatePatientDetails
 */
@WebServlet("/retrivePatientDetails")
public class retrivePatientDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public retrivePatientDetails() {
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
		//PrintWriter out=response.getWriter();
		int id=Integer.parseInt(request.getParameter("BID"));
		System.out.println("bid from updatepatiendetails is"+id);
		patientDetails patientExtra=service.getPatientExtra(id);
		request.setAttribute("patientExtra", patientExtra);
		System.out.println("i am going till here---------------------->");
		RequestDispatcher dis = request.getRequestDispatcher("/DoctorEditMode.jsp");
	  	dis.forward(request, response);
		
		/*System.out.println("Resultstatus:  "+patientExtra);
		out.println(patientExtra);*/
	
	}

}
