<div data-role="panel" id="mypanel" data-position="left" data-display="overlay" data-theme="a">
<div data-role="collapsible-set" data-inset="true" data-iconpos="right" data-theme="b" data-content-theme="d">
<div data-role="collapsible" data-collapsed="false">
<h3>文章分类</h3>
<ul data-role="listview">
<li><a href="<%=webfolder%>">首页</a></li>
<%
set rs=server.CreateObject("adodb.recordset")
sql = "select * from ft_news_class order by sort asc,class_id asc"
rs.Open sql, conn, 1, 1
Do While Not rs.EOF
%>
<li><a href="<%=webfolder%>list.asp?id=<%=rs("class_id")%>" target="_self" title="<%=rs("name")%>" data-theme="b"  data-transition="slidefade" data-inline="true"><%=rs("name")%></a></li>
<%
rs.movenext
Loop
rs.Close
Set rs = Nothing
%>
<li data-icon="delete"><a href="#" data-rel="close">Close</a></li>
</ul>
</div>
</div>
</div><!-- /panel -->

<div data-role="header" data-position="fixed" data-theme="b">
<a href="<%=mlink%>" data-icon="home" data-direction="reverse" class="ui-btn-left" data-transition="slidefade" data-inline="true">首页</a>
<h1><%=pagename%></h1>
<a href="#mypanel" data-role="button" data-icon="bars" data-transition="slidefade" data-inline="true">分类</a>
</div>