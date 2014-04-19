<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>

 <% 
	try{      
		 String s[]=null;

	 	Class.forName("com.mysql.jdbc.Driver").newInstance();  
         Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/bodymap", "root",
				"12345"); 
				/* Connection con = null;
				Context ctx = new InitialContext();
				DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
				 con = ds.getConnection();
				con = DriverManager.getConnection(
						"jdbc:mysql://localhost:3306/db_cmpe295b", "giftsonp",
						"Nostfig12"); */
				
		Statement st=con.createStatement(); 
		ResultSet rs = st.executeQuery("select * from icd");
		
	    	List li = new ArrayList();
	    
			while(rs.next()) 
 			{ 			    
				/* adding disease name and code to list */
 			    li.add(rs.getString("DiseaseName")+ ", " +rs.getString("DiseaseCode"));
 		
 			}  
			
			String[] str = new String[li.size()];			
			Iterator it = li.iterator();
			
			int i = 0;
			while(it.hasNext())
			{
				String p = (String)it.next();	
				str[i] = p;
				i++;
			}
		
			//jQuery related start		
				String query = (String)request.getParameter("q");
				
				int cnt=1;
				for(int j=0;j<str.length;j++)
				{
					if(str[j].toUpperCase().startsWith(query.toUpperCase()))
					{
						out.print(str[j]+"\n");
						System.out.println(str[j]);
						if(cnt>=100)
							break;
						cnt++;
					}
				}
			//jQuery related end	
		
			
 		rs.close(); 
 		st.close(); 
		con.close();

		    } 
		catch(Exception e){ 
 			e.printStackTrace(); 
 		}

 %>