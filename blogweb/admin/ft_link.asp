<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
dim lanmu_name
lanmu_name="友情链接"
%>
<title><%=lanmu_name%></title>
<!--#include file="check.asp"-->
<meta name="author" content="Web Design：victor QQ:691519757 E-mail:victor2008@foxmail.com Website:http://www.andasen.com/net" />
<link href="pub/css.css" rel="stylesheet" type="text/css" />
</head>

<body onmouseover="self.status='您正在处于网站后台管理，不进行操作请退出！';return true">
<%
dim filename,id,keywords,paixu,action
filename="ft_link.asp"'页面名称
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
xu="asc"'默认升序排
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
<form action="<%=filename%>?action=delAll" method="POST" name="myform1" id="myform1">
<tr>
<td colspan="8" align=center class="a1">友情链接管理</td>
</tr>
<tr  style="font-weight:bold;">
<td width="7%" height="30" align="center" class="a1">选择</td>
<td width="4%" align="center" class="a1">ID</td>
<td width="25%" height="30" align="center" class="a1">链接名称</td>
<td width="35%" align="center" class="a1">链接地址</td>
<td width="10%" align="center" class="a1">全站显示</td>
<td width="8%" align="center" class="a1">审核</td>
<td width="5%" height="30" align="center" class="a1">排序</td>
<td width="6%" height="30" align="center" class="a1">管理</td>
</tr>
<%
set rs=server.createobject("adodb.recordset")
sql ="select * from ft_link where name like '%"&keywords&"%' or url like '%"&keywords&"%' order by "&paixu&" "&xu&""
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
<td align="CENTER"><input type="checkbox" value="<%=rs("link_id")%>" name="id" onClick="unselectall(this.form)" style="border:0;">
<input name="pl_id" type="hidden" id="pl_id" value="<%=rs("link_id")%>"></td>
<td align="center"><%=rs("link_id")%></td>
<td align="center">
<input name="name" type="text" id="name" value="<%=rs("name")%>" size="25" maxlength="255" /></td>
<td align="center"><input name="url" type="text" id="url" value="<%=rs("url")%>" size="40" maxlength="255"></td>
<td align="center"><select name="bnav" id="bnav">
  <option value="1" <%if rs("bnav")=true then response.write"selected" end if%> style="color:#FF0000;">是</option>
  <option value="0" <%if rs("bnav")=false then response.write"selected" end if%>>否</option>
</select></td>
<td align="center"><select name="show" id="show">
  <option value="1" <%if rs("show")=true then response.write"selected" end if%> style="color:#FF0000;">是</option>
  <option value="0" <%if rs("show")=false then response.write"selected" end if%>>否</option>
</select></td>
<td align="center"><input name="sort" type="text" id="sort" value="<%=rs("sort")%>" size="4" maxlength="10" onKeyDown="myKeyDown()"></td>
<td align="center"><a href="<%=filename%>?action=edit&id=<%=rs("link_id")%>&page=<%=page%>">编辑</a></td>
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
<input name="Del" type="submit" id="Del"  onClick="JavaScript:return confirm('确定删除吗？')" value="批量删除" class="submit_button" style="border:none;" >
<input name="Del" type="submit" id="Del" value="批量修改" class="submit_button" style="border:none;" >
<!--<input name="Del" type="submit" id="Del" value="添加">-->
<span class="hui">（提醒：友情链接分为首页链接和全站链接，可选择进行操作）</span></td>
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
<td colspan="3" align=center class="a1">添加友情链接</td>
</tr>
<tr>
<td width="20%" align="center" class="a3">链接名称</td>
<td width="80%" colspan="2" class="a3"><input name="name" type="text" id="name" size="35" maxlength="255">
  <span class="red">*</span></td>
</tr>

<tr>
<td align="center" class="a3">链接地址</td>
<td colspan="2" class="a3"><input name="url" type="text" id="url" value="http://" size="50" maxlength="255" />
（网址必须http://开头，如：http://www.ki78.com）<span class="red">*</span></td>
</tr>
<tr>
  <td align="center" class="a3">是否审核</td>
  <td colspan="2" class="a3"><select name="show" id="show">
  <option value="1" selected="selected" style="color:#FF0000;">是</option>
  <option value="0" >否</option>
  </select>
  （选“是”才会在前台显示）</td>
</tr>
<tr>
  <td align="center" class="a3">是否全站显示</td>
  <td colspan="2" class="a3"><select name="bnav" id="bnav">
  <option value="1" style="color:#FF0000;">是</option>
  <option value="0" selected="selected">否</option>
  </select>
  （选"是"才会在全站显示，否则首页显示）</td>
</tr>
<tr>
<td align="center" class="a3">排序</td>
<td colspan="2" class="a3"><input name="sort" type="text" id="sort" value="<%=n%>" size="4" maxlength="10" /></td>
</tr>
<tr>
<td width="20%" align="center" class="a3"></td>
<td colspan="2" class="a3"><input name="Submit" type="submit" value="添 加" class="submit_button" style="border:none;" ></td>
</tr>
</form>
</table>
<%
end sub

sub savenew()
name=trim(request.form("name"))
url=trim(request.form("url"))
show=trim(request.form("show"))
bnav=trim(request.form("bnav"))
sort=trim(request.form("sort"))

if name="" or url="" then
Call Alert ("请填写完整再提交！","-1")
end if
If sort="" Then sort=1
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_link "
rs.open sql,conn,1,3
rs.AddNew
rs("name")=name
rs("url")=url
rs("show")=show
rs("bnav")=bnav
rs("sort")=sort
rs.update
Call Alert ("添加成功！",""&filename&"")
rs.close
set rs=nothing
end sub

sub edit()
id=request("id")
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_link where link_id="& id &""
rs.open sql,conn,1,1
%>
<table width="99%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="a2">
<form action="<%=filename%>?action=savedit" name="myform" method=post>
<tr>
<td colspan="3" align=center class="a1">修改友情链接</td>
</tr>
<tr>
<td width="20%" align="center" class="a3"><span class="a3">链接名称</span></td>
<td width="80%" colspan="2" class="a3"><input name="name" type="text" id="name" value="<%=rs("name")%>" size="35" maxlength="255">
  <span class="red">*</span></td>
</tr>

<tr>
<td align="center" class="a3">链接地址</td>
<td colspan="2" class="a3"><input name="url" type="text" id="url" value="<%=rs("url")%>" size="50" maxlength="255" />
  （网址必须http://开头，如：http://www.ki78.com）<span class="red">*</span></td>
</tr>
<tr>
  <td align="center" class="a3">是否审核</td>
  <td colspan="2" class="a3"><select name="show" id="show">
  <option value="1" <%if rs("show")=true then response.write"selected" end if%> style="color:#FF0000;">是</option>
  <option value="0" <%if rs("show")=false then response.write"selected" end if%>>否</option>
</select>
    （选“是”才会在前台显示）</td>
</tr>
<tr>
  <td align="center" class="a3">是否全站显示</td>
  <td colspan="2" class="a3"><select name="bnav" id="bnav">
  <option value="1" <%if rs("bnav")=true then response.write"selected" end if%> style="color:#FF0000;">是</option>
  <option value="0" <%if rs("bnav")=false then response.write"selected" end if%>>否</option>
</select>
    （选&quot;是&quot;才会在全站显示，否则首页显示）</td>
</tr>
<tr>
<td align="center" class="a3">排序</td>
<td colspan="2" class="a3"><input name="sort" type="text" id="sort" value="<%=rs("sort")%>" size="4" maxlength="10" /></td>
</tr>
<tr>
<td width="20%" align="center" class="a3"><input name="id" type="hidden" id="id" value="<%=rs("link_id")%>">
<input name="page" type="hidden" id="page" value="<%=page%>"></td>
<td colspan="2" class="a3"><input name="Submit" type="submit" value="修 改" class="submit_button" style="border:none;" ></td>
</tr>
</form>
</table>
<%
end sub

sub savedit()
name=trim(request.form("name"))
url=trim(request.form("url"))
show=trim(request.form("show"))
bnav=trim(request.form("bnav"))
sort=trim(request.form("sort"))

if name="" or url="" then
Call Alert ("请填写完整！","-1")
end if
If sort="" Then sort=0
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_link where link_id="&id&""
rs.open sql,conn,1,3
if not(rs.eof and rs.bof) then

rs("name")=name
rs("url")=url
rs("show")=show
rs("bnav")=bnav
rs("sort")=sort

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
set rs=conn.execute("delete from ft_link where link_id In(" & id & ")")
Call Alert ("批量删除成功",""&filename&"")
ElseIf Request("Del")="批量修改" Then
Server.ScriptTimeout=99999999
Dim pl_id,name,url,sort,bnav
For i=1 to request.form("pl_id").count
pl_id=replace(request.form("pl_id")(i),"'","")
name=replace(request.form("name")(i),"'","")
url=replace(request.form("url")(i),"'","")
show=replace(request.form("show")(i),"'","")
bnav=replace(request.form("bnav")(i),"'","")
sort=replace(request.form("sort")(i),"'","")
If replace(request.form("sort")(i),"'","")="" Then sort=0
set rs=conn.Execute("select * from ft_link where link_id="&pl_id)
conn.Execute("update ft_link set name='"&name&"',url='"&url&"',show="&show&",bnav="&bnav&",sort="&sort&" where link_id="&pl_id)
next
Call Alert ("批量修改成功",""&filename&"")
End If
End Sub
%>
<!--#include file="foot.asp"-->
</body>
</html>
