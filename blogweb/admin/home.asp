<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<base target="mainifm">
<title>后台管理</title>
<link href="pub/global.css" rel="stylesheet" type="text/css" />
<script src="util_tab_popwin.js" type="text/javascript"></script>
<style>
	#bigtab_container{height:39px;clear:both; overflow:hidden;}
	.top_1{height:64px;background:url('images/bg_1.gif') 0px -264px;}
	.top_2{height:33px;background:url('images/bg_1.gif') 0px -328px; color:#128CB2;}
	.top_1 .right{text-align:right; color:#f5f5f5; }
	.top_1 .right a:link, .top_1 .right a:hover, .top_1 .right a:visited, .top_1 .right a:active{color:#FFF;} 
	.left_1{width:168px;background:#E2F4FC; }
	.left_1 ul a{display:block;width:168px;height:24px;line-height:24px;color:#128CB2;background:url('images/ico_p1.gif') no-repeat; text-indent:30px;outline:none;}
	.left_1 ul a:hover{text-decoration:none;}
	.left_2{background-color:#FFFFFF;}
</style>
</head>
<body>
<table width="100%" height="100%" cellspacing="0" cellpadding="0" style="border-collapse:collapse;">
<tr>
	<td class="top_1" style="witdh:168px;"></td>
	<td class="top_1">
		<div class="div_clear" style="height:25px;"></div>
		<table cellspacing="0" cellpadding="0" style="border-collapse:collapse;" width="100%"><tr><td><div id="bigtab_container"></div></td><td class="right"><a href="../" target="_blank">前台</a> | <a href="index.asp?action=out" target="_top">退出</a>&nbsp; &nbsp;</td></tr></table>
	</td>
</tr>
<tr>
	<td class="top_2"></td>
	<td class="top_2"><img src="images/ico_home.gif" border="0" style="margin-right:5px;" /> <span id="position">首页 » 菜单</span></td>
</tr>
<tr>
	<td class="left_1" valign="top">
		<div class="div_clear" style="height:15px;"></div>
		<ul id="bbsmenu_1">
			<li id="bbsmenu_1_default"><a href="main.asp">系统信息</a></li>
		</ul>
		<ul id="bbsmenu_2">
			<li id="bbsmenu_2_default"><a href="ft_site.asp">系统设置</a></li>
		</ul>
        		<ul id="bbsmenu_3">
			<li id="bbsmenu_3_default"><a href="ft_news_class.asp">文章分类</a></li>
		</ul>
		<ul id="bbsmenu_5">
			<li id="bbsmenu_5_default"><a href="ft_news.asp">文章管理</a></li><li><a href="ft_news.asp?action=add">添加文章</a></li>
		</ul>
		<ul id="bbsmenu_6">
			<li id="bbsmenu_6_default"><a href="administrator.asp">管理员</a></li>
		</ul>
		<ul id="bbsmenu_9">
			<li id="bbsmenu_9_default"><a href="ft_link.asp">友情连接</a></li>
		</ul>
	</td>
	<td valign="top" height="100%">
		<iframe width="100%" height="100%" frameborder="0" name="mainifm" id="mainifm" src="main.asp"></iframe>
	</td>
</tr>
</table>


<script>
var menuNowTab;
var pt = new Tabs();
pt.classpre="bigtab_";
pt.container = "bigtab_container";
pt.createTab("bbsmenu_1","首页","",true,"n");
pt.createTab("bbsmenu_2","系统设置","",false,"n");
pt.createTab("bbsmenu_3","文章分类","",false,"n");
pt.createTab("bbsmenu_5","文章管理","",false,"n");
pt.createTab("bbsmenu_6","管理员","",false,"n");
pt.createTab("bbsmenu_9","插件","",false,"n");
pt.init = function(){
	menuNowTab = pt.nowTab;
};
pt.onclick = function(){
	menuNowTab = pt.nowTab;
	E("position").innerHTML = E("Title_"+menuNowTab).innerHTML;
	clickMenuObj(E(pt.nowTab+"_default"));
	mainifm.location.href = E(pt.nowTab+"_default").children[0].href;
};		
pt.initTab();
pt.clickNowTab();


var liObjs =document.getElementsByTagName('li');
var curObj;
for(var i=0; i<liObjs.length; i++)
{
	//if(liObjs[i].getAttribute("name") == targetDivName)
	{
		(
			function (obj)
			{
				try{
					obj.children[0].hideFocus = "true";
				}catch(err){
				}
				obj.onmouseover = function(){
					obj.className="left_2";
				}
				obj.onmouseout = function(){
					if(curObj!=obj){
						obj.className="";
					}
				}
				obj.onclick = function(){
					clickMenuObj(obj);
				}
			}
		)(liObjs[i]);
		
	}
}

function clickMenuObj(obj){
	if(curObj){
		curObj.className="";
	}
	obj.className="left_2";
	curObj=obj;
	E("position").innerHTML = E("Title_"+menuNowTab).innerHTML;
	if(curObj){
		E("position").innerHTML += " » "+curObj.children[0].innerHTML;
	}
}

</script>
</body>
</html>
