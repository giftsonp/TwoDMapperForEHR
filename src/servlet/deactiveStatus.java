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
 * Servlet implementation class deactiveStatus
 */
@WebServlet("/deactiveStatus")
public class deactiveStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deactiveStatus() {
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
	//System.out.println("hiiiiiiiiiiiiiii");
	//System.out.println("negth of active id"+request.getParameter("leng"));
	int[] annotationArray=new int[Integer.parseInt(request.getParameter("leng"))];
	int length=Integer.parseInt(request.getParameter("leng"));
	int counter=0;
	
	Service service = new Service();
	for(int i=0;i<length;i++)
	{
		Annotation ann=new Annotation();
		ann.setStatus(request.getParameter("sta["+i+"]"));
		System.out.println("Status is --------------"+ann.getStatus()+"no of iter"+i);
		
		//ann.setAnnotationID(Integer.parseInt(request.getParameter("aid["+i+"]")));
		//System.out.println("sadsaaaaaaaaaaaaaa --------------"+ann.getAnnotationID());
		
		if(request.getParameter("sta["+i+"]").equalsIgnoreCase("inactive"))
		{
			annotationArray[counter]=Integer.parseInt(request.getParameter("aid["+i+"]"));
			counter++;
			//System.out.println("from the comparison"+annotationArray[counter]);
		}
	
	}
	for(int i=0;i<annotationArray.length;i++)
	{
		System.out.println("the id that are going to be deactivated are"+annotationArray[i]);
	}
		
	String result=service.deactiveStatus(annotationArray);
		if(!response.isCommitted()){
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/status");
			dispatcher.forward(request, response);
		}
	
	}

}
