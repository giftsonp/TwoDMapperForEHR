package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Random;

import bean.Annotation;
import bean.Disease;
import bean.DiseasesCount;
import bean.Registration;




import bean.patientDetails;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class DatabaseConnection {
	Connection con = null;
	static ResultSet rs = null;
	Statement stmt = null;

	
	/*Uncomment when deployin in cloudbees*/
	/*public DatabaseConnection() {
		try {
				
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mydb");
			 con = ds.getConnection();
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/db_cmpe295b", "giftsonp",
					"Nostfig12");
			stmt = con.createStatement();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
	
	public DatabaseConnection() {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			con = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/bodymap", "root",
					"12345");
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	
	
	/* Sud start */

	public String createUser(Registration objUser) {
		String result = "";
		int rowcount;
		String bodyMap="No";

		try {
			// Check if a user with the same email already exists.
			
			Random rnd = new Random();
			int bID = 100000 + rnd.nextInt(900000);
			
			PreparedStatement stmt = con
					.prepareStatement("SELECT BID FROM registration WHERE Email=?");
			stmt.setString(1, objUser.getEmail());
			System.out.println(stmt.toString());
			rs = stmt.executeQuery();
			rs.last();
			rowcount = rs.getRow();
			if (rowcount > 0) {
				result = "The email ID is already registered. Please try another email ID";
			} else {
				// If the user does not exist, create a new user.
				String query = "INSERT INTO `registration`(`BID`,`FirstName`,`LastName`,"
						+ "`Age`,`Gender`,`Email`,`Password`,`BodyMap`,`Role`)"
						+ "VALUES('" + bID + "','" + objUser.getFirstName() + "', '"
						+ objUser.getLastName() + "', '"
						+ objUser.getAge() + "', '"
						+ objUser.getGender() + "', '" 
						+ objUser.getEmail() + "', MD5('"
						+ objUser.getPassword() + "'), '"
						+ bodyMap + "', '"
						+ objUser.getRole() + "');";
				
				rowcount = stmt.executeUpdate(query);

				if (rowcount > 0) {
					result = "true";
					String query1="INSERT INTO `extraInfo`(`bid`) VALUES('" + bID + "')";
					int rowcount1 = stmt.executeUpdate(query1);
				} else {
					result = "false: The data could not be inserted into the database";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	public Registration signIn(String emailId, String mdPassword) {
		ResultSet rs;
		Registration objLoggedInUser = new Registration();
		try {
			System.out.println("in DAO"+emailId+mdPassword);
			PreparedStatement stmt = con
					.prepareStatement("SELECT * FROM registration WHERE Email=? and Password=MD5(?)");
			stmt.setString(1, emailId);
			stmt.setString(2, mdPassword);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				String strPass = rs.getString("Password");
				
				System.out.println("insidewhile"+strPass);

		/*		if (strPass.equals(mdPassword)) {*/
					
			/*		System.out.println("equals"+strPass+"=="+mdPassword);*/
				/*	int bID = rs.getInt("BID");
					System.out.println(bID);
					objLoggedInUser.setBID(bID);*/
					
					objLoggedInUser.setFirstName(rs.getString("FirstName"));
					objLoggedInUser.setLastName(rs.getString("LastName"));
					objLoggedInUser.setAge(rs.getInt("Age"));
					objLoggedInUser.setBID(rs.getInt("BID"));
					objLoggedInUser.setBodyMap(rs.getString("BodyMap"));
					objLoggedInUser.setEmail(rs.getString("Email"));
					objLoggedInUser.setGender(rs.getString("Gender"));
					objLoggedInUser.setRole(rs.getString("Role"));
					
					
					
					System.out.println(objLoggedInUser.getLastName());
					return objLoggedInUser;
				/*}
				else
				{*/
					
					
				/*}*/				
			}
			
			objLoggedInUser=null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objLoggedInUser;

	}

	public String addAnnotation(Annotation ann) {

		Random rnd = new Random();
		int annID = rnd.nextInt(900000);

		String result = "";
		int rowcount;

		try {
			// Check if disease has been entered at specific co-ordinate.
			PreparedStatement stmt = con
					.prepareStatement("SELECT AnnotationID FROM annotation WHERE CoordinateX=? AND CoordinateY=? AND BID=?;");
			stmt.setFloat(1, ann.getX_Coord());
			stmt.setFloat(2, ann.getY_Coord());
			stmt.setFloat(3, ann.getBID());
			System.out.println(stmt.toString());
			rs = stmt.executeQuery();
			rs.last();
			rowcount = rs.getRow();
			if (rowcount > 0) {
				result = "A diesase has already been entered in this co-ordinate...";
			} else {
				// If the disease has not been entered
				String query = "INSERT INTO `annotation`(`AnnotationID`, `CoordinateX`,`CoordinateY`,"
						+ "`DateOfDiagnosis`,`DoctorID`,`DiseaseCode`,`DiseaseDescription`,`BID`,`status`,`level`,`display`)"
						+ "VALUES('" + annID +"', '"
						+ ann.getX_Coord() + "', '"
						+ ann.getY_Coord() + "', '"
						+ ann.getDateOfDiag() + "', '"
						+ ann.getDoctorId() + "', '"
						+ ann.getDiseaseCode()	+ "', '"
						+ ann.getDiseaseDesc() + "', '"
						+ ann.getBID()+ "', '"
						+ ann.getStatus()+ "', '"
						+ ann.getLevel() + "', '"
						+ ann.getDisplay()	+ "');";

				rowcount = stmt.executeUpdate(query);

				if (rowcount > 0) {
					result = "true";
				} else {
					result = "false: The data could not be inserted into the database";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}

	/*public String addDisease(Disease disease) {
		String result = "";
		int rowcount;

		try {
			// Check if disease already exists in DB
			PreparedStatement stmt = con
					.prepareStatement("SELECT DiseaseCode FROM disease WHERE DiseaseCode=?");
			stmt.setString(1, disease.getDiseaseCode());
			System.out.println(stmt.toString());
			rs = stmt.executeQuery();
			rs.last();
			rowcount = rs.getRow();
			if (rowcount > 0) {
				result = "A diesase with saem Code already exists...";
			} else {
				// If the disease does not exist
				String query = "INSERT INTO `disease`(`DiseaseID`,`DiseaseDescription`)"
						+ "VALUES('" + disease.getDiseaseCode() + "', '"
						+ disease.getDiseaseName() + "');";
				
				rowcount = stmt.executeUpdate(query);

				if (rowcount > 0) {
					result = "true";
				} else {
					result = "false: The data could not be inserted into the database";
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}*/

	public ArrayList<Disease> getAllDiseases() {
		String result = "";

		ArrayList<Disease> diseases = new ArrayList<Disease>();
		try {
			// Retrieve all diseases from the DB
			PreparedStatement stmt = con.prepareStatement("SELECT * FROM disease;");
			ResultSet rs = stmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Disease d = new Disease();
					d.setDiseaseCode(rs.getString("DiseaseCode"));
					d.setDiseaseName(rs.getString("DiseaseName"));
					diseases.add(d);
				}

				return diseases;
			} else {
				result = "No diseases found in DB";
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

	public ArrayList<Annotation> getAllAnnotations(int bid) {
		String result = "";

		ArrayList<Annotation> annotations = new ArrayList<Annotation>();
		try {
			// Retrieve all annotations for particular user
			PreparedStatement stmt = con
					.prepareStatement("SELECT * FROM annotation WHERE BID=?");
			stmt.setInt(1, bid);

			ResultSet rs = stmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Annotation ann = new Annotation();
					ann.setAnnotationID(rs.getInt("AnnotationID"));
					ann.setX_Coord(rs.getFloat("CoordinateX"));
					ann.setY_Coord(rs.getFloat("CoordinateY"));
					ann.setDateOfDiag(rs.getString("DateOfDiagnosis"));
					ann.setDoctorId(rs.getInt("DoctorID"));
					ann.setDiseaseCode(rs.getString("DiseaseCode"));
					ann.setDiseaseDesc(rs.getString("DiseaseDescription"));
					ann.setBID(rs.getInt("BID"));

					annotations.add(ann);
				}

				return annotations;
			} else {
				result = "No diseases found in DB";
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}
	
	// Sud end
	
	
	/*
	 * Giftson 
	 * setFlag() 
	 * To set the flag(BodyMap) to Yes after clicking "Create Body Map" button in DoctorLandingPage.jsp
	 * */
	public Registration setFlag(int bID) {
		ResultSet rs1;
		Registration objPatient = new Registration();
		try {
			
			PreparedStatement stmt = con.prepareStatement("Update registration SET BodyMap=? WHERE BID=?");
			stmt.setString(1, "Yes");
			stmt.setInt(2, bID);
			
			stmt.executeUpdate();
			

				/*String strPass = rs.getString("Password");*/
				PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM registration WHERE BID=?");
				stmt1.setInt(1, bID);
				rs1 = stmt1.executeQuery();
				while (rs1.next()) {
					
					objPatient.setBID(rs1.getInt("BID"));
					objPatient.setFirstName(rs1.getString("firstName"));
					objPatient.setLastName(rs1.getString("lastName"));
					objPatient.setAge(rs1.getInt("Age"));
					objPatient.setGender(rs1.getString("gender"));
					objPatient.setEmail(rs1.getString("email"));				
				
			

			
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objPatient;

	}
	
/*
 * Dinesh 
 * 
 * */	
	
	public ArrayList<Registration> getAllUserDetails() {
		String result = "";

		ArrayList<Registration> registration = new ArrayList<Registration>();
		try {
			System.out.println("inside dao ----------1");
			PreparedStatement stmt = con
					.prepareStatement("SELECT * FROM registration WHERE BodyMap=? and role=?");
					stmt.setString(1,"no");
					stmt.setString(2,"patient");
			System.out.println("inside dao 2 - after executing prepared stmt");

			ResultSet rs = stmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					Registration reg = new Registration();
					reg.setFirstName(rs.getString("FirstName"));
					System.out.println(rs.getString("FirstName"));
					reg.setLastName(rs.getString("LastName"));
					System.out.println(rs.getString("LastName"));
					reg.setAge(rs.getInt("Age"));
					System.out.println(rs.getInt("Age"));
					reg.setBID(rs.getInt("BID"));
					System.out.println(rs.getInt("BID"));
					reg.setBodyMap(rs.getString("BodyMap"));
					System.out.println(rs.getString("BodyMap"));
					reg.setEmail(rs.getString("Email"));
					System.out.println(rs.getString("Email"));
					reg.setGender(rs.getString("Gender"));
					System.out.println(rs.getString("Gender"));
					reg.setPassword(rs.getString("Password"));
					System.out.println(rs.getString("Password"));
					reg.setRole(rs.getString("Role"));
					System.out.println(rs.getString("Role"));
					registration.add(reg);
				}

				return registration;
			} else {
				result = "No user details found in DB";
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}

/*
*
*Dinesh 
*DiseasesForReport
*
*
*/
	
	public ArrayList<Annotation> diseasesForReport(int BID) {
		String result = "";

		ArrayList<Annotation> annList = new ArrayList<Annotation>();
		try {
			System.out.println("inside dao ----------1");
			PreparedStatement stmt = con
					.prepareStatement("SELECT annotation.AnnotationID, annotation.CoordinateX, annotation.Coordinatey, annotation.DiseaseDescription, annotation.DiseaseCode, annotation.DateOfDiagnosis, annotation.BID, annotation.level,annotation.display, icd.DiseaseName FROM annotation INNER JOIN icd on (annotation.DiseaseCode=icd.DiseaseCode) where annotation.BID=? && status=?");
			System.out.println("inside dao 2 - after executing prepared stmt");
			stmt.setInt(1, BID);
			stmt.setString(2, "active");

			ResultSet rs = stmt.executeQuery();
			
					
			/*PreparedStatement stmt1 = con
					.prepareStatement("SELECT DiseaseName FROM disease WHERE DiseaseCode=?");
			stmt1.setString(1,"");
			System.out.println("inside dao 2 - after executing prepared stmt");
			ResultSet rs1 = stmt1.executeQuery();*/
			
			
			
			if (rs != null) {
				while (rs.next()) {
					Annotation ann = new Annotation();
					
					ann.setDiseaseCode(rs.getString("DiseaseCode"));
					System.out.println(rs.getString("DiseaseCode"));
					
					ann.setDiseaseDesc(rs.getString("DiseaseDescription"));
					System.out.println(rs.getString("DiseaseDescription"));
					
					ann.setDateOfDiag(rs.getString("DateOfDiagnosis"));
					System.out.println(rs.getString("DateOfDiagnosis"));
					
					ann.setBID(rs.getInt("BID"));
					System.out.println(rs.getInt("BID"));
					
					ann.setExtraDiseaseName(rs.getString("DiseaseName"));	
					System.out.println("dis name"+rs.getString("DiseaseName"));
					
					
					ann.setAnnotationID(rs.getInt("AnnotationID"));
					ann.setX_Coord(rs.getFloat("CoordinateX"));
					ann.setY_Coord(rs.getFloat("CoordinateY"));
					
					ann.setLevel(rs.getString("level"));
					ann.setDisplay(rs.getString("display"));	
					
					annList.add(ann);
				}

				return annList;
			} else {
				result = "No user details found in DB";
				System.out.println(result);
				return annList;

			}
		} catch (SQLException e) {
			e.printStackTrace();
			return annList;
		}
	
	}
	

	
	/*Giftson
	 * 
	 * Gettin Patient details
	 * 
	 * 
	 * */
	
	public Registration getPatientDetails(int bid) {
		ResultSet rs;
		Registration objPatient = new Registration();
		try {
			System.out.println("in DAO"+bid);
			PreparedStatement stmt = con
					.prepareStatement("SELECT * FROM registration WHERE BID=?");
			stmt.setInt(1, bid);
			rs = stmt.executeQuery();
			
			while (rs.next()) {
				
				objPatient.setFirstName(rs.getString("FirstName"));
				objPatient.setLastName(rs.getString("LastName"));
				objPatient.setAge(rs.getInt("Age"));
				objPatient.setBID(rs.getInt("BID"));
				objPatient.setBodyMap(rs.getString("BodyMap"));
				objPatient.setEmail(rs.getString("Email"));
				objPatient.setGender(rs.getString("Gender"));
				objPatient.setRole(rs.getString("Role"));
				
				/*Testing*/
				System.out.println(objPatient.getLastName());
				
			return objPatient;
					
			}
			
			objPatient=null;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return objPatient;

	}
	
	/*Dinesh*/
	
	public String deleteUser(int BID) {
		// TODO Auto-generated method stub
		
		String result = "";


		try {
			// Check if a user with the same email already exists.
			PreparedStatement stmt = con
					.prepareStatement("delete from registration where BID=?");
			stmt.setInt(1,BID);
			int res = stmt.executeUpdate();
			if (res > 0) {
				result = "Success";
			} else {
			result="failure- BID not present";	
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		}

	
	/*sudh*/
	
	public ArrayList<DiseasesCount> getDiseasesCount(){
		String result = "";

		ArrayList<DiseasesCount> dCount = new ArrayList<DiseasesCount>();
		try {
			// Retrieve all diseases from the DB
			PreparedStatement stmt = con.prepareStatement("SELECT COUNT(annotation.bid) AS Count,icd.DiseaseCode AS DiseaseCode FROM annotation,icd "+
							"WHERE annotation.diseasecode=icd.DiseaseCode GROUP BY annotation.diseasecode;");
			ResultSet rs = stmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					DiseasesCount dc = new DiseasesCount();
					dc.setDiseaseCode(rs.getString("DiseaseCode"));
					dc.setCount(rs.getInt("Count"));
					dCount.add(dc);
				}

				return dCount;
			} else {
				result = "No Diseases Entered For Patients";
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	
				
	}
	
	
	public int patientCount(){
		int count = 0;
		String result="";

		try {
			// Retrieve all diseases from the DB
			PreparedStatement stmt = con.prepareStatement("SELECT COUNT(BID) AS Count FROM registration "+
							"WHERE BodyMap=? AND Role=?");
			
			stmt.setString(1,"No");
			stmt.setString(2,"Patient");
			ResultSet rs = stmt.executeQuery();

			if (rs != null) {
				while (rs.next()) {
					/*DiseasesCount dc = new DiseasesCount();
					dc.setDiseaseName(rs.getString("DiseaseName"));
					dc.setCount(rs.getInt("Count"));
					dCount.add(dc);*/
					count=rs.getInt("Count");
					System.out.println("Printing Count in DB"+count);
				}

				return count;
			} else {
				result = "No New Patients";
				System.out.println(result);
				count=0;
				return count;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return count;
		}
		catch(NullPointerException e)
		{
			e.printStackTrace();
			return count;
		}
						
	}
	
	
	public ArrayList<Annotation> statusActive(int BID) {
		String result = "";

		ArrayList<Annotation> annList = new ArrayList<Annotation>();
		try {
			PreparedStatement stmt = con
					.prepareStatement("SELECT annotation.AnnotationID, annotation.CoordinateX, annotation.Coordinatey, annotation.DiseaseDescription, annotation.DiseaseCode, annotation.DateOfDiagnosis, annotation.BID, annotation.level, annotation.status,icd.DiseaseName FROM annotation INNER JOIN icd on (annotation.DiseaseCode=icd.DiseaseCode) where annotation.BID=? and status=?");
			stmt.setInt(1, BID);
			stmt.setString(2, "active");
			ResultSet rs = stmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					Annotation ann = new Annotation();
					ann.setDiseaseCode(rs.getString("DiseaseCode"));
					ann.setDiseaseDesc(rs.getString("DiseaseDescription"));
					ann.setDateOfDiag(rs.getString("DateOfDiagnosis"));
					ann.setBID(rs.getInt("BID"));
					ann.setExtraDiseaseName(rs.getString("DiseaseName"));	
					ann.setAnnotationID(rs.getInt("AnnotationID"));
					ann.setX_Coord(rs.getFloat("CoordinateX"));
					ann.setY_Coord(rs.getFloat("CoordinateY"));
					ann.setLevel(rs.getString("level"));	
					ann.setStatus(rs.getString("status"));
					annList.add(ann);
				}

				return annList;
			} else {
				result = "No user details found in DB";
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}



	public ArrayList<Annotation> statusDeactive(int BID) {
		String result = "";

		ArrayList<Annotation> annList = new ArrayList<Annotation>();
		try {
			PreparedStatement stmt = con
					.prepareStatement("SELECT annotation.AnnotationID, annotation.CoordinateX, annotation.Coordinatey, annotation.DiseaseDescription, annotation.DiseaseCode, annotation.DateOfDiagnosis, annotation.BID, annotation.level, annotation.status,icd.DiseaseName FROM annotation INNER JOIN icd on (annotation.DiseaseCode=icd.DiseaseCode) where annotation.BID=? and status=?");
			stmt.setInt(1, BID);
			stmt.setString(2, "inactive");
			ResultSet rs = stmt.executeQuery();
			if (rs != null) {
				while (rs.next()) {
					Annotation ann = new Annotation();
					ann.setDiseaseCode(rs.getString("DiseaseCode"));
					ann.setDiseaseDesc(rs.getString("DiseaseDescription"));
					ann.setDateOfDiag(rs.getString("DateOfDiagnosis"));
					ann.setBID(rs.getInt("BID"));
					ann.setExtraDiseaseName(rs.getString("DiseaseName"));	
					ann.setAnnotationID(rs.getInt("AnnotationID"));
					ann.setX_Coord(rs.getFloat("CoordinateX"));
					ann.setY_Coord(rs.getFloat("CoordinateY"));
					ann.setLevel(rs.getString("level"));	
					ann.setStatus(rs.getString("status"));
					annList.add(ann);
				}

				return annList;
			} else {
				result = "No user details found in DB";
				System.out.println(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return null;
	}


	public String deactiveStatus(int[] annotationArray) {
		
		String result = "";
		try {
					
			for(int i=0;i<annotationArray.length;i++)
			{
			PreparedStatement stmt = con
					.prepareStatement("update annotation set status =? where AnnotationID=?");
			stmt.setString(1, "inactive");
			stmt.setInt(2,annotationArray[i]);
			int res = stmt.executeUpdate();
			if (res > 0) {
				result = "Success";
			} else {
			result="failure";	
			}
		}
		}
			catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
		
	}
	
	
	
	
	//Aniruddh..... dbconn for notification. (total no. of diseases/ anatomy level )
		
		
		public ArrayList<Annotation> getNotification(int BID)
		{
			String result = "";
			
			ArrayList<Annotation> annotationCountList = new ArrayList<Annotation>();

			try {
				// Retrieve all diseases from the DB
				PreparedStatement stmt = con.prepareStatement("select (select count(*) from bodymap.annotation where level=? && BID =? && status=? ) as SkinCount," 
																   + "(select count(*) from bodymap.annotation where level=? && BID =? && status=?) as OrganCount,"
																   + "(select count(*) from bodymap.annotation where level=? && BID =? && status=?) as SkeletonCount;");
				
				stmt.setString(1,"skin");
				stmt.setString(4,"organ");
				stmt.setString(7,"skeleton");
				stmt.setInt(2,BID);
				stmt.setInt(5,BID);
				stmt.setInt(8,BID);
				stmt.setString(3,"active");
				stmt.setString(6,"active");
				stmt.setString(9,"active");
				
				
				ResultSet rs = stmt.executeQuery();

				if (rs != null) {
					while (rs.next())
					{
						Annotation ann = new Annotation();
						ann.setSkinCount(rs.getInt("SkinCount"));
						System.out.println(rs.getInt("SkinCount"));
						ann.setOrganCount(rs.getInt("OrganCount"));
						//System.out.println(rs.getInt("OrganCount"));
						ann.setSkeletonCount(rs.getInt("SkeletonCount"));
						//System.out.println(rs.getInt("SkeletonCount"));
						annotationCountList.add(ann);
					}

					return annotationCountList;
				} 
				else 
				{
					result ="No notifications to show";
					System.out.println(result);
				}
			} 
			catch (SQLException e)
			{
				e.printStackTrace();
			}

			return null;
		
					
		}
	
		
		public String notifyDoctor(Registration reg) {
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
	 
			Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("bodymapproject@gmail.com","bodymap123");
					}
				});
	 
			try {
				int bid=reg.getBID();
				String fname=reg.getFirstName();
				String lname=reg.getLastName();
				String toAddress="giftsonp@gmail.com";
				String fromAddress=reg.getEmail();
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(fromAddress));
				message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(toAddress));
				message.setSubject("Body Creation Pending for " +lname+ ", " +fname);
				message.setText("Dear Doctor," +
						"\n\n Kindly Create Body Map. My BID is: "+bid+
						
						"\n\n Regards, "+
						"\n " +fname+" "+lname);
	 
				Transport.send(message);
	 
				System.out.println("Email Sent to " +toAddress);
				return "Success";
	 
			} catch (MessagingException e) {
				
				return "Failure";
			}
			
					
		}
		
		/*Send Email to Patient*/
		
	public String emailPatient(Registration reg, String sub, String content, String docEmailID) {
			
			Properties props = new Properties();
			props.put("mail.smtp.host", "smtp.gmail.com");
			props.put("mail.smtp.socketFactory.port", "465");
			props.put("mail.smtp.socketFactory.class",
					"javax.net.ssl.SSLSocketFactory");
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.port", "465");
	 
			Session session = Session.getDefaultInstance(props,
				new javax.mail.Authenticator() {
					protected PasswordAuthentication getPasswordAuthentication() {
						return new PasswordAuthentication("bodymapproject@gmail.com","bodymap123");
					}
				});
	 
			try {
				/*int bid=reg.getBID();
				String fname=reg.getFirstName();
				String lname=reg.getLastName();*/
				String toAddress="giftsonp@gmail.com";   //Give patient Email Id -- reg.getEmail();
				String fromAddress=docEmailID;  
				//int  age=reg.getAge(); 
				//String gender=reg.getGender(); 
				Message message = new MimeMessage(session);
				message.setFrom(new InternetAddress(fromAddress));
				message.setRecipients(Message.RecipientType.TO,
						InternetAddress.parse(toAddress));
				
				System.out.println("Printing Sub n content in DB"+sub+content);
				message.setSubject(sub);
				message.setText(content+
						
						"\n\n Yours Sincerely,"+
						"\n "+docEmailID);
						/*"\n\n Patient Details" +
						"\n First Name: " +fname+
						"\n Last Name: " +lname+
						"\n Age: "+age+
						"\n Gender: "+gender+
						"\n BID: "+bid+
						"\n "*/
	 
				Transport.send(message);
	 
				System.out.println("Email Sent to " +toAddress);
				return "Success";
	 
			} catch (MessagingException e) {
				
				return "Failure";
			}
				
		}
	
	 public patientDetails getPatientExtra(int bID) {
		 ResultSet rs2;
		 patientDetails patDet = new patientDetails();
		 try {

		 PreparedStatement stmt1 = con.prepareStatement("SELECT * FROM extrainfo WHERE BID=?");
		 stmt1.setInt(1, bID);
		 rs2 = stmt1.executeQuery();
		 while (rs2.next()) {	
		 patDet.setBID(rs2.getInt("BID"));
		 patDet.setHeight(rs2.getDouble("Height"));
		 patDet.setWeight(rs2.getDouble("Weight"));
		 patDet.setBloodPressure(rs2.getDouble("BP"));
		 patDet.setTemperature(rs2.getDouble("Temperature"));
		 patDet.setDateOfDiag(rs2.getString("dateOfDiagnosis"));

		 }

		 } catch (SQLException e) {
		 e.printStackTrace();
		 }
		 return patDet;
		 }
	 
	 public String updatePatient(patientDetails patient) {
		 String result = "";
		 try {

		 PreparedStatement stmt = con
		 .prepareStatement("update extrainfo set Temperature =?, BP=?, Height=?, Weight=?, dateOfDiagnosis=? where bid=?");
		 stmt.setDouble(1,patient.getTemperature());
		 stmt.setDouble(2,patient.getBloodPressure());
		 stmt.setDouble(3,patient.getHeight());
		 stmt.setDouble(4, patient.getWeight());
		 stmt.setString(5, patient.getDateOfDiag());
		 stmt.setInt(6,patient.getBID());
		 int res = stmt.executeUpdate();
		 if (res > 0) {
		 result = "Success";
		 } else {
		 result="failure";	
		 }

		 }
		 catch (SQLException e) {
		 e.printStackTrace();
		 }
		 return result;
		 }
	
}