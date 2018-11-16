<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<!--#include file="conn.asp"-->
<!--#include file="pub/md5.asp"-->
<title>网站后台登录</title>
<meta name="author" content="Web Design：victor QQ:691519757 E-mail:victor2008@foxmail.com Website:http://www.andasen.com" />
<link href="pub/global.css" rel="stylesheet" type="text/css" />
</head>

<body class="login_body">
<div class="login_div">
<%
dim action
action=trim(request("action"))
select case action
case "check"
call check()
case "out"
call out()
case else
call main()
end select
sub main()
%>
<script language="javascript">
function checklogin()
{
if(document.login.name.value=='')
{alert('请输入用户名！');
document.login.name.focus();
return false
}
if (document.login.password.value=='')
{alert('请输入密码！');
document.login.password.focus();
return false
}
if (document.login.code.value=='')
{alert('请输入验证码！');
document.login.code.focus();
return false
}
}
</script>
<table class="login0">
<form action="index.asp?action=check" method="post" name="login" id="login" onSubmit="return checklogin();">
<tr>
<td colspan="2" align="center"><font size="3">网站后台登录</font></td>
</tr>
<tr>
<td align="right" class="left">用户名：</td>
<td class="right">
<input name="name" type="text" id="name" class="text_css" size="20" maxlength="50" />
</td>
</tr>
<tr>
<td align="right" class="left">密码：</td>
<td class="right">
<input name="password" type="password" id="password" class="text_css" size="20" maxlength="50" />
</td>
</tr>
<tr>
<td align="right" class="left">验证码：</td>
<td class="right">
<input name="code" type="text" id="code" size="4" class="text_css" maxlength="4" />
<img src="../inc/code.asp?',Math.random()'" id="verImg" alt="点击刷新验证码" onclick="nchangeImg();" style=" cursor:pointer;">
<SCRIPT LANGUAGE="JavaScript">
<!--
function nchangeImg(){
var img = document.getElementById("verImg");
img.src = "../inc/code.asp?" + Math.random();
}
//-->
</SCRIPT>
</td>
</tr>
<tr align="center" >
<td colspan="2" class="a3">
<input type="submit" name="Submit" value="登录" class="submit_button" style="border:none;"/>
<input name="Reset" type="reset" id="Reset" value="重置" class="submit_button" style="border:none;"/>
</td>
</tr></form>
</table>
<%
end sub
sub check()
dim name,password,code,getcode
name=trim(request("name"))
password=trim(request("password"))
code=trim(request("code"))
getcode=trim(session("code"))

if name="" then
Call alert ("用户名不能为空!","-1")
end if

if name<>"" and instr(name,chr(39))>0 or instr(name,chr(34))>0 then
Call alert ("用户名非法!","-1")
end if

if password="" then
Call alert ("密码不能为空!","-1")
end if

if code="" then
Call alert ("验证码不能为空!","-1")
end if

if code<>"" and not isnumeric(code) then
Call alert ("验证码必须为数字!","-1")
end if

if code<>getcode then
Call alert ("验证码错误!","-1")
end if
set rs=server.createobject("adodb.recordset")
sql="select * from ft_admin where name='"&name&"' and password='"&md5(password)&"'"
rs.open sql,conn,0,1
if rs.eof then
Call alert ("您输入的用户名或密码有误!","-1")
rs.close
set rs=nothing
else
session("ft_admin")=rs("name")
session("power")=rs("power")
Call Alert ("登录成功!","home.asp")
end if
rs.close
set rs=nothing
end sub
sub out()
session("ft_admin")=""
session("power")=""
Call alert ("退出成功!","index.asp")
end sub
%></div>
<!--#include file="foot.asp"-->
</body>
</html>
