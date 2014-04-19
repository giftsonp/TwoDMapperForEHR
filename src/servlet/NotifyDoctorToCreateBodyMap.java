package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;






import org.json.JSONObject;

import service.Service;
import bean.Registration;

/**
 * Servlet implementation class NotifyDoctorToCreateBodyMap
 */
@WebServlet("/NotifyDoctorToCreateBodyMap")
public class NotifyDoctorToCreateBodyMap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NotifyDoctorToCreateBodyMap() {
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
		
		
		try
		{
			
	
		Registration reg = new Registration();
		Service service = new Service();
		PrintWriter out=response.getWriter();
		String fname = request.getParameter("firstName"); 
		String lname = request.getParameter("lastName");		
		String email = request.getParameter("email");
		int bid =Integer.parseInt(request.getParameter("bid")) ;
		
		System.out.println("Printing in Notify Serv"+fname+lname+email+bid);
		reg.setFirstName(fname);
		reg.setLastName(lname);
		reg.setBID(bid);
		reg.setEmail(email);
		
		
		String resultStatus=service.notifyDoctor(reg);
		System.out.println("Resultstatus:  "+resultStatus);
		out.println(resultStatus);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
	}

}
