package pdf;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
 
public class SendMailSSL {
	public static void main(String[] args) {
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
			String bid="123456";
			String fname="Giftson David Paul";
			String lname="Jebasingh";
			String toAddress="giftsonp@gmail.com";
			String fromAddress="giftsonp@gmail.com";
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
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
