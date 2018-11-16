<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
dim lanmu_name
lanmu_name="管理员"
%>
<title><%=lanmu_name%></title>
<!--#include file="check.asp"-->
<!--#include file="pub/md5.asp"-->
<meta name="author" content="Web Design：victor QQ:691519757 E-mail:victor2008@foxmail.com Website:http://www.andasen.com" />
<link href="pub/css.css" rel="stylesheet" type="text/css" />
</head>

<body onmouseover="self.status='您正在处于网站后台管理，不进行操作请退出！';return true">
<%
dim filename,id,keywords,paixu,action
filename="administrator.asp"'页面名称
id=trim(request("id"))
keywords=trim(request("keywords"))

dim power	
power="网站配置,导航管理,文章管理,友情链接,管理员"
power=Split(power,",")

if trim(request("paixu"))<>"" then
paixu=trim(request("paixu"))
else
paixu="id"'默认按排序排序
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
<form name="myform" method="POST" action="<%=filename%>?action=delAll">
<tr>
<td colspan="5" align=center class="a1">管理员管理</td>
</tr>
<tr  style="font-weight:bold;">
<td height="30" align="center" class="a1">选择</td>
<td align="center" class="a1">ID</td>
<td height="30" align="center" class="a1">管理员名称</td>
<td align="center" class="a1">管理员备注</td>
<td height="30" align="center" class="a1">管理</td>
</tr>
<%
set rs=server.createobject("adodb.recordset")
sql ="select * from ft_admin where grade=0 and (name like '%"&keywords&"%' or content like '%"&keywords&"%') order by "&paixu&" "&xu&""
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
  <td  colspan="5" align="center" class="red a3">没有数据</td>
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
<td align="CENTER"><input type="checkbox" value="<%=rs("id")%>" name="id" onClick="unselectall(this.form)" style="border:0;" <% if rs("name")=session("ft_admin") then %>disabled<%end if%>>
<input name="pl_id" type="hidden" id="pl_id" value="<%=rs("id")%>"></td>
<td align="center"><%=rs("id")%></td>
<td align="center"><%=rs("name")%></td>
<td align="center"><%=rs("content")%></td>
<td align="center"><a href="<%=filename%>?action=edit&id=<%=rs("id")%>&page=<%=page%>">编辑</a></td>
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
<td colspan="4">
<input name="Del" type="submit" id="Del"  onClick="JavaScript:return confirm('确定删除吗？')" value="批量删除" class="submit_button" style="border:none;" >
</td>
</tr>
<tr><td colspan="5" align="left">
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
<td colspan="3" align=center class="a1">添加管理员</td>
</tr>
<tr>
<td width="20%" align="center" class="a3">名称</td>
<td width="80%" colspan="2" class="a3"><input name="name" type="text" id="name" size="50" maxlength="50"></td>
</tr>

<tr>
  <td align="center" class="a3">密码</td>
  <td colspan="2" class="a3"><input name="password" type="text" id="password" size="50" maxlength="50" />
  （系统会对密码进行MD5加密）</td>
</tr>

<tr>
  <td align="center" class="a3">权限范围</td>
  <td colspan="2" class="a3">
  <% set rs=conn.Execute("select * from ft_admin")
		for i=0 to ubound(power)
			response.write "<input type=""checkbox"" name=""power"" value="""&trim(power(i))&"""" 
			response.write ">"&trim(power(i))&""
			if ((i+1) mod 1)=0 then response.write "<br>"	'每行显示1个权限
		next
		response.write character %>
  </td>
</tr>
<tr>
<td align="center" class="a3">备注</td>
<td colspan="2" class="a3"><textarea name="content" cols="80" rows="3" id="content"></textarea></td>
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
content=trim(request.form("content"))
password=trim(request.form("password"))
power=checkreal(request.form("power"))

if name="" or password="" then
Call Alert ("请填写完整再提交！","-1")
end if
If sort="" Then sort=1
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_admin Where name='"&name&"'"
rs.open sql,conn,1,3
if rs.eof and rs.bof then
rs.AddNew
rs("name")=name
rs("content")=content
rs("power")=power
rs("password")=md5(password)
rs.update
Call Alert ("添加成功！",""&filename&"")
Else
Call Alert ("该记录已经存在！",-1)
End if
rs.close
set rs=nothing
end sub

sub edit()
id=request("id")
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_admin where id="& id &""
rs.open sql,conn,1,1
%>
<table width="99%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="a2">
<form action="<%=filename%>?action=savedit" name="myform" method=post>
<tr>
<td colspan="3" align=center class="a1">修改管理员</td>
</tr>
<tr>
<td width="20%" align="center" class="a3"><span class="a3">名称</span></td>
<td width="80%" colspan="2" class="a3"><input name="name" type="text" id="name" value="<%=rs("name")%>" size="50" maxlength="50"></td>
</tr>

<tr>
  <td align="center" class="a3">密码</td>
  <td colspan="2" class="a3"><input name="password" type="text" id="password" value="" size="50" maxlength="50" />
  MD5值为：<%=rs("password")%>（不修改密码请为空）</td>
</tr>
<tr>
  <td align="center" class="a3">权限范围</td>
  <td colspan="2" class="a3">
  <% 
		for i=0 to ubound(power)
			response.write "<input type=""checkbox"" name=""power"" value="""&trim(power(i))&"""" 
			if instr(rs("power"),trim(power(i)))>0 then		'如果有此项权利；
			response.write " checked style='background:#FF0000;'" 
			end if
			response.write ">"&trim(power(i))&""
			if ((i+1) mod 1)=0 then response.write "<br>"	'每行显示1个权限
		next
		response.write character 
		%></td>
</tr>
<tr>
<td align="center" class="a3">备注</td>
<td colspan="2" class="a3"><textarea name="content" cols="80" rows="3" id="content"><%=rs("content")%></textarea></td>
</tr>

<tr>
<td width="20%" align="center" class="a3"><input name="id" type="hidden" id="id" value="<%=rs("id")%>">
<input name="page" type="hidden" id="page" value="<%=page%>"></td>
<td colspan="2" class="a3"><input name="Submit" type="submit" value="修 改"></td>
</tr>
</form>
</table>
<%
end sub

sub savedit()
name=trim(request.form("name"))
content=trim(request.form("content"))
password=trim(request.form("password"))
power=checkreal(request.form("power"))

if name="" then
Call Alert ("请填写完整！","-1")
end if
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_admin where id="&id&""
rs.open sql,conn,1,3
if not(rs.eof and rs.bof) then

rs("name")=name
rs("content")=content
rs("power")=power

if password<>"" then
rs("password")=md5(password)
end if

rs.update
Call Alert ("修改成功！",""&filename&"?page="&page&"")
else
Call Alert ("修改错误！",-2)
end if
rs.close
set rs=nothing
end sub

Sub delAll
If id=""  Then
Call Alert ("请选择记录!","-1")
ElseIf Request("Del")="批量删除" Then
set rs=conn.execute("delete from ft_admin where id In(" & id & ")")
Call Alert ("批量删除成功",""&filename&"")
End If
End Sub

%>
</body>
</html>
