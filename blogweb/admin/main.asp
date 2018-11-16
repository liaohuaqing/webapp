<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>FTCMS</title>
<!--#include file="check.asp"-->
<link href="css/pager.css" rel="stylesheet" type="text/css" />
<link href="pub/global.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
var popwin = window.parent.popwin;
</script>
<style>
	body{margin:10px;}
	h1{font-size:14px; color:#128CB2;height:40px;}
	#smalltab_container{height:27px;clear:both;}
	/**for all**/
	.row_0{border-bottom:1px dashed #cccccc;padding-bottom:10px;padding-top:10px;}
	.rowdiv_0{float:left;}
	.table_1{border-collapse:collapse;width:98%;}
	.td_0{font-weight:bold;color:#333333;height:24px;}
	.td_1{width:300px;border-bottom:1px dashed #cccccc;padding-bottom:10px;}
	.td_2{color:#666666;border-bottom:1px dashed #cccccc;line-height:150%;padding-bottom:10px;}
	.td_3{height:40px;}
	.td_4{border-bottom:1px dashed #cccccc;padding-bottom:10px;padding-top:10px;}
	/**for credits**/
	.td_4_1{width:50px;float:left;text-align:center;}
	.td_4_2{width:90px;float:left;}
	.td_4_3{width:100px;float:left;}
	.td_4_4{width:65px;float:left;}
	.td_4_5{width:65px;float:left;}
	.td_4_6{width:65px;float:left;}
	.td_4_7{width:65px;float:left;}
	.td_4_8{width:65px;float:left;}
	.td_4_9{width:65px;float:left;}
	.td_4_10{width:65px;float:left;}
	/**for forum**/
	.tr_5 td{height:32px;border-bottom:1px dashed #cccccc;}
	.td_5_1{width:400px;color:#666666;}
	.td_5_1 .forum_name{color:#333333; font-weight:bold; margin-right:10px;}
	.td_5_1 a{color:#FFFFFF;}
	.td_5_1 a:hover{color:#2C9618;text-decoration:none;}
	.td_5_1a{font-weight:bold; color:#2C9618;}
	.td_5_1 input{margin-top:4px;}
	.td_5_2{width:120px;}
	.td_5_3{width:100px;}
	/**for gourp**/
	.td_6{border-bottom:1px dashed #cccccc;padding-bottom:6px;padding-top:6px;padding-left:5px;}
	.td_6_1{width:150px;float:left;}
	.td_6_2{width:200px;float:left;}
	.td_6_3{width:80px;float:left;}
	.td_6_4{width:130px;float:left;}
	.td_6_5{width:150px;float:left; text-align:center;}
	.td_6_6{width:50px;float:left;}
	.forum_0{background:url('images/bg_forum.gif') 0px -18px;height:28px;width:38px;display:block;float:left;}
	.forum_1{background:url('images/bg_forum.gif') 0px 0px;background-position:left 0;height:28px;width:38px;display:block;float:left;}
	.forum_click1{background:url('images/bg_forum0.gif') 0px -12px; width:12px; height:12px; display:block;float:left;margin:5px 5px 0px 0px;}
	.tips_1{line-height:180%; background:#E2F4FC; padding:6px; }
	.tips_1 b{color:#128CB2;}
	.topic_title{font-size:12px; color:#1266C2;}
	.topic_title a{font-size:14px; color:#0C427E; font-weight:bold;}
	/*for topic*/
	.topicdo_left{width:120px;padding:5px;}
	.input_readonly{color:#999999; background:#DEDEDE; font-size:12px; font-family:verdana;}
	.input_errstyle{background:#F1676A; color:#FFFFFF;}
	.userpic{border:10px solid #dedede; margin:6px 6px 10px 0px;}
	.colorpicker{cursor:pointer;}
	/*for smtpsetting*/
	.divintd{padding-left:20px; }
	.divintd p{border-bottom:1px dashed #cccccc;padding-bottom:5px;}
	.divintd p span{font-weight:bold; color:#444444;}
</style>
</head>
<%if  session("ft_admin")<>"" then%>
<body>
	<div id="smalltab_container" style="display:none;"></div>
	<div class="smalltab_line" style="display:none;"></div>
	<div class="div_clear" style="display:none;height:10px;"></div>
	<div >你好，<font color="#fc0914"><%=session("ft_admin")%></font>，欢迎您使用 <font color="#fc0914"><%=ft_webname%></font> 网站后台管理！</div>
	<div class="tips_1"><b>服务器信息</b></div>
		<table width="99%" border="0" align="center" cellpadding="3" cellspacing="1" class="table_1">
<tr>
  <td width="20%" align="right" class="td_6">服务器名：</td>
  <td width="30%" class="td_6"><%=Request.ServerVariables("SERVER_NAME")%></td>
  <td width="20%" align="right" class="td_6">服务器IP：</td>
  <td width="30%" class="td_6"><%=Request.ServerVariables("LOCAL_ADDR")%> 端口：<%=Request.ServerVariables("SERVER_PORT")%></td>
</tr>
<tr>
<td align="right" class="td_6">本文件绝对路径：</td>
<td colspan="3" class="td_6"><%=server.mappath(Request.ServerVariables("SCRIPT_NAME"))%></td>
</tr>
<tr>
<td align="right" class="td_6">IIS版本：</td>
<td class="td_6"><%=Request.ServerVariables("SERVER_SOFTWARE")%></td>
<td align="right" class="td_6">服务器时间：</td>
<td class="td_6"><%=now%></td>
</tr>
<tr>
<td align="right" class="td_6">脚本解释引擎：</td>
<td class="td_6"><%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
<td align="right" class="td_6">脚本超时时间：</td>
<td class="td_6"><%=Server.ScriptTimeout%> 秒</td>
</tr>
<tr>
<td align="right" class="td_6">客户端IP：</td>
<td class="td_6"><%=Request.ServerVariables("REMOTE_ADDR")%></td>
<td align="right" class="td_6">MSXML2.XMLHTTP：</td>
<td class="td_6"><%If IsObjInstalled("MSXML2.XMLHTTP") Then%>
  <font color="#00CC00">支持√</font>
  <%else%>
  <font color="#FF0000">不支持×</font>
  <%end if%></td>
</tr>
<tr>
<td align="right" class="td_6">FSO组件：</td>
<td class="td_6">
<%If IsObjInstalled("Scripting.FileSystemObject") then%>   <font color="#00CC00">支持√</font>
<%else%>    <font color="#FF0000">不支持×</font>
<%end if%>  </td>
<td align="right" class="td_6">Jmail邮箱组件：</td>
<td class="td_6"><%If IsObjInstalled("JMail.Message") Then%>
Jmail4.3邮箱组件 <font color="#00CC00">支持√</font>
<%elseIf IsObjInstalled("JMail.SMTPMail") then%>
Jmail4.2邮箱组件 <font color="#00CC00">支持√</font>
<%else%>
<font color="#FF0000">不支持×</font>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from ft_site"
rs.open sql,conn,1,3
rs.update
rs("mail_jmail")=0
rs.update
rs.close
set rs=nothing
%>
<%end if%>  </td>
</tr>
<tr>
<td align="right" class="td_6">adodb.stream组件：</td>
<td class="td_6">
<%

on error resume next

dim objstream
set objstream = Server.CreateObject("adodb.stream")
objstream.Open

if err.number <> 0 then
err.Clear
%>
<font color="#FF0000">不支持×</font>
<%
else
%>    <font color="#00CC00">支持√</font>
<%
end if

%>  </td>
<td align="right" class="td_6">Aspjpeg组件：</td>
<td class="td_6">
<%
Set Jpeg = Server.CreateObject("Persits.Jpeg")
Response.Write "到期时间："&Jpeg.Expires

if -2147221005=Err  or Jpeg.Expires<now() then
%>
<font color="#FF0000">不支持×</font>
<%
set rs=server.CreateObject("adodb.recordset")
sql="select * from ft_site"
rs.open sql,conn,1,3
rs.update
rs("pic_aspjpeg")=0
rs("font_aspjpeg")=0
rs.update
rs.close
set rs=nothing
%>
<%
else
%>
<font color="#00CC00">支持√</font>
<%
end if
Set Jpeg = nothing
%>  </td>
</tr>
</table>
	<div id="t2"></div>
	<div id="t3"></div>
	<div class="div_clear" style="height:30px;"></div>
<%
else
%>
请登录后刷新网页！
<%
end if
%>
</body>
</html>
