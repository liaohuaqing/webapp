<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
dim lanmu_name
lanmu_name="文章管理"
%>
<title><%=lanmu_name%></title>
<!--#include file="check.asp"-->
<meta name="author" content="Web Design：victor QQ:691519757 E-mail:victor2008@foxmail.com Website:http://www.andasen.com/net" />
<link href="pub/css.css" rel="stylesheet" type="text/css" />
</head>

<body onmouseover="self.status='您正在处于网站后台管理，不进行操作请退出！';return true">
<%
dim filename,id,keywords,paixu,action
filename="ft_news_class.asp"'页面名称
id=trim(request("id"))
keywords=trim(request("keywords"))

if trim(request("paixu"))<>"" then
paixu=trim(request("paixu"))
else
paixu="sort"'默认按排序排序
end if

if trim(request("page"))<>"" then
page=trim(request("page"))
else
page=1
end if

if trim(request("pagesize"))<>"" then
pagesize=trim(request("pagesize"))
else
pagesize=10'默认一页显示数
end if

if trim(request("xu"))<>"" then
xu=trim(request("xu"))
else
xu="desc"'默认升序排
end if
%>
<%
if request("action") = "add" then
call add()
elseif request("action")="edit" then
call edit()
elseif request("action")="savenew" then
call savenew()
elseif request("action")="savedit" then
call savedit()
elseif request("action")="del" then
call del()
elseif request("action")="delAll" then
call delAll()
else
call List()
end if

sub List()
%>
<table width="99%" border="0"  align=center cellpadding="3" cellspacing="1" class="a2">
<form name="myform" method="POST" action="<%=filename%>?action=delAll">
<tr  style="font-weight:bold;">
  <td height="30" align="center" class="a1">选择</td>
  <td align="center" class="a1">ID</td>
  <td height="30" align="center" class="a1">分类名称</td>
  <td align="center" class="a1">导航菜单显示</td>
  <td align="center" class="a1">页面调用地址</td>
  <td align="center" class="a1">文章数量</td>
  <td height="30" align="center" class="a1">排序</td>
  <td height="30" align="center" class="a1">管理</td>
</tr>
<%
set rs=server.createobject("adodb.recordset")
sql ="select * from ft_news_class where name like '%"&keywords&"%' order by "&paixu&" "&xu&""
Rs.Open Sql,Conn,1,1
page=request.QueryString("page")
if Isnumeric(page) then
page=cint(page)
if page<1 then page=1
else
page=1
end if
everypage=pagesize
rs.pagesize=everypage
if rs.bof and rs.eof then
%>
<tr >
  <td  colspan="8" align="center" class="red a3">没有数据</td>
  </tr>
<%
else
page_count=rs.pagecount
rs.AbsolutePage=page
j=0
n=1
%>
<% do while not rs.eof and j<rs.pagesize
%>
<tr class="a3"  onmouseover="this.style.backgroundColor='#EAFCD5';return true;"
onmouseout="this.style.backgroundColor='';return true;">
<td align="CENTER"><input type="checkbox" value="<%=rs("class_id")%>" name="id" onClick="unselectall(this.form)" style="border:0;">
<input name="pl_id" type="hidden" id="pl_id" value="<%=rs("class_id")%>"></td>
<td align="center"><%=rs("class_id")%></td>
<td align="center"><input name="name" type="text" id="name" value="<%=rs("name")%>" size="20" maxlength="50" /></td>
<td align="center"><select name="show" id="show">
  <option value="1" <%if rs("show")=true then response.write"selected" end if%> style="color:#FF0000;">是</option>
  <option value="0" <%if rs("show")=false then response.write"selected" end if%>>否</option>
</select></td>
<td align="center">
  <a href="../list.asp?id=<%=rs("class_id")%>" target="_blank">list.asp?id=<%=rs("class_id")%></a>
</td>
<td align="center"><%=Mydb("Select Count([id]) From [ft_news] where [class_id]="&rs("class_id")&"",1)(0)%></td>
<td align="center"><input name="sort" type="text" id="sort" value="<%=rs("sort")%>" size="4" maxlength="10" onKeyDown="myKeyDown()"></td>
<td align="center"><a href="<%=filename%>?action=edit&id=<%=rs("class_id")%>&page=<%=page%>">编辑</a></td>
</tr>
<%if n mod 1=0 then%>
<%end if%>
<%
n=n+1
j=j+1
rs.movenext
loop
end if%>
<tr class="a3"  onMouseOver="this.style.backgroundColor='#EAFCD5';this.style.color='red'" onMouseOut="this.style.backgroundColor='';this.style.color=''">
<td align="center"><input name="Action" type="hidden"  value="Del">
<input name="chkAll" type="checkbox" id="chkAll" onClick=CheckAll(this.form) value="checkbox" style="border:0"></td>
<td colspan="7">
<input name="Del" type="submit" id="Del"  onClick="JavaScript:return confirm('确定删除吗？')" value="批量删除" class="submit_button" style="border:none;">
<input name="Del" type="submit" id="Del" value="批量修改" class="submit_button" style="border:none;">
<!--<input name="Del" type="submit" id="Del" value="添加">--></td>
</tr>
<tr><td colspan="8" align="left">
<div class="page">
<span class="text">共<strong><%=rs.recordcount%></strong>条记录</span>
<span class="text"><strong><%=page%></strong>/<%=page_count%>页</span>
<%if page=1 then%>
<span class="disabled">首页</span><span class="disabled">上一页</span>
<%else%>
<a href="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" >首页</a>
<a href="<%=filename%>?page=<%=page-1%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" >上一页</a>
<%end if%>
<%for j=page-3 to page-1%>
<%if j>0 then%>
<a href="<%=filename%>?page=<%=j%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>"><%=j%></a>
<%end if%>
<%next%>
<%for j=page to page+3%>
<% if j<=page_count then%>
<%if j=page then%>
<span class="current"><%=j%></span>
<%else%>
<a href="<%=filename%>?page=<%=j%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>"><%=j%></a>
<%end if%>
<%end if%>
<% next%>
<%if page<page_count then%>
<a href="<%=filename%>?page=<%=page+1%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" >下一页</a>
<a href="<%=filename%>?page=<%=page_count%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" >末页</a>
<%else%>
<span class="disabled">下一页</span><span class="disabled">末页</span>
<%end if%>
</div>
</td>
</tr>
</form>
</table>

<%
rs.close
set rs=nothing
'end sub

'sub add()
%><br />

<table width="99%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="a2">
<form action="<%=filename%>?action=savenew" name="myform" method=post>
<tr>
<td colspan="3" align=center class="a1">添加文章分类</td>
</tr>
<tr>
<td width="12%" align="right" class="a3">分类名称</td>
<td width="88%" colspan="2" class="a3"><input name="name" type="text" id="name" size="30" maxlength="50"></td>
</tr>
<tr>
<td align="right" class="a3">页面标题</td>
<td colspan="2" class="a3"><input name="title" type="text" id="title" size="80" maxlength="255" /></td>
</tr>
<tr>
  <td align="right" class="a3">关键词</td>
  <td colspan="2" class="a3"><textarea name="keywords" cols="80" rows="3" id="keywords"></textarea>
    <span class="hui">（提醒：不要超过100个字符，关键词要以英文&quot;,&quot;豆号隔开）</span></td>
</tr>
<tr>
  <td align="right" class="a3">描述</td>
  <td colspan="2" class="a3"><textarea name="description" cols="80" rows="3" id="description"></textarea>
    <span class="hui">（提醒：不要超过200个字符）</span></td>
</tr>
<tr>
<td align="right" class="a3">排序</td>
<td colspan="2" class="a3"><input name="sort" type="text" id="sort" value="<%=n%>" size="4" maxlength="10" /></td>
</tr>
<tr>
<td width="12%" align="center" class="a3"></td>
<td colspan="2" class="a3"><input name="Submit" type="submit" value="添 加" class="submit_button" style="border:none;"></td>
</tr>
</form>
</table>
<%
end sub

sub savenew()
name=trim(request.form("name"))
sort=trim(request.form("sort"))
title=trim(request.form("title"))
keywords=left(trim(request.form("keywords")),255)
description=left(trim(request.form("description")),255)

if name="" then
Call Alert ("请填写完整再提交！","-1")
end if
If sort="" Then sort=1
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_news_class "
rs.open sql,conn,1,3
rs.AddNew
rs("name")=name
rs("sort")=sort
rs("title")=title
rs("keywords")=keywords
rs("description")=description
rs.update
rs.close
set rs=nothing

Call Alert ("添加成功！",""&filename&"")
rs.close
set rs=nothing
end sub

sub edit()
id=request("id")
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_news_class where class_id="& id &""
rs.open sql,conn,1,1
%>
<table width="99%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="a2">
<form action="<%=filename%>?action=savedit" name="myform" method=post>
<tr>
<td colspan="3" align=center class="a1">修改文章分类</td>
</tr>
<tr>
<td width="12%" align="right" class="a3"><span class="a3">分类名称</span></td>
<td width="88%" colspan="2" class="a3"><input name="name" type="text" id="name" value="<%=rs("name")%>" size="30" maxlength="50"></td>
</tr>
<tr>
<td align="right" class="a3">页面标题</td>
<td colspan="2" class="a3"><input name="title" type="text" id="title" value="<%=rs("title")%>" size="80" maxlength="255" /></td>
</tr>
<tr>
  <td align="right" class="a3">关键词</td>
  <td colspan="2" class="a3"><textarea name="keywords" cols="80" rows="3" id="keywords"><%=rs("keywords")%></textarea>
    <span class="hui">（提醒：不要超过100个字符，关键词要以英文&quot;,&quot;豆号隔开）</span></td>
</tr>
<tr>
  <td align="right" class="a3">描述</td>
  <td colspan="2" class="a3"><textarea name="description" cols="80" rows="3" id="description"><%=rs("description")%></textarea>
    <span class="hui">（提醒：不要超过200个字符）</span></td>
</tr>
<tr>
<td align="right" class="a3">排序</td>
<td colspan="2" class="a3"><input name="sort" type="text" id="sort" value="<%=rs("sort")%>" size="4" maxlength="10" /></td>
</tr>
<tr>
<td width="12%" align="center" class="a3"><input name="id" type="hidden" id="id" value="<%=rs("class_id")%>">
<input name="page" type="hidden" id="page" value="<%=page%>"></td>
<td colspan="2" class="a3"><input name="Submit" type="submit" value="修 改" class="submit_button" style="border:none;"></td>
</tr>
</form>
</table>
<%
end sub

sub savedit()
name=trim(request.form("name"))
sort=trim(request.form("sort"))
title=trim(request.form("title"))
keywords=left(trim(request.form("keywords")),255)
description=left(trim(request.form("description")),255)

if name="" then
Call Alert ("请填写完整！","-1")
end if
If sort="" Then sort=0
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_news_class where class_id="&id&""
rs.open sql,conn,1,3
if not(rs.eof and rs.bof) then

rs("name")=name
rs("sort")=sort
rs("title")=title
rs("keywords")=keywords
rs("description")=description
rs.update

Call Alert ("修改成功！",""&filename&"?page="&page&"")
else
Call Alert ("修改错误！",-2)
end if
rs.close
set rs=nothing
end sub

Sub delAll
If id="" And Request("Del")<>"批量修改"  Then
Call Alert ("请选择记录!","-1")
ElseIf Request("Del")="批量删除" Then

Server.ScriptTimeout=99999999
Dim del_id
For i=1 to request.form("id").count
del_id=replace(request.form("id")(i),"'","")

	set rs_del=Server.CreateObject("ADODB.RecordSet")
	sql="select * from ft_news where class_id="&del_id&""
	rs_del.open sql,conn,1,1
	if rs_del.eof and rs_del.bof then 
	set rs=conn.execute("delete from ft_news_class where class_id In(" & del_id & ")")
	set rs=conn.execute("delete from ft_news where class_id In(" & del_id & ")")
	else 
	Call Alert ("该分类下还有文章，请先删除文章，再删除分类!","-1")
	rs_del.close 
	set rs_del=nothing
	end if
next

Call Alert ("批量删除成功",""&filename&"")
ElseIf Request("Del")="批量修改" Then
Server.ScriptTimeout=99999999
Dim pl_id,name,sort,show
For i=1 to request.form("pl_id").count
pl_id=replace(request.form("pl_id")(i),"'","")
name=replace(request.form("name")(i),"'","")
sort=replace(request.form("sort")(i),"'","")
show=replace(request.form("show")(i),"'","")
If replace(request.form("sort")(i),"'","")="" Then sort=0
set rs=conn.Execute("select * from ft_news_class where class_id="&pl_id)
conn.Execute("update ft_news_class set name='"&name&"',show='"&show&"',sort="&sort&" where class_id="&pl_id)
next
Call Alert ("批量修改成功",""&filename&"")
End If
End Sub
%>
<!--#include file="foot.asp"-->
</body>
</html>
