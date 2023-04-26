package modle;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtil {

    public void sendMail(String userEmail, String emailMsg) throws Exception {


        Properties props = new Properties();
        props.setProperty("mail.transport.protocol", "SMTP");
        props.setProperty("mail.host", "smtp.gmail.com");
        props.setProperty("mail.smtp.auth", "true");
        props.setProperty("mail.smtp.port", "587");
        props.setProperty("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("20100118@mail.wit.ie", "PDZPXB5ek");
            }
        };


        Session session= Session.getInstance(props,auth);



        Message message = new MimeMessage(session);


        message.setFrom(new InternetAddress("20100118@mail.wit.ie"));


        message.setRecipient(MimeMessage.RecipientType.TO, new InternetAddress(userEmail));


        message.setSubject("E-mail verification");


        message.setContent(emailMsg, "text/html;charset=UTF-8");


        Transport.send(message);
    }
}