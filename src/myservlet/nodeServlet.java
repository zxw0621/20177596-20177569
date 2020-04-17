package myservlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.alibaba.fastjson.JSON;
import mybean.*;

@WebServlet("/nodeservlet")
public class nodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String wbk=request.getParameter("wbk");
        wbk=wbk.replaceAll("    ","\n");
        node demo = new node();
        String jsonstr=JSON.toJSONString(demo.jiexi(wbk));
        System.out.println(jsonstr);
        out.print(jsonstr);
        out.flush();
        out.close();
        }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
