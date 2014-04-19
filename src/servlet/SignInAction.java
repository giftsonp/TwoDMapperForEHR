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
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import service.Service;

import com.google.gson.Gson;

import bean.Registration;



/**
 * Servlet implementation class SignInAction
 */
@WebServlet("/SignInAction")
public class SignInAction extends HttpServlet {
	private static final long serialVersionUID = 1L;


	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SignInAction() {
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
	/*	response.setContentType("text/html");*/
		try {
			Service service= new Service();

			System.out.println("in servlet");
			
			BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
			String json = "";
			if(br != null){
				json = br.readLine();
			}
			System.out.println(json);
			String result = URLDecoder.decode(json, "UTF-8");
			JSONObject jsonObject = new JSONObject(result);
			String email = jsonObject.getString("email"); 
			String pwd = jsonObject.getString("pwd");
			
			System.out.println(email+pwd);
			/*proxy.setEndpoint("http://localhost:8080/BodyMap/services/Service");*/
			Registration objUser = service.signIn(email, pwd);
			/*int count= service.patientCount();	
			System.out.println("Printing Count in Servlet"+count);*/
			System.out.println("after");
			HttpSession session = request.getSession();
		
		/*	String UA=request.getHeader("User-Agent");
	*/
			System.out.println(objUser);
			
			if (null!=objUser) {
				session.setAttribute("user",objUser);
			/*	session.setAttribute("UA", UA);*/
				
				/*String nextPage = "/DoctorLandingPage.jsp";
				RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextPage);
				dispatcher.forward(request, response);*/
				
				
				Gson gson = new Gson(); // GSON - java json library from Google. 
				String content = gson.toJson(objUser);
				
				System.out.println("Content"+content);
				response.setContentType("text/json");
				response.getWriter().print(content);

				
			}
			else 
			{
						
				String error="Invalid Username and password!";			
				Gson gson = new Gson(); // GSON - java json library from Google. 
				String content = gson.toJson(error);
				System.out.println("Content"+content);
				response.setContentType("text/json");
				response.getWriter().print(content);
				System.out.println("invalid!!");		
			}
			
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
