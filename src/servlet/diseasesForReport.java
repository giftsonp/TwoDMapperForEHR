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
 * Servlet implementation class diseasesForReport
 */
@WebServlet("/diseasesForReport")
public class diseasesForReport extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public diseasesForReport() {
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
		Annotation[] annotation;
		System.out.println("servlet - going to call proxy ");
	/*	int value=1;*/
		
		int bid = Integer.parseInt(request.getParameter("BID"));
		

		
		System.out.println("BID=="+bid);
		annotation = service.diseasesForReport(bid);	
		
		for(int i=0;i<annotation.length;i++)
		{
			System.out.println("inside annotation array in servlet "+annotation[i].getExtraDiseaseName());
		}
		
		System.out.println("servlet - after calling proxy ");

		request.setAttribute("annotation", annotation);
		
		String next = "/PatientPrintReport.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(next);
		dispatcher.forward(request, response);
		
		
	}

}
