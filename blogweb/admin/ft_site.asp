<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%
dim lanmu_name
lanmu_name="网站配置"
%>
<title><%=lanmu_name%></title>
<!--#include file="check.asp"-->
<!--#include file="aspcall.asp"-->
<!--#include file="imginch.asp"-->
<meta name="author" content="Web Design：victor QQ:691519757 E-mail:victor2008@foxmail.com Website:http://www.andasen.com/net" />
<link href="pub/css.css" rel="stylesheet" type="text/css" />
<script charset="utf-8" src="pub/custom-form-elements.js"></script>
<script language="JavaScript" type="text/JavaScript">
function showlist1(dd)
{
  if(dd=="a")
  {
   ftshow1.style.display="none";
  }
  else
  {
   ftshow1.style.display="";
  }
}
function showlist2(dd)
{
  if(dd=="a")
  {
   ftshow2.style.display="none";
  }
  else
  {
   ftshow2.style.display="";
  }
}
function showlist3(dd)
{
  if(dd=="a")
  {
   ftshow3.style.display="none";
  }
  else
  {
   ftshow3.style.display="";
  }
}
</script>
</head>
<%
dim action,filename
filename="ft_site.asp"
action=trim(request("action"))
select case action
case "save"
call save()
case else
call main()
end select
sub main()
%>
<body onmouseover="self.status='您正在处于网站后台管理，不进行操作请退出！';return true">
<br>
<%
sql="select * from ft_site"
set rs=server.createobject("adodb.recordset")
rs.open sql,conn,1,1
%>
<form name="myform" id="myform" action="<%=filename%>?action=save" method="post">
<table width="100%"  cellpadding="3"  cellspacing="1" border="0" align="left" class="a2" id="tagContent0">
<tr>
  <td align="right" class="a3">网站名称：      </td>
  <td width="86%" align="left" class="a3"><input name="ft_webname" type="text" id="ft_webname" value="<%=rs("ft_webname")%>" size="50" maxlength="255" />
    </td>
</tr>
<tr>
  <td align="right" class="a3">网址：</td>
  <td align="left" class="a3"><input name="weburl" type="text" id="weburl" value="<%=rs("weburl")%>" size="50" maxlength="255"/>  <span class="hui">例：http://www.ki73.com</span></td>
</tr>

<tr>
  <td align="right" class="a3">存放目录：</td>
  <td class="a3"><input name="webfolder" type="text" id="webfolder" value="<%=rs("webfolder")%>" size="50" maxlength="50" />
    <span class="hui">（提醒：如是根目录请为斜杠</span><span class="red">/</span><span class="hui">开头，最好放置在根目录，不会出错）</span></td>
</tr>
<tr>
<td align="right" class="a3">LOGO：</td>
<td class="a3"><input name="logo" type="text" id="logo" value="<%=rs("logo")%>" size="50" maxlength="255" />
<input type="button" name="submit1"  id="submit" value="上传logo" class="submit_button" style="border:none;" onClick="window.open('pic_upload_flash.asp?formname=myform&editname=logo&uppath=../images&amp;filelx=jpg&amp;file_name=logo&amp;ying=0','','status=no,scrollbars=no,top=20,left=110,width=420,height=420')">
<span class="hui">（提醒：为空则前台不显示logo）</span></td>
</tr>
<tr>
  <td align="right" class="a3">备案号：</td>
  <td class="a3"><input name="icp" type="text" id="icp" value="<%=rs("icp")%>" size="50" maxlength="50">
    不填写，前台不显示</td>
</tr>
<tr>
  <td align="right" class="a3">网站开关：</td>
  <td class="a3"><input type="radio" name="webclose" value="false" <%if rs("webclose")=false then response.write"checked" end if%> onClick='showlist1("a");'>
    开启 
      <input type="radio" name="webclose" value="true" <%if rs("webclose")=true then response.write"checked" end if%> onClick='showlist1("b");'>
    关闭</td>
</tr>
<tr id="ftshow1" <%if rs("webclose")=false then%>style="display:none"<%end if%>>
  <td align="right" bgcolor="#FFFFFF" class="a3">关闭提示：</td>
  <td bgcolor="#FFFFFF" class="a3"><textarea name="webclosewhy"  cols="70" rows="3"><%=rs("webclosewhy")%></textarea></td>
</tr>
<tr>
  <td align="right" class="a3">主标题Title：</td>
  <td align="left" class="a4"><input name="ft_title" type="text" id="ft_title" value="<%=rs("ft_title")%>" size="70" maxlength="255" />
    <span class="hui">（提醒：不超过80个字符）</span></td>
</tr>
<tr>
  <td width="14%" align="right" class="a3">关键字Keywords：</td>
  <td align="left" class="a4"><textarea name="ft_keywords" cols="70" rows="3" id="ft_keywords"><%=rs("ft_keywords")%></textarea>
    <span class="hui">（提醒：不要超过120个字符）</span></td>
  </tr>
<tr>
  <td align="right" class="a3">描述Description：</td>
  <td align="left" class="a4"><textarea name="ft_description" cols="70" rows="3" id="ft_description"><%=rs("ft_description")%></textarea>
    <span class="hui">（提醒：不要超过200个字符）</span></td>
</tr>
<tr>
  <td align="right" class="a3">统计开关：</td>
  <td class="a3"><input type="radio" name="tongji_open" value="1" <%if rs("tongji_open")=1 then response.write"checked" end if%> onClick='showlist2("b");'>
    开启 
    <input type="radio" name="tongji_open" value="0" <%if rs("tongji_open")=0 then response.write"checked" end if%> onClick='showlist2("a");'>
    关闭</td>
</tr>
<tbody id="ftshow2" <%if rs("tongji_open")=0 then%>style="display:none"<%end if%>>
  <tr>
    <td align="right" class="a3">统计代码：</td>
    <td class="a3">
      <textarea name="tongji" cols="70" rows="4" id="tongji"><%=rs("tongji")%></textarea> <span class="hui">（请放置第三方代码统计）</span></td>
  </tr>
</tbody>
<tr>
  <td align="right" class="a3">文章每页数量：</td>
  <td class="a3"><input name="news_page" type="text" id="news_page" value="<%=rs("news_page")%>" size="5" maxlength="50" />
    条</td>
</tr>
<tr>
<td align="right" class="a3">水印开关：</td>
<td colspan="2" class="a3">
<%If IsObjInstalled("Persits.Jpeg") Then%>
<input type="radio" name="shuiyin" value="1" <%if rs("shuiyin")=1 then response.write"checked" end if%> onClick='showlist3("b");'>
开启 
<input type="radio" name="shuiyin" value="0" <%if rs("shuiyin")=0 then response.write"checked" end if%> onClick='showlist3("a");'>
关闭
<font color="#00CC00">√支持！</font>
<%else%>
<input type="radio" name="shuiyin" value="0" checked >关闭
<font color="#FF0000">×不支持，默认关闭该功能，要支持请安装Aspjpeg组件！</font>
<%end if%></td>
</tr>
<tbody id="ftshow3" <%if rs("shuiyin")=0 then%>style="display:none"<%end if%>>
<tr>
  <td align="right" class="a3"><span class="red">*</span>图片：</td>
  <td class="a3"><input name="watermark" type="text" id="watermark" value="<%=rs("watermark")%>" size="30" maxlength="255" />
<input type="button" name="submit1"  id="submit" value="水印图案" class="submit_button" style="border:none;" onClick="window.open('pic_upload_flash.asp?formname=myform&editname=watermark&uppath=../images&filelx=png&file_name=watermark&ying=0','','status=no,scrollbars=no,top=20,left=110,width=420,height=420')">
必须是PNG透明背景图</td>
</tr>
</tbody>
<tr>
  <td align="center">&nbsp;</td>
  <td align="left"><input name="submit" type="submit" id="submit" value="保存" class="submit_button" style="border:none;" >
</td>
</tr>
</table>
</form>
<%
rs.close
set rs=nothing
%>
<%
end sub
sub save()
set rs=server.CreateObject("adodb.recordset")
sql="select * from ft_site"
rs.open sql,conn,1,3
rs.update
rs("ft_webname")=trim(request("ft_webname"))
rs("weburl")=trim(request("weburl"))
if trim(request("webfolder"))<>"" then
rs("webfolder")=trim(request("webfolder"))
else
rs("webfolder")="/"
end if
rs("logo")=trim(request("logo"))
rs("icp")=trim(request("icp"))
rs("webclose")=trim(request("webclose"))
rs("webclosewhy")=trim(request("webclosewhy"))
rs("ft_title")=trim(request("ft_title"))
rs("ft_keywords")=left(trim(request("ft_keywords")),255)
rs("ft_description")=left(trim(request("ft_description")),255)
rs("tongji_open")=trim(request("tongji_open"))
rs("tongji")=trim(request("tongji"))
if trim(request("news_page"))<>"" then
rs("news_page")=trim(request("news_page"))
else
rs("news_page")=8
end if
rs("shuiyin")=trim(request("shuiyin"))
rs("watermark")=trim(request("watermark"))
if trim(request("watermark"))<>"" then
set pp=new imgInfo 
w = pp.imgW(server.mappath(trim(request("watermark")))) 
h = pp.imgH(server.mappath(trim(request("watermark")))) 
set pp=nothing
rs("waterwidth")=w
rs("waterheight")=h
else
rs("waterwidth")=""
rs("waterheight")=""
end if
rs.update
	config = config & "<"&"%"
	config = config & vbcrLf & "Dim ft_webname,weburl,webfolder,webclose,webclosewhy,logo,icp,ft_title,ft_keywords,ft_description,tongji_open,news_page,shuiyin,watermark,waterwidth,waterheight"
	config = config & vbcrLf & "ft_webname="&""""&rs("ft_webname")&""""
	config = config & vbcrLf & "weburl="&""""&rs("weburl")&""""
	config = config & vbcrLf & "webfolder="&""""&rs("webfolder")&""""
	config = config & vbcrLf & "webclose="&""""&rs("webclose")&""""
	config = config & vbcrLf & "webclosewhy="&""""&rs("webclosewhy")&""""
	config = config & vbcrLf & "logo="&""""&rs("logo")&""""
	config = config & vbcrLf & "icp="&""""&rs("icp")&""""
	config = config & vbcrLf & "ft_title="&""""&rs("ft_title")&""""
	config = config & vbcrLf & "ft_keywords="&""""&rs("ft_keywords")&""""
	config = config & vbcrLf & "ft_description="&""""&rs("ft_description")&""""
	config = config & vbcrLf & "tongji_open="&""&rs("tongji_open")&""
	config = config & vbcrLf & "news_page="&""&rs("news_page")&""
	config = config & vbcrLf & "shuiyin="&""&rs("shuiyin")&""
	config = config & vbcrLf & "watermark="&""""&rs("watermark")&""""
	config = config & vbcrLf & "watermark2="&"""../"&rs("watermark")&""""
	config = config & vbcrLf & "waterwidth="&""&rs("waterwidth")&""
	config = config & vbcrLf & "waterheight="&""&rs("waterheight")&""
	config = config & vbcrLf & "%"&">"
    Call CreateFile(config,"../bybngadflgfr/config.asp")
Call Alert ("修改成功",""&filename&"")
rs.close
set rs=nothing
end sub
%>
<!--#include file="foot.asp"-->
</body>
</html>