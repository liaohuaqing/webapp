<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE HTML>
<html lang="zh-CN">
<head>
<meta charset="UTF-8">
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/function.asp"-->
<!--#include file="../inc/remove.asp"-->
<%
dim idc,id1,id
idc=trim(request("id"))
if idc<>"" then
id=idc
Set news=Server.CreateObject("ADODB.Recordset")
Sql="Select * From ft_news where id="&id&""
news.Open Sql,Conn,1,1
if news.bof and news.eof then
response.redirect "../"
else
	  set rs_class=conn.execute("select * from ft_news_class where class_id="&news("class_id")&"")
	  if rs_class.eof and rs_class.bof then
	  else
	  classname=rs_class("name")
	  class_id=rs_class("class_id")
	  end if
	  rs_class.close
	  set rs_class=nothing
newsname=news("name")
newstitle=news("title")
newskeywords=news("keywords")
newsdescription=news("description")
newscontent=news("content")
copyfrom=news("copyfrom")
author=news("author")
hits=news("hits")
newsdate=formatdatetime(news("date"),2)
ft_uploadfiles=news("ft_uploadfiles")
end if
news.close
set news=nothing
else
response.redirect "../"
end if


newscontent=replace(newscontent,"+(+","<pre class=brush:js;>")
newscontent=replace(newscontent,"+)+","</pre>")
'response.write  newscontent
'response.end
%>

<title><%=newsname%></title>
<meta name="keywords" content="个人博客" />
<meta name="description" content="" />
<link rel="stylesheet" href="../css/index.css"/>
<link rel="stylesheet" href="../css/style.css"/>
<link type="text/css" rel="stylesheet" href="../css/shCoreDefault.css">
<script type="text/javascript" src="../js/jquery1.42.min.js"></script>
<script type="text/javascript" src="../js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript" src="../js/shCore.js"></script>
<script type="text/javascript" src="../js/shBrushJScript.js"></script>
<script type="text/javascript">SyntaxHighlighter.all();</script>
<!--[if lt IE 9]>
<script src="../js/html5.js"></script>
<![endif]-->
</head>

<body>
      <!--header start-->
    <div id="header">
      <h1>人人皆知</h1>
      <p>SELECT * FROM World WHERE “Someone” LIKE ‘%You%’</p>     
    </div>
     <!--header end-->
     
      
     
    <!--nav-->
     <div id="nav">
        <ul>
         <li><a href="../default.asp">首页</a></li>
         <li><a href="../about.html">关于我</a></li>
         <li><a href="../shuo.html">碎言碎语</a></li>
         <li><a href="../riji.html">个人日记</a></li>
         <li><a href="../list.asp?id=2">技术分享</a></li>
         <li><a href="../list.asp?id=1">学无止境</a></li>
         <li><a href="../list.asp?id=3">心得笔记</a></li>
         <div class="clear"></div>
        </ul>
      </div>
       <!--nav end-->
    <!--content start-->
    <div id="content">
       <!--left-->
         <div class="left" id="news">
           <div class="weizi">
           <div class="wz_text">当前位置：<a href="../default.asp">首页</a>><a href="../list.asp?id=1">学无止境</a>><span>文章内容</span></div>
           </div>

           <div class="news_content">
                  <div class="news_top">
                    <h1><%=newsname%></h1>
                    <p>
                      <span class="left sj">时间:<%=newsdate%></span><span class="left fl">分类:学无止境</span>
                      <span class="left author">admin</span>
                    </p>
                    <div class="clear"></div>
                  </div>
                    <div class="news_text">
                 <%=newscontent%>
                    </div>
           </div>
     
         </div>
         <!--end left -->
         <!--right-->
          <div class="right" id="c_right">
          <div class="s_about">
          <h2>关于博主</h2>
           <img src="../images/my.jpg" width="230" height="230" alt="博主"/>
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
    <div id="footer">
     <p>Design by:<a href="http://www.gome5.com" target="_blank">再向虎山行</a> 2017-3-9</p>
    </div>
    <!--footer end-->
    <script type="text/javascript">jQuery(".lanmubox").slide({easing:"easeOutBounce",delayTime:400});</script>
    <script  type="text/javascript" src="js/nav.js"></script>
</body>
</html>


