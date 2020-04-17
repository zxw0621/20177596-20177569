package mybean;

import com.alibaba.fastjson.JSON;
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
        List<HashMap<String, Object>> shu = new ArrayList<HashMap<String, Object>>();
        //分解为单行
        String[] fenlei = wb.split("\n");
        for (int i=1;i<=fenlei.length;i++){
            //分解父节点和子节点
            String[] jiedian = fenlei[i-1].split("：");
            if(jiedian[0].equals("导师")){//当检索到导师字段时
                HashMap<String,Object> jd = new HashMap<String,Object>();
                jd.put("id",i);
                jd.put("pId",0);
                jd.put("name","导师");

                shu.add(jd);
                //导师子节点
                HashMap<String,Object> jd1 = new HashMap<String,Object>();
                jd1.put("id",i*10);
                jd1.put("pId",1);
                jd1.put("name",jiedian[1]);

                shu.add(jd1);
            }else{//类别目录
                HashMap<String,Object> jd = new HashMap<String,Object>();
                jd.put("id",i);
                jd.put("pId",1);
                jd.put("name",jiedian[0]);

                shu.add(jd);
                //分解所有子节点
                String[] xjd = jiedian[1].split("、");

                for (int j=0;j<=xjd.length-1;j++){//学生目录
                    HashMap<String,Object> xs = new HashMap<String,Object>();
                    xs.put("id",i*10+j);
                    xs.put("pId",i);
                    xs.put("name",xjd[j]);

                    shu.add(xs);
                }

            }
        }
        return shu;
    }
    public static void main(String args[]) {
        //测试
        node demo = new node();
        String str = "导师：张三    2016级博士生：天一、王二、吴五    2015级硕士生：李四、王五、许六    2016级硕士生：刘一、李二、李三    2017级本科生：刘六、琪七、司四\n";
        str=str.replaceAll("    ","\n");
        System.out.println(demo.jiexi(str));

        System.out.println(JSON.toJSONString(demo.jiexi(str)));
    }
}
