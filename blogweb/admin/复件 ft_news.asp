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
<script charset="utf-8" src="../kindeditor/kindeditor-min.js"></script>
<script charset="utf-8" src="../kindeditor/lang/zh_CN.js"></script>
<script>
	var editor;
	KindEditor.ready(function(K) {
		editor = K.create('textarea[name="content"]', {
			filterMode: false,
			resizeType : 1,
			uploadJson : '../kindeditor/asp/upload_json.asp',
			fileManagerJson : '../kindeditor/asp/file_manager_json.asp',
			allowPreviewEmoticons : true,
			allowImageUpload : true,
			allowFileManager : true,
			items : [
				'source','preview','fullscreen','|','fontname', 'fontsize', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
				'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', '|', 'table','insertorderedlist','insertunorderedlist', 'subscript','superscript','|','image','flash', 'media','insertfile','baidumap', 'link', 'unlink','anchor']
		});
					K('#image1').click(function() {
					editor.loadPlugin('image', function() {
						editor.plugin.imageDialog({
							imageUrl : K('#url1').val(),
							clickFn : function(url, title, width, height, border, align) {
								K('#url1').val(url);
								editor.hideDialog();
							}
						});
					});
				});
	});
</script>
</head>

<body onmouseover="self.status='您正在处于网站后台管理，不进行操作请退出！';return true">
<%
dim filename,id,class_id,keywords,paixu,action
filename="ft_news.asp"'页面名称
id=trim(request("id"))
keywords=trim(request("keywords"))

if trim(request("class_id"))<>"" then
class_id=CInt(trim(request("class_id")))
else
class_id=0
end if

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
<table width="99%" border="0" cellspacing="1" cellpadding="3"  align=center class="a2" style="margin-bottom:5px;">
<tr>
<form name="form1" method="get" action="<%=filename%>">
<td height="25" bgcolor="f7f7f7" class="a1">

搜索：
<input name="keywords" type="text" id="keywords" value="<%=keywords%>">
<input type="submit" name="Submit" value="搜索">

<select name="jumpMenu_paixu" id="jumpMenu_paixu" onChange="location=this.options[this.selectedIndex].value" >
<option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=id&amp;keywords=<%=keywords%>" <% if paixu="id" then %>selected<% end if %>>按【默认】排序</option>
<option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=name&amp;keywords=<%=keywords%>" <% if paixu="name" then %>selected<% end if %>>按【文章标题】排序</option>
<option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=class_id&amp;keywords=<%=keywords%>" <% if paixu="class_id" then %>selected<% end if %>>按【文章分类】排序</option>
<option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=hits&amp;keywords=<%=keywords%>" <% if paixu="hits" then %>selected<% end if %>>按【浏览次数】排序</option>
<option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=sort&amp;keywords=<%=keywords%>" <% if paixu="sort" then %>selected<% end if %>>按【排序】排序</option>
</select>
<select name="jumpMenu_class_id" id="jumpMenu_class_id" onChange="location=this.options[this.selectedIndex].value" >
    <option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;class_id=0&amp;keywords=<%=keywords%>" <%if class_id=0 then %>selected<%end if%>>文章分类</option>
<%
	set rs_class_id=server.CreateObject("adodb.recordset")
	rs_class_id.open "select * from ft_news_class order by class_id",conn,1,1
	if rs_class_id.eof and rs_class_id.bof then
	else
	do while not rs_class_id.eof%>
    	<option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;class_id=<%=rs_class_id("class_id")%>&amp;keywords=<%=keywords%>" <%if rs_class_id("class_id")=class_id then %>selected<%end if%>><%=rs_class_id("name")%></option>
    <% 
	rs_class_id.movenext
	loop
	rs_class_id.close
	set rs_class_id = nothing
	end if
	%>
        </select>
<select name="jumpMenu_xu" id="jumpMenu_xu" onChange="location=this.options[this.selectedIndex].value" >
<option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=asc&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" <% if xu="asc" then %>selected<% end if %>>【升序】</option>
<option value="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=desc&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" <% if xu="desc" then %>selected<% end if %>>【降序】</option>
</select>

<select name="jumpMenu_pagesize" id="jumpMenu_pagesize" onChange="location=this.options[this.selectedIndex].value" >
<option value="<%=filename%>?page=1&amp;pagesize=10&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" <% if pagesize="10" then %>selected<% end if %>>每页【10】条记录</option>
<option value="<%=filename%>?page=1&amp;pagesize=20&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" <% if pagesize="20" then %>selected<% end if %>>每页【20】条记录</option>
<option value="<%=filename%>?page=1&amp;pagesize=30&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" <% if pagesize="30" then %>selected<% end if %>>每页【30】条记录</option>
<option value="<%=filename%>?page=1&amp;pagesize=40&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" <% if pagesize="40" then %>selected<% end if %>>每页【40】条记录</option>
<option value="<%=filename%>?page=1&amp;pagesize=50&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>" <% if pagesize="50" then %>selected<% end if %>>每页【50】条记录</option>
</select>
</td>
</form>
</tr>
</table>


<table width="99%" border="0"  align=center cellpadding="3" cellspacing="1" class="a2">
<form name="myform" method="POST" action="<%=filename%>?action=delAll">
<tr  style="font-weight:bold;">
  <td height="30" align="center" class="a1">选择</td>
  <td align="center" class="a1">ID</td>
  <td height="30" align="center" class="a1">文章标题</td>
  <td align="center" class="a1">页面调用地址</td>
  <td align="center" class="a1">文章分类</td>
  <td align="center" class="a1">浏览次数</td>
  <td height="30" align="center" class="a1">排序</td>
  <td height="30" align="center" class="a1">管理</td>
</tr>
<%
set rs=server.createobject("adodb.recordset")
if class_id>0 then
sql ="select * from ft_news where (name like '%"&keywords&"%' or content like '%"&keywords&"%') and class_id="&class_id&" order by "&paixu&" "&xu&"" 
else
sql ="select * from ft_news where name like '%"&keywords&"%' or content like '%"&keywords&"%' order by "&paixu&" "&xu&"" 
end if
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
<td align="CENTER"><input type="checkbox" value="<%=rs("id")%>" name="id" onClick="unselectall(this.form)" style="border:0;">
<input name="pl_id" type="hidden" id="pl_id" value="<%=rs("id")%>"></td>
<td align="center"><%=rs("id")%></td>
<td align="center">
  <input name="name" type="text" id="name" value="<%=rs("name")%>" size="50" maxlength="255" /></td>
<td align="center">
  <a href="../view/news_view.asp?id=<%=rs("id")%>" target="_blank">news_view.asp?id=<%=rs("id")%></a>
</td>
<td align="center"><%
set rs_class=conn.execute("select * from ft_news_class where class_id="&rs("class_id")&"")
if rs_class.eof and rs_class.bof then
response.Write("未知分类")
else
%>
  <%=rs_class("name")%>
  <%
end if
rs_class.close
%></td>
<td align="center"><%=rs("hits")%></td>
<td align="center"><input name="sort" type="text" id="sort" value="<%=rs("sort")%>" size="4" maxlength="10" onKeyDown="myKeyDown()"></td>
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
<td colspan="7">
<input name="Del" type="submit" id="Del"  onClick="JavaScript:return confirm('确定删除吗？')" value="批量删除" class="submit_button" style="border:none;" >
<input name="Del" type="submit" id="Del" value="批量修改" class="submit_button" style="border:none;" >
<input name="Del" type="submit" id="Del" value="添加" class="submit_button" style="border:none;" ></td>
</tr>
<tr><td colspan="8" align="left">
<div class="page">
<span class="text">共<strong><%=rs.recordcount%></strong>条记录</span>
<span class="text"><strong><%=page%></strong>/<%=page_count%>页</span>
<%if page=1 then%>
<span class="disabled">首页</span><span class="disabled">上一页</span>
<%else%>
<a href="<%=filename%>?page=1&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>&amp;class_id=<%=class_id%>" >首页</a>
<a href="<%=filename%>?page=<%=page-1%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>&amp;class_id=<%=class_id%>" >上一页</a>
<%end if%>
<%for j=page-3 to page-1%>
<%if j>0 then%>
<a href="<%=filename%>?page=<%=j%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>&amp;class_id=<%=class_id%>"><%=j%></a>
<%end if%>
<%next%>
<%for j=page to page+3%>
<% if j<=page_count then%>
<%if j=page then%>
<span class="current"><%=j%></span>
<%else%>
<a href="<%=filename%>?page=<%=j%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>&amp;class_id=<%=class_id%>"><%=j%></a>
<%end if%>
<%end if%>
<% next%>
<%if page<page_count then%>
<a href="<%=filename%>?page=<%=page+1%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>&amp;class_id=<%=class_id%>" >下一页</a>
<a href="<%=filename%>?page=<%=page_count%>&amp;pagesize=<%=pagesize%>&amp;xu=<%=xu%>&amp;paixu=<%=paixu%>&amp;keywords=<%=keywords%>&amp;class_id=<%=class_id%>" >末页</a>
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
end sub

sub add()
%>
<table width="99%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="a2">
<form action="<%=filename%>?action=savenew" name="myform" method=post>
<tr>
<td colspan="3" align=center class="a1">添加文章</td>
</tr>
<tr>
<td width="13%" align="right" class="a3">文章标题</td>
<td width="87%" colspan="2" class="a3"><input name="name" type="text" id="name" size="60" maxlength="255"></td>
</tr>

<tr>
  <td align="right" class="a3">文章分类</td>
  <td colspan="2" class="a3"><select name="class_id" id="class_id">
<%
set rs_class=server.CreateObject("adodb.recordset")
rs_class.open "select * from ft_news_class  order by class_id asc" ,conn,1,1
if rs_class.bof and rs_class.eof then
%>
<option value="0" >没有分类</option>
<%
else
do while not rs_class.eof%>
<option value="<%=rs_class("class_id")%>" ><%=rs_class("name")%></option>
<% 
rs_class.movenext
loop
rs_class.close
set rs_class = nothing
end if
%>
      </select></td>
</tr>
<tr>
  <td align="right" class="a3">作者</td>
  <td colspan="2" class="a3"><input name="author" type="text" id="author" value="网站管理员" size="30" maxlength="50" /></td>
</tr>
<tr>
  <td align="right" class="a3">文章来源</td>
  <td colspan="2" class="a3"><input name="copyfrom" type="text" id="copyfrom" size="30" maxlength="50" value="<%=user_site%>"/></td>
</tr>
<tr>
  <td align="right" class="a3">图片</td>
  <td colspan="2" class="a3"><input type="text" id="url1" value="" size="55" name="ft_uploadfiles"/> <input type="button" id="image1" value="选择图片" class="submit_button" style="border:none;"/></td>
</tr>
<tr>
  <td align="right" class="a3">title</td>
  <td colspan="2" class="a3"><input name="title" type="text" id="title" size="60" maxlength="255" /></td>
</tr>
<tr>
  <td align="right" class="a3">keywords</td>
  <td colspan="2" class="a3"><textarea name="keywords" cols="60" rows="3" id="keywords"></textarea>
    <span class="hui">（提醒：不要超过100个字符，关键词要以英文&quot;,&quot;豆号隔开）</span></td>
</tr>
<tr>
  <td align="right" class="a3">description</td>
  <td colspan="2" class="a3"><textarea name="description" cols="60" rows="3" id="description"></textarea>
    <span class="hui">（提醒：不要超过200个字符）</span></td>
</tr>
<tr>
  <td align="right" class="a3">文章内容<p><font color="#FF0000">源码标签+(+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	+)+</font></td>
  <td colspan="2" class="a3">  <textarea name="content" style="width:100%;height:250px;visibility:hidden;"></textarea>
<input name="sSaveFileSelect" type="checkbox"  id="sSaveFileSelect" value="True">
保存远程图片到本站</td>
</tr>

<tr>
  <td align="right" class="a3">浏览次数</td>
  <td colspan="2" class="a3"><input name="hits" type="text" id="hits" value="0" size="4" maxlength="10" /></td>
</tr>
<tr>
<td align="right" class="a3">排序</td>
<td colspan="2" class="a3"><input name="sort" type="text" id="sort" value="0" size="4" maxlength="10" /></td>
</tr>
<tr>
<td width="13%" align="center" class="a3"></td>
<td colspan="2" class="a3"><input name="Submit" type="submit" value="添 加" class="submit_button" style="border:none;" ></td>
</tr>
</form>
</table>
<%
end sub

sub savenew()
name=trim(request.form("name"))
class_id=trim(request.form("class_id"))
author=trim(request.form("author"))
copyfrom=trim(request.form("copyfrom"))
ft_uploadfiles=trim(request.form("ft_uploadfiles"))
title=trim(request.form("title"))
keywords=left(trim(request.form("keywords")),255)
description=left(trim(request.form("description")),255)
content=trim(request.form("content"))
'content=RemoveHTML(content)

hits=trim(request.form("hits"))
sort=trim(request.form("sort"))
sSaveFileSelect =request.Form("sSaveFileSelect")

if name="" or content="" then
Call Alert ("请填写完整再提交！","-1")
end if
If sort="" Then sort=0
If hits="" Then hits=0
If news_rec="" Then news_rec=false
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_news "
rs.open sql,conn,1,3
rs.AddNew

rs("name")=name
rs("class_id")=class_id
rs("author")=author
rs("copyfrom")=copyfrom
rs("ft_uploadfiles")=ft_uploadfiles
if ft_uploadfiles<>"" then
rs("ft_pic")=1
else
rs("ft_pic")=0
end if
rs("title")=title
rs("keywords")=keywords
rs("description")=description

If sSaveFileSelect="True" Then
yy=right(year(date),4)
mm=right("00"&month(date),2)
dd=right("00"&day(date),2)
uploaddate=yy&mm&dd
Set fso = Server.CreateObject("Scripting.FileSystemObject")
uploadpath="/uploadfiles/image/"&uploaddate&"/"
		If Not fso.FolderExists(Server.mappath(uploadpath)) Then
			fso.CreateFolder(Server.mappath(uploadpath))
		End If
	rs("Content")=ReplaceRemoteUrl(Content,"/uploadfiles/image/"&uploaddate&"/",sFileExt)
	Else
	
	rs("Content")=Content
	End If
rs("hits")=hits
rs("sort")=sort
rs.update

rs.close
set rs=nothing

Call Alert ("添加成功！",""&filename&"")
end sub

sub edit()
id=request("id")
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_news where id="& id &""
rs.open sql,conn,1,1
%>
<table width="99%" border="0"  align=center cellpadding="3" cellspacing="1" bgcolor="#FFFFFF" class="a2">
<form action="<%=filename%>?action=savedit" name="myform" method=post>
<tr>
<td colspan="3" align=center class="a1">修改文章</td>
</tr>
<tr>
<td width="13%" align="right" class="a3">文章标题</td>
<td width="87%" colspan="2" class="a3"><input name="name" type="text" id="name" value="<%=rs("name")%>" size="60" maxlength="255"></td>
</tr>

<tr>
  <td align="right" class="a3">文章分类</td>
  <td colspan="2" class="a3"><select name="class_id" id="class_id">
<%
set rs_class=server.CreateObject("adodb.recordset")
rs_class.open "select * from ft_news_class  order by class_id asc" ,conn,1,1
do while not rs_class.eof%>
<option value="<%=rs_class("class_id")%>" <%if rs_class("class_id")=rs("class_id") then%>selected<%end if%>><%=rs_class("name")%></option>
<% 
rs_class.movenext
loop
rs_class.close
set rs_class = nothing
%>
      </select></td>
</tr>
<tr>
  <td align="right" class="a3">作者</td>
  <td colspan="2" class="a3"><input name="author" type="text" id="author" value="<%=rs("author")%>" size="30" maxlength="50" /></td>
</tr>
<tr>
  <td align="right" class="a3">文章来源</td>
  <td colspan="2" class="a3"><input name="copyfrom" type="text" id="copyfrom" value="<%=rs("copyfrom")%>" size="30" maxlength="50" /></td>
</tr>
<tr>
  <td align="right" class="a3">图片</td>
  <td colspan="2" class="a3"><input type="text" id="url1" size="55" name="ft_uploadfiles" value="<%=rs("ft_uploadfiles")%>"/> <input type="button" id="image1" value="选择图片" class="submit_button" style="border:none;"/></td>
</tr>
<tr>
  <td align="right" class="a3">title</td>
  <td colspan="2" class="a3"><input name="title" type="text" id="title" value="<%=rs("title")%>" size="60" maxlength="255" /></td>
</tr>
<tr>
  <td align="right" class="a3">keywords</td>
  <td colspan="2" class="a3"><textarea name="keywords" cols="60" rows="3" id="keywords"><%=rs("keywords")%></textarea>
    <span class="hui">（提醒：不要超过100个字符，关键词要以英文&quot;,&quot;豆号隔开）</span></td>
</tr>
<tr>
  <td align="right" class="a3">description</td>
  <td colspan="2" class="a3"><textarea name="description" cols="60" rows="3" id="description"><%=rs("description")%></textarea>
    <span class="hui">（提醒：不要超过200个字符）</span></td>
</tr>
<tr>
  <td align="right" class="a3">文章内容<p><font color="#FF0000">源码标签+(+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
	+)+</font></td>
  <td colspan="2" class="a3"><textarea name="content" style="width:100%;height:250px;visibility:hidden;"><%=rs("content")%></textarea><input name="sSaveFileSelect" type="checkbox"  id="sSaveFileSelect" value="True">
保存远程图片到本站</td>
</tr>
<tr>
  <td align="right" class="a3">浏览次数</td>
  <td colspan="2" class="a3"><input name="hits" type="text" id="hits" value="<%=rs("hits")%>" size="4" maxlength="10" /></td>
</tr>
<tr>
<td align="right" class="a3">排序</td>
<td colspan="2" class="a3"><input name="sort" type="text" id="sort" value="<%=rs("sort")%>" size="4" maxlength="10" /></td>
</tr>
<tr>
<td width="13%" align="center" class="a3"><input name="id" type="hidden" id="id" value="<%=rs("id")%>">
<input name="page" type="hidden" id="page" value="<%=page%>"></td>
<td colspan="2" class="a3"><input name="Submit" type="submit" value="修 改" class="submit_button" style="border:none;" ></td>
</tr>
</form>
</table>
<%
end sub

sub savedit()
name=trim(request.form("name"))
class_id=trim(request.form("class_id"))
author=trim(request.form("author"))
copyfrom=trim(request.form("copyfrom"))
ft_uploadfiles=trim(request.form("ft_uploadfiles"))
title=trim(request.form("title"))
keywords=left(trim(request.form("keywords")),255)
description=left(trim(request.form("description")),255)
content=trim(request.form("content"))

'content=RemoveHTML(content)

hits=trim(request.form("hits"))
sort=trim(request.form("sort"))
sSaveFileSelect =request.Form("sSaveFileSelect")

if name="" or content="" then
Call Alert ("请填写完整！","-1")
end if
If sort="" Then sort=0
If hits="" Then hits=0
set rs = server.CreateObject ("adodb.recordset")
sql="select * from ft_news where id="&id&""
rs.open sql,conn,1,3
if not(rs.eof and rs.bof) then

rs("name")=name
rs("class_id")=class_id
rs("author")=author
rs("copyfrom")=copyfrom

if ft_uploadfiles<>rs("ft_uploadfiles") and rs("ft_uploadfiles")<>"" then
file_delete rs("ft_uploadfiles")
end if
rs("ft_uploadfiles")=ft_uploadfiles
if ft_uploadfiles<>"" then
rs("ft_pic")=1
else
rs("ft_pic")=0
end if

rs("title")=title
rs("keywords")=keywords
rs("description")=description

If sSaveFileSelect="True" Then
yy=right(year(date),4)
mm=right("00"&month(date),2)
dd=right("00"&day(date),2)
uploaddate=yy&mm&dd
Set fso = Server.CreateObject("Scripting.FileSystemObject")
uploadpath="/uploadfiles/image/"&uploaddate&"/"
		If Not fso.FolderExists(Server.mappath(uploadpath)) Then
			fso.CreateFolder(Server.mappath(uploadpath))
		End If
	rs("Content")=ReplaceRemoteUrl(Content,"/uploadfiles/image/"&uploaddate&"/",sFileExt)
	Else
	rs("Content")=Content
	End If
rs("hits")=hits
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
If id="" And Request("Del")<>"批量修改" And Request("Del")<>"添加" Then
Call Alert ("请选择记录!","-1")
ElseIf Request("Del")="批量删除" Then
Server.ScriptTimeout=99999999

Dim del_id
For i=1 to request.form("id").count
del_id=replace(request.form("id")(i),"'","")
set rs_del = server.CreateObject ("adodb.recordset")
rs_del.open "select * from [ft_news]  where id="&del_id,conn,1,1

sql="delete from [ft_news] where id="&del_id
if rs_del("ft_uploadfiles")<>"" then
file_pic=".."+rs_del("ft_uploadfiles")'定义要删除的文件
conn.execute sql
file_delete file_pic
else
conn.execute sql
end if

next
Call Alert ("批量删除成功",""&filename&"")
ElseIf Request("Del")="批量修改" Then
Server.ScriptTimeout=99999999
Dim pl_id,name,sort
For i=1 to request.form("pl_id").count
pl_id=replace(request.form("pl_id")(i),"'","")
name=replace(request.form("name")(i),"'","")
sort=replace(request.form("sort")(i),"'","")
If replace(request.form("sort")(i),"'","")="" Then sort=0
set rs=conn.Execute("select * from ft_news where id="&pl_id)
conn.Execute("update ft_news set name='"&name&"',sort="&sort&" where id="&pl_id)
next
Call Alert ("批量修改成功",""&filename&"")
ElseIf Request("Del")="添加" Then
response.redirect""&filename&"?action=add"
response.end
End If
End Sub
%>

<%  
Function RemoveHTML(strHTML)    '过滤HTML代码的函数包括过滤CSS和JS  
  
StrHtml = Replace(StrHtml,vbCrLf,"")   
StrHtml = Replace(StrHtml,Chr(13)&Chr(10),"")   
StrHtml = Replace(StrHtml,Chr(13),"")   
StrHtml = Replace(StrHtml,Chr(10),"")   
StrHtml = Replace(StrHtml," ","")   
StrHtml = Replace(StrHtml,"    ","")  
  
Dim objRegExp, Match, Matches   
Set objRegExp = New Regexp   
  
objRegExp.IgnoreCase = True   
objRegExp.Global = True  
  
'取闭合的<>   
objRegExp.Pattern = "<style(.+?)/style>"   
'进行匹配   
Set Matches = objRegExp.Execute(strHTML)   
  
' 遍历匹配集合，并替换掉匹配的项目   
For Each Match in Matches   
strHtml=Replace(strHTML,Match.Value,"")   
Next  
  
'取闭合的<>   
objRegExp.Pattern = "<script(.+?)/script>"   
'进行匹配   
Set Matches = objRegExp.Execute(strHTML)   
  
' 遍历匹配集合，并替换掉匹配的项目   
For Each Match in Matches   
strHtml=Replace(strHTML,Match.Value,"")   
Next  
  
'取闭合的<>   
objRegExp.Pattern = "<.+?>"   
'进行匹配   
Set Matches = objRegExp.Execute(strHTML)   
  
' 遍历匹配集合，并替换掉匹配的项目   
For Each Match in Matches   
strHtml=Replace(strHTML,Match.Value,"")   
Next  
  
RemoveHTML=strHTML   
Set objRegExp = Nothing   
End Function  
  
%>  
<!--#include file="foot.asp"-->
</body>
</html>
