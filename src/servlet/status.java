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
 * Servlet implementation class status
 */
@WebServlet("/status")
public class status extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public status() {
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
	//System.out.println("zxsds");
	
	Service service = new Service();
	Annotation[] annotationActive;
	Annotation[] annotationDeactive;
	int bid = Integer.parseInt(request.getParameter("bid"));
	
	annotationActive = service.statusActive(bid);  // add bid here
	request.setAttribute("annotationActive", annotationActive);

	annotationDeactive = service.statusDeactive(bid);  // add bid here
	//System.out.println("length of annotationdeactive"+annotationDeactive.length);
	request.setAttribute("annotationDeactive", annotationDeactive);

	
	String nextPage = "/DoctorDiseaseInfo.jsp";
	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
	dispatcher.forward(request, response);
	
	
	}

}
