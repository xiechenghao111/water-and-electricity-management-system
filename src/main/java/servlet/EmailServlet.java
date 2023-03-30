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
        // 获取随机的6位数
        String num = RandomStringUtils.randomNumeric(6);
        // 邮件内容
        String emailMsg = "邮箱验证码为："+ num +"请勿泄漏给他人！";

        // 在服务器端保存邮件验证码
        request.getSession().setAttribute("emailCode", num);

        JsonResult jr = new JsonResult();

        try {
            MailUtil mail = new MailUtil();
            // 发送邮件
            mail.sendMail(email, emailMsg);
            jr.setType(1); // 发送成功
            response.getWriter().write(JSON.toJSONString(jr));
            return;
        } catch (Exception e) {
            e.printStackTrace();
            jr.setType(0); // 发送失败
            jr.setError("邮件发送失败");
            response.getWriter().write(JSON.toJSONString(jr));
            return;
        }

    }
}
