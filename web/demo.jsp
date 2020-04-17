<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<HTML>
<HEAD>
    <TITLE> ZTREE DEMO </TITLE>
    <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <link href="UI/resources/css/jquery-ui-themes.css" type="text/css" rel="stylesheet"/>
    <link href="UI/resources/css/axure_rp_page.css" type="text/css" rel="stylesheet"/>
    <link href="UI/data/styles.css" type="text/css" rel="stylesheet"/>
    <link href="UI/files/index/styles.css" type="text/css" rel="stylesheet"/>
    <script src="UI/resources/scripts/jquery-1.7.1.min.js"></script>
    <script src="UI/resources/scripts/jquery-ui-1.8.10.custom.min.js"></script>
    <script src="UI/resources/scripts/prototypePre.js"></script>
    <script src="UI/data/document.js"></script>
    <script src="UI/resources/scripts/prototypePost.js"></script>
    <script src="UI/files/index/data.js"></script>
    <link rel="stylesheet" href="zTree_v3-master/css/zTreeStyle/zTreeStyle.css" type="text/css">
    <script type="text/javascript" src="zTree_v3-master/js/jquery-1.4.4.min.js"></script>
    <script type="text/javascript" src="zTree_v3-master/js/jquery.ztree.core.min.js"></script>
    <SCRIPT LANGUAGE="JavaScript">
        var setting = {
            data:{
                simpleData:{
                    enable:true,
                    idKey:"id",
                    pIdKey:"pId",
                    rootPId:0
                }
            },
            view:{
                showLine:true,
            },
            async:{
                enable:true,
                url:"nodeservlet",
                autoParam:["name","pId","id"]
            }
        };
        // $.ajax({
        //     url:"nodeservlet",
        //     data:{},
        //     type:"post",
        //     datatype:"json",
        //     success:function (data) {
        //         zNodes=data;
        //     }
        // })
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
            console.log(wbk)
            xmlhttp.open("POST","nodeservlet?wbk=" + wbk,false);
            xmlhttp.send();
            xmlhttp.onreadystatechange = nodeback();

        }
        function nodeback() {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var temp = eval("(" + xmlhttp.responseText+ ")");
                var zTreeObj = $.fn.zTree.init($("#treeDemo"), setting, temp);
            }

        }


    </SCRIPT>
    <!-- 导师：张三
    2016级博士生：天一、王二、吴五
    2015级硕士生：李四、王五、许六
    2016级硕士生：刘一、李二、李三
    2017级本科生：刘六、琪七、司四  -->
</HEAD>
<BODY>
    <!-- Unnamed (矩形) -->
    <div id="u0" class="ax_default box_2">
        <div id="u0_div" class=""></div>
    </div>

    <!-- Unnamed (组 合) -->
    <div id="u1" class="ax_default" data-left="237" data-top="0" data-width="515" data-height="606">

        <!-- Unnamed (矩形) -->
        <div id="u2" class="ax_default _一级标题">
            <div id="u2_div" class=""></div>
            <div id="u2_text" class="text ">
                <p><span>师门树</span></p>
            </div>
        </div>

        <!-- Unnamed (多行文本框) -->
        <div id="u3" class="ax_default text_area">
            <textarea id="u3_input"></textarea>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u4" class="ax_default primary_button">
            <div id="u4_div" class=""></div>
            <div id="u4_text" class="text ">
                <p><span onclick="node(document.getElementById('u3_input').value)">生成树</span></p>
            </div>
        </div>

        <!-- Unnamed (矩形) -->
        <div id="u5" class="ax_default button">
            <div id="u5_div" class=""></div>
            <div id="u5_text" class="text ">
                <p><span onclick="document.getElementById('u3_input').value=''">重置</span></p>
            </div>
        </div>
        <!-- Unnamed (矩形) -->
        <div id="u6" class="ax_default box_1">

            <div id="u6_div" style="overflow: auto">
                <ul id="treeDemo" class="ztree"></ul>

            </div>

        </div>
    </div>
</BODY>
</HTML>