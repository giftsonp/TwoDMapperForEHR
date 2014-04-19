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
import bean.Registration;


/**
 * Servlet implementation class RegisterUser
 */
@WebServlet("/RegisterUser")
public class RegisterUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterUser() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Service service = new Service();
		String qdone;
		// TODO Auto-generated method stub
		try{
				Registration reg = new Registration();
				BufferedReader br = new BufferedReader(new InputStreamReader(request.getInputStream()));
				String json = "";
				if(br != null){
					json = br.readLine();
				}
				String result = URLDecoder.decode(json, "UTF-8");  
				
        System.out.println("inservlet");
				JSONObject jsonObject = new JSONObject(result);
				String fname = jsonObject.getString("fname"); 
				String lname = jsonObject.getString("lname");
				int age =  jsonObject.getInt("age");        
				String gender =  jsonObject.getString("gender");
				String pwd =  jsonObject.getString("pwd");
				String email = jsonObject.getString("email");
				String role = jsonObject.getString("role");
				
				System.out.println("Printing Gender:"+jsonObject.getString("gender"));
				System.out.println("Printing Role:"+jsonObject.getString("role"));
				
			/*	System.out.println("Printing a1:"+jsonObject.getString("a1"));
				System.out.println("Printing a2: "+jsonObject.getString("a2"));
				System.out.println("Printing c:"+jsonObject.getString("c"));
				System.out.println("Printing s:"+jsonObject.getString("s"));
				System.out.println("Printing zip:"+jsonObject.getString("zip"));*/
				
				reg.setFirstName(fname);
				reg.setLastName(lname);
				reg.setAge(age);
				reg.setGender(gender);
				reg.setEmail(email);
				reg.setPassword(pwd);
				reg.setRole(role);				
				
				
				qdone = service.createUser(reg);
			
				HttpSession session = request.getSession();
				if (qdone.equalsIgnoreCase("true")) {
					session.setAttribute("userSession", session);
					request.setAttribute("message",
							"SignUp Successful, Please Login.");
					
					String successMsg="SignUp Successful, Please Login.";
					System.out.println(successMsg);
					response.getWriter().print(successMsg);
					
					
					
					// Enter path of page to be forwarded to
					/*String nextPage = "";
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher(nextPage);
					dispatcher.forward(request, response);*/

				} else if(qdone.equalsIgnoreCase("The email ID is already registered. Please try another email ID"))
				{
					String errorMsg="The email ID is already registered. Please try another email ID";
					System.out.println(errorMsg);
					response.getWriter().print(errorMsg);
					
					// Enter path of page to be forwarded to
				/*	String nextPage = "";
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher(nextPage);
					dispatcher.forward(request, response);*/
				}
				
				else {
					String errorMsg="Unable to Register! Please Verify and try again!";
					System.out.println(errorMsg);
					response.getWriter().print(errorMsg);
					
					// Enter path of page to be forwarded to
				/*	String nextPage = "";
					RequestDispatcher dispatcher = getServletContext()
							.getRequestDispatcher(nextPage);
					dispatcher.forward(request, response);*/
				}
 		
       

				
        
		}
		catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
    