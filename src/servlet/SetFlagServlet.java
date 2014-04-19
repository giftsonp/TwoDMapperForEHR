package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.Disease;
import bean.Registration;
import bean.patientDetails;
import service.Service;


/**
 * Servlet implementation class SetFlagServlet
 */
@WebServlet("/SetFlagServlet")
public class SetFlagServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	

    /**
     * @see HttpServlet#HttpServlet()
     */
    public SetFlagServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		try

		{

			int id=Integer.parseInt(request.getParameter("Id"));
			System.out.println("ID in setflag"+id);
			Disease[] listOfDiseases;
			Service service = new Service();
			Registration objPatient=service.setFlag(id);
			request.setAttribute("patient", objPatient);

			/*listOfDiseases = service.getAllDiseases();
			request.setAttribute("listOfDiseases", listOfDiseases);*/
			patientDetails patientExtra=service.getPatientExtra(id);
			request.setAttribute("patientExtra", patientExtra);

			RequestDispatcher dis = request.getRequestDispatcher("/DoctorEditMode.jsp");
		  	dis.forward(request, response);

		}
		catch(Exception e)
		{
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
