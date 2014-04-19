package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import bean.Disease;
import bean.DiseasesCount;
import service.Service;


/**
 * Servlet implementation class FetchDiseasesChart
 */
@WebServlet("/RenderDiseasesChart")
public class RenderDiseasesChart extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RenderDiseasesChart() {
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

	/*	proxy.setEndpoint("http://localhost:8080/BodyMap/services/Service");*/
		DiseasesCount[] diseasesCount;
		Service service= new Service();

		diseasesCount = service.getDiseaseCount();	
		request.setAttribute("chart", new Gson().toJson(diseasesCount));
		for(int i=0;i<diseasesCount.length;i++)
			System.out.println(diseasesCount[i].getCount());

		String nextPage = "/DoctorCharts.jsp";
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
		dispatcher.forward(request, response);
	
	}

}
