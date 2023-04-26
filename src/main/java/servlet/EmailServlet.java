package servlet;

import com.alibaba.fastjson.JSON;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import org.apache.commons.lang3.RandomStringUtils;

import java.io.IOException;
import modle.JsonResult;
import modle.MailUtil;


@WebServlet(name = "/EmailServlet", value = "/EmailServlet")
public class EmailServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        System.out.println(email);

        String num = RandomStringUtils.randomNumeric(6);

        String emailMsg = "Email verification code is："+ num + "Do not disclose to others!";


        request.getSession().setAttribute("emailCode", num);

        JsonResult jr = new JsonResult();

        try {
            MailUtil mail = new MailUtil();

            mail.sendMail(email, emailMsg);
            jr.setType(1);
            response.getWriter().write(JSON.toJSONString(jr));
            return;
        } catch (Exception e) {
            e.printStackTrace();
            jr.setType(0);
            jr.setError("邮件发送失败");
            response.getWriter().write(JSON.toJSONString(jr));
            return;
        }

    }
}
