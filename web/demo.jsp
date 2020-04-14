<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<HTML>
<HEAD>
    <TITLE> ZTREE DEMO </TITLE>
    <link rel="stylesheet" href="zTree_v3-master/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="zTree_v3-master/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="zTree_v3-master/js/jquery.ztree.core.min.js"></script>
    <SCRIPT LANGUAGE="JavaScript">
        var setting = {};
        var sites = [
            { "name":"runoob","children":"" },
            { "name":"google","children":""  },
            { "name":"微博","children":""  }
        ];
        sites[1].children=[{ "name":"runoob","children":"" },
            { "name":"google","children":""  },
            { "name":"微博","children":""  }];
        var zNodes=sites;
        // var zNodes = [
        //     {
        //         name: "导师", open: true, children: [
        //             {
        //                 name: "张三", open: true, children: [
        //                     {
        //                         name: "2016级博士生", open: true, children: [
        //                             {name: "天一"}, {name: "王二"}, {name: "吴五"}]
        //                     },
        //                     {
        //                         name: "2015级硕士生", open: true, children: [
        //                             {name: "李四"}, {name: "王五"}, {name: "许六"}]
        //                     },
        //                     {
        //                         name: "2016级硕士生", open: true, children: [
        //                             {name: "刘一"}, {name: "李二"}, {name: "李三"}]
        //                     },
        //                     {
        //                         name: "2017级本科生", open: true, children: [
        //                             {name: "刘六"}, {name: "琪七"}, {name: "司四"}]
        //                     }
        //                 ]
        //             }
        //         ]
        //     }
        // ];
        var xmlhttp;
        function createXMLHttp() {
            if (window.XMLHttpRequest) {
                // IE7+, Firefox, Chrome, Opera, Safari 浏览器执行代码
                xmlhttp = new XMLHttpRequest();
            } else {
                // IE6, IE5 浏览器执行代码
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
        }
        function node(wbk) {
            createXMLHttp();
            xmlhttp.open("POST","testservlet?wbk=" + wbk,false);
            xmlhttp.send();
            xmlhttp.onreadystatechange = nodeback();

        }
        function nodeback() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById("testp").innerHTML = xmlhttp.responseText;
            }

        }

        $(document).ready(function () {
            zTreeObj = $.fn.zTree.init($("#tree"), setting, zNodes);
        });
    </SCRIPT>
    <!-- 导师：张三
    2016级博士生：天一、王二、吴五
    2015级硕士生：李四、王五、许六
    2016级硕士生：刘一、李二、李三
    2017级本科生：刘六、琪七、司四  -->
</HEAD>
<BODY>
<p>师门树</p>
<form action="">
    <textarea id="wb" name="wbk"></textarea>
    <input type="submit">
    <input type="button" onclick="node(document.getElementById('wb').value)" value="生成树"></input><br>
    <input type="button" onclick="document.getElementById('wb').value=''" value="重置"></input><br>
</form>
<div id="treediv">
    <ul id="tree" class="ztree"></ul><br>
    <p id="testp"></p>
</div>
<iframe id="id_iframe" name="nm_iframe" style="display:none;"></iframe>
</BODY>
</HTML>