package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;
import bean.Registration;

/**
 * Servlet implementation class EmailPatient
 */
@WebServlet("/EmailPatient")
public class EmailPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmailPatient() {
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
		String subject = request.getParameter("sub");
		String content = request.getParameter("content");
		String gender = request.getParameter("gender");
		int age = Integer.parseInt(request.getParameter("age"));
		int bid =Integer.parseInt(request.getParameter("bid"));
		String docEmailID = "doc@gmail.com";
		System.out.println("Printing Sub n content in Servlet"+subject+content);
		
		System.out.println("Printing in Email Serv"+fname+lname+email+bid);
		reg.setFirstName(fname);
		reg.setLastName(lname);
		reg.setBID(bid);
		reg.setEmail(email);
		reg.setAge(age);
		reg.setGender(gender);
		
		
		String resultStatus=service.emailPatient(reg, subject, content, docEmailID);
		System.out.println("Resultstatus:  "+resultStatus);
		out.println(resultStatus);
		
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
	}

}
