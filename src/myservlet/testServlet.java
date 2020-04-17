package myservlet;

import com.alibaba.fastjson.JSON;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import netscape.javascript.JSObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import mybean.*;


@WebServlet("/testservlet")
public class testServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String string="导师：张三\n" +
                "2016级博士生：天一、王二、吴五\n" +
                "2015级硕士生：李四、王五、许六\n" +
                "2016级硕士生：刘一、李二、李三\n" +
                "2017级本科生：刘六、琪七、司四";
        node demo = new node();
        out.write(JSON.toJSONString(demo.jiexi(string)));
        out.flush();
        out.close();

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
