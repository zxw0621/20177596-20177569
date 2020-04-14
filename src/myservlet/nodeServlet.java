package myservlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import mybean.*;

@WebServlet("/nodeservlet")
public class nodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out=response.getWriter();
        request.setCharacterEncoding("UTF-8");
        String string=request.getParameter("wbk");
            node demo = new node();
            List<node> nodeList = (List<node>)demo.jiexi(string);
            for(node node :nodeList){
                out.write(node.getName());
                if(node.getList()!=null){
                    for(int i=0;i<=node.getList().size()-1;i++){
                        out.write((String) node.getList().get(i));
                    }
                }
            }
        }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
