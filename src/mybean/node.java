package mybean;

import java.util.*;

public class node {
    private String name;
    private List list = new ArrayList();

    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


    public List jiexi(String wb){
        List shu = new ArrayList();
        String[] fenlei = wb.split("\n");
        for (int i=0;i<=fenlei.length-1;i++){
            String[] jiedian = fenlei[i].split("：");
            if(jiedian[0].equals("导师")){
                node nd = new node();
                nd.setName("导师");
                List dian = new ArrayList();
                dian.add(jiedian[1]);
                nd.setList(dian);
                shu.add(nd);
            }else{
                node nd = new node();
                nd.setName(jiedian[0]);
                String[] xjd = jiedian[1].split("、");
                List dian = new ArrayList();
                for (int j=0;j<=xjd.length-1;j++){
                    dian.add(xjd[j]);
                }
                nd.setList(dian);
                shu.add(nd);
            }
        }

        return shu;
    }
    public static void main(String args[]){
        node demo = new node();
    String str = "导师：张三\n" +
            "2016级博士生：天一、王二、吴五\n" +
            "2015级硕士生：李四、王五、许六\n" +
            "2016级硕士生：刘一、李二、李三\n" +
            "2017级本科生：刘六、琪七、司四";
    List<node> nodeList = (List<node>)demo.jiexi(str);
        for(node node :nodeList){
        System.out.println(node.getName());
        if(node.getList()!=null){
            for(int i=0;i<=node.getList().size()-1;i++){
                System.out.println(node.getList().get(i));
            }
        }
    }
}
}
