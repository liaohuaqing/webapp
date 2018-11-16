<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="conn.asp"-->
<%
dim lanmu_name
lanmu_name="文章管理"
filename="cs.asp"
if request("action")="savenew" then

call savenew()
end if
%>
<title><%=lanmu_name%></title>

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

<body>
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
  <td align="right" class="a3">文章内容</td>
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

sub savenew()
name="测试add"
class_id=1
author="liao"
copyfrom="11"
ft_uploadfiles=trim(request.form("ft_uploadfiles"))
title=trim(request.form("title"))
keywords=left(trim(request.form("keywords")),255)
description=left(trim(request.form("description")),255)
content=trim(request.form("content"))
hits=trim(request.form("hits"))
sort=trim(request.form("sort"))
sSaveFileSelect =request.Form("sSaveFileSelect")


if name="" or content="" then
'Call Alert ("请填写完整再提交！","-1")
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

response.write ("添加成功！")
end sub
%>
</body>
</html>
