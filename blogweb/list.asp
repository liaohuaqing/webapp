<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<!--#include file="inc/conn_index.asp"-->
<!--#include file="inc/function.asp"-->
<%
dim class_id
pagename="blog-list"
filename="default.asp"
	if trim(request("id"))<>"" then
	class_id=trim(request("id"))
	else
	class_id=1
	
	end if
set rs=conn.execute("select * from ft_news_class where class_id="& class_id &"")
if not rs.eof then
ft_classname=rs("name")
'response.write class_id&"<br>"
'response.write ft_classname&"<br>"
end if
rs.close
set rs=nothing
	
%>
<title><%=ft_classname%>-<%=ft_webname%></title>
<meta name="keywords" content="<%=ft_classname%>" />
<meta name="description" content="" />
<link rel="stylesheet" href="css/index.css"/>
<link rel="stylesheet" href="css/style.css"/>
<script type="text/javascript" src="js/jquery1.42.min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.2.1.1.js"></script>
<!--[if lt IE 9]>
<script src="js/html5.js"></script>
<![endif]-->
</head>
<body>
      <!--header start-->
     <div id="header">
    
      <h1><%=ft_webname%></h1>
      <p>SELECT * FROM World WHERE “Someone” LIKE ‘%You%’</p>    
    </div>
     <!--header end-->
    <!--nav-->
       <div id="nav">
        <ul>
         <li><a href="default.asp">首页</a></li>
         <li><a href="about.html">关于我</a></li>
         <li><a href="shuo.html">碎言碎语</a></li>
         <li><a href="riji.html">个人日记</a></li>
         <li><a href="list.asp?id=2">技术分享</a></li>
         <li><a href="list.asp?id=1">学无止境</a></li>
         <li><a href="list.asp?id=3">心得笔记</a></li>
         <div class="clear"></div>
        </ul>
      </div>
       <!--nav end-->
    <!--content start-->
    <div id="content">
       <!--left-->
         <div class="left" id="learn">
           <div class="weizi">
          <div class="wz_text">当前位置：<a href="default.asp">首页</a>><h1><%=ft_classname%></h1></div>
           </div>
           <div class="l_content">
           
           <%
           
           
              set rs=server.CreateObject("adodb.recordset")
              rs.open "select top 5 * from ft_news  where class_id=" & class_id & " order by id desc",conn,1,1
              if rs.eof and rs.bof then
              else
              do while not rs.eof
              
              
              imgurl=rs("ft_uploadfiles")
              if imgurl="" then imgurl="images/s.jpg"
              %>
           <!--wz-->
           <div class="wz">
         
             
<h3><a href="<%=webfolder%>view/news_view.asp?id=<%=rs("id")%>" title="<%=rs("name")%>" alt="<%=rs("name")%>"><%=rs("name")%></a></h3>
             
          
             <dl>
               <dt><img src="<%=imgurl%>" width="200"  height="123" alt=""></dt>
               <dd>
                <p class="dd_text_1"><%=left(MoveHtml(rs("content")),140)%>.....</p>
               <p class="dd_text_2">
               <span class="left author">admin </span><span class="left sj">时间:<%=formatdatetime(rs("date"),2)%></span>
               <span class="left fl">分类:<a href="#" title="<%=ft_classname%>"><%=ft_classname%></a></span><span class="left yd"><a href="<%=webfolder%>view/news_view.asp?id=<%=rs("id")%>" title="<%=rs("name")%>" alt="<%=rs("name")%>">阅读全文</a>
               </span>
              
                <div class="clear"></div>
               </p>
               </dd>
               <div class="clear"></div>
             </dl>
            </div>
            
           <!--wz end-->
           
           <%
              rs.movenext
              loop
              end if
              rs.close
              set rs=nothing
              %>
         
          
                             
           </div>
         </div>
         <!--left end-->
       <!--right-->
          <div class="right" id="c_right">
          <div class="s_about">
          <h2>关于博主</h2>
           <img src="images/my.jpg" width="230" height="230" alt="博主"/>
           <p>博主：再向虎山行</p>
           <p>职业：web前端、后台设计</p>
           <p>简介：</p>
           <p>
           <a href="#" title="联系博主"><span class="left b_1"></span></a><a href="#" title="加入QQ群，一起学习！"><span class="left b_2"></span></a>
           <div class="clear"></div>
           </p>
          </div>
          <!--栏目分类-->
           <div class="lanmubox">
              <div class="hd">
               <ul><li>精心推荐</li><li>最新文章</li><li class="hd_3">随机文章</li></ul>
              </div>
              <div class="bd">
                <ul>
					<li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
					<li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
					<li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
					<li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
					<li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
				</ul>
                 <ul>
					<li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
					<li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
					<li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
					<li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
					<li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
				</ul>
                 <ul>
					<li><a href="#" title="网站项目实战开发（-）">网站项目实战开发（-）</a></li>
					<li><a href="#" title="关于响应式布局">关于响应式布局</a></li>
					<li><a href="#" title="如何创建个人博客网站">如何创建个人博客网站</a></li>
					<li><a href="#" title="网站项目实战开发（二）">网站项目实战开发（二）</a></li>
					<li><a href="#" title="为什么新站前期排名老是浮动？(转)">为什么新站前期排名老是浮动？(转)</a></li>
				</ul>
                 
                
              </div>
           </div>
           <!--end-->
         </div>
         <!--end  right-->
         <div class="clear"></div>
         
    </div>
    <!--content end-->
    <!--footer-->
    <!--footer start-->
    <div id="footer">
     <p>Design by:<a href="#" target="_blank">再向虎山行</a> 2017-2-28</p>
     <p><a href="http://www.miitbeian.gov.cn/" target="_blank"><%response.write ft_icpname%></a></p>
     <br>
    </div>
    <!--footer end-->
</body>
</html>

