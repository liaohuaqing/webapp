<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<!--#include file="../inc/conn.asp"-->
<!--#include file="../inc/function.asp"-->
<%
if trim(request("id"))<>"" then
idc=trim(request("id"))
    set rs=server.CreateObject("adodb.recordset")
    sql = "select * from ft_search where id="&idc&""
    rs.Open sql, conn, 1, 1
    If Not rs.EOF Then
	  set rss=conn.Execute("select * from ft_search where id="&rs("id")&"")
	  conn.Execute("update ft_search set hits=hits+1 where id="&rs("id")&"")
	  key=rs("name")
	else
    response.Redirect("../")
    End If
	rs.Close
	Set rs = Nothing
else
response.Redirect("../")
end if
%>
<%
pagename=key
%>
<title><%=key%></title>
<meta name="keywords" content="<%=key%>" />
<meta name="description" content="<%=key%>" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta content="telephone=no" name="format-detection">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link rel="apple-touch-icon-precomposed" href="<%=mlink%>images/icon.png"/>
<link rel="stylesheet" href="<%=webfolder%>css/jquery.mobile-1.3.1.min.css" />
<script src="<%=webfolder%>js/jquery-1.9.1.min.js" type"text/javascript"></script>
<script src="<%=webfolder%>js/jquery.mobile-1.3.1.min.js" type="text/javascript"></script>
<script language="javascript"  type="text/javascript" src="<%=webfolder%>inc/hits2.asp?action=news_hits&amp;id=<%=id%>"></script>
</head>

<body>
<div data-role="page" id="page-success" data-dom-cache="true">
<!--#include file="../inc/classheader.asp"-->
<div data-role="content">
<ul data-role="listview" data-inset="true">
<li data-role="list-divider">搜索结果-<%=key%></li>
                <%
                Set Rs=Server.CreateObject("ADODB.Recordset")
                Sql="Select top 20 * From ft_news where name like '%"&key&"%' or title like '%"&key&"%' or content like '%"&key&"%' order by hits desc,id desc"
                Rs.Open Sql,Conn,1,1	   
                if rs.eof and rs.bof then 
                response.write "<li>暂时找不到您想要的数据！</li>" 
                else
				%>
                <%
                do while not rs.eof
                %>
                <li><a href="<%=webfolder%>view/news_view.asp?id=<%=rs("id")%>" title="<%=rs("name")%>"  data-transition="slidefade" data-inline="true"><%=rs("name")%></a></li>
                <%
                rs.movenext
                loop
                %>
                <%
                end if
                rs.close
                set rs=nothing
                %>
</ul>
</div>

<!--#include file="../inc/mfoot.asp"-->
</div>
</body>
</html>