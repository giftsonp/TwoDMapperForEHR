package servlet;

import java.awt.Color;
import java.awt.Image;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.Service;
import bean.Annotation;
import bean.Registration;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.text.pdf.PdfPCell;
//import com.itextpdf.text.Image;



import java.io.FileOutputStream;
import java.io.FileNotFoundException;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.awt.Graphics2D;
import java.io.File;



/**
 * Servlet implementation class PDFServlet
 */
@WebServlet("/PDFServlet")
public class PDFServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PDFServlet() {
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
		System.out.println("INside PDFSERVLET");

		Service service = new Service();
		Registration registration;
		Annotation[] annotation;
		System.out.println("servlet - going to call proxy ");
		/*	int value=1;*/

		int bid = Integer.parseInt(request.getParameter("bid"));

		System.out.println("BID=="+bid);
		annotation = service.diseasesForReport(bid);
		registration= service.getPatientDetails(bid);
		System.out.println("servlet - after calling proxy ");
		
		
//		
//		
//		//Image load and edit functionality......
		
		BufferedImage bimg = null;
		try {
			if(registration.getGender()== "M")
			{

				File sourceimage = new File("C:\\Users/Gift/workspace/TwoDMapperforEHR1/WebContent/img/MaleSkin.PNG"); //C:\eclipse

				bimg = ImageIO.read(sourceimage);
				
			}
			else
			{

				File sourceimage = new File("C:\\Users/Gift/workspace/TwoDMapperforEHR1/WebContent/img/FemaleSkin.PNG"); //C:\eclipse

				bimg = ImageIO.read(sourceimage);
				
			}
			
			
		    //bimg = ImageIO.read(new File("MaleSkin.png"));
		    Graphics2D g = bimg.createGraphics();
			
			
			for(int i=0; i <annotation.length;i++)
			{
				g.drawString(annotation[i].getExtraDiseaseName(), annotation[i].getX_Coord(), annotation[i].getY_Coord());				
			}
			
			ImageIO.write(bimg, "png", new File("C:\\Users/Gift/workspace/TwoDMapperforEHR1/WebContent/img/output.PNG"));


		} catch (IOException e) 
		{
			System.out.println("Error in reading file...");
		}
		
		
		//------------------------------------------
		//String path = getServletContext().getRealPath("/");
		//BufferedImage bimg = ImageIO.read(new File(path+"MaleSkin.png"));
		//BufferedImage bimg = ImageIO.read(new File("PrintImages/MaleSkin.png"));
				
		response.setContentType("application/pdf"); // Code 1
		try{
			Document document = new Document();

			PdfWriter.getInstance(document, response.getOutputStream()); // Code 2
			
			document.open();
			
			com.itextpdf.text.Image logoImage = com.itextpdf.text.Image.getInstance("C:\\Users/Gift/workspace/TwoDMapperforEHR1/WebContent/img/logo.PNG"); //for now use the folder image..but code for using bufferedimage..google that...
			logoImage.scalePercent(35f);
			logoImage.setAlignment(logoImage.ALIGN_MIDDLE);
			document.add(logoImage);
			
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			document.add(new Paragraph(" "));
			
			
			//adding titles fonts
			 Font font1 = new Font(Font.FontFamily.HELVETICA  ,50, Font.BOLD);
			 font1.setColor(BaseColor.DARK_GRAY);
		      //Font font2 = new Font(Font.FontFamily.COURIER    , 18,
		        //    Font.ITALIC | Font.UNDERLINE);
		      //Font font3 = new Font(Font.FontFamily.TIMES_ROMAN, 27);
			 Paragraph paragraph1 = new Paragraph();
			 paragraph1.setFont(font1);
			 paragraph1.setAlignment(paragraph1.ALIGN_CENTER);
			 paragraph1.add("Report for EHR");
			 
			 
			 document.add(paragraph1);
		            
			 
			 
			 //new page
			 document.newPage();
			 
			 //table for patient information.....
			 
			 PdfPTable infoTable = new PdfPTable(2);
			 infoTable.getDefaultCell().setGrayFill(0.75f);
			 infoTable.addCell("Patient Information");
			 infoTable.addCell("Description");
			 
			 
			 	 infoTable.getDefaultCell().setBackgroundColor(null);
				 infoTable.addCell("First Name");
				 infoTable.addCell(registration.getFirstName());  	
				 infoTable.addCell("Last Name");
				 infoTable.addCell(registration.getLastName());
				 infoTable.addCell("Gender");
				 infoTable.addCell(registration.getGender());
				 infoTable.addCell("Age");
				 int userAge=registration.getAge();
				 String stringAge= Integer.toString(userAge);
				 infoTable.addCell(stringAge);
				 infoTable.addCell("Email Id");
				 infoTable.addCell(registration.getEmail());
				 infoTable.addCell("BodyMap Id");

				 int userBID=registration.getBID();
				 String stringBID= Integer.toString(userBID);
				 infoTable.addCell(stringBID);

			
			 
			 document.add(infoTable);

			 //adding new page
			 document.newPage();
			 com.itextpdf.text.Image image1 = com.itextpdf.text.Image.getInstance("C:\\Users/Gift/workspace/TwoDMapperforEHR1/WebContent/img/output.PNG"); //for now use the folder image..but code for using bufferedimage..google that...
			 image1.scalePercent(50);
			 document.add(image1);
	         
			PdfPTable table = new PdfPTable(3);
			table.getDefaultCell().setGrayFill(0.75f);
			table.addCell("Disease Name");
			table.addCell("Disease Code");
			table.addCell("Date of Diagnosis");

			for(int i=0; i <annotation.length;i++)
			{
				table.getDefaultCell().setBackgroundColor(null);
				table.addCell(annotation[i].getExtraDiseaseName());  	 // Disease Name
				table.addCell(annotation[i].getDiseaseCode());		//Disease Code
				table.addCell(annotation[i].getDateOfDiag());	 	// Date of Diag

			}

//			/*table.addCell("4");
////            table.addCell("Lastname");
////            table.addCell("6");     
////            table.addCell("Date of birth");
////            table.addCell("6"); 
////            table.addCell("Sex");
////            table.addCell("6"); 
////            table.addCell("Degree");
////            table.addCell("6"); 
////            table.addCell("Type");
////            table.addCell("6"); */
////			// Code 4
			document.add(table);
			 document.close();
		} 
		catch (DocumentException e) 
		{
			throw new IOException(e.getMessage());
		
		} 
		
	}
}