function E(elementid)
{  
	var obj;
	try
	{
		obj = document.getElementById(elementid);
	}
	catch (err)
	{
		alert(elementid+" NOT Found!","System");
	}
	return obj;
}
function getE(elementid){
	return E(elementid);
}
function setDisplays(es,s){
	for(var n=0;n<es.length;n++){
		if(E(es[n])){
			E(es[n]).style.display = ((s[n])?"":"none");
		}
	}
}
function setDisplay(e,s){
	if(E(e)){
		E(e).style.display = (s?"":"none");
	}
}

function getV(oid){
	try{
		var v = E(oid).value;
		if(v==null){
			return "";
		}
		return v;
	}catch(err){
		return "";
	}
}

function trim(str){
	return str.replace(/(^\s*)|(\s*$)/g, "");
}

function getTimer(){
	return (new Date()).getTime();
}

function getRadioValue(rName)
{
	var rObj = document.getElementsByName(rName);
	for ( var i=0; i<rObj.length; i++ )
	{
		if ( rObj[i].checked )
		{
			return rObj[i].value;
		}
	}
	return null;
}

function setRadioValue(rName , val)
{
	var rObj = document.getElementsByName(rName);
	for ( var i=0; i<rObj.length; i++ )
	{
			rObj[i].checked = rObj[i].value == val;
	}
	return null;
}

function setRadioCheck(rName , val)
{
	setRadioValue(rName , val);
}


function setSelect(eid,evalue)
{
	var sObj = E(eid);
	if(!sObj){
		return;
	}
	for ( var i=0; i<sObj.length; i++ )
	{
		if ( sObj[i].value==evalue )
		{
			sObj[i].selected = true;
		}
	}
}

function setSelectList(objid, arrayvar, arrvalue)
{
	var objlen = E(objid).options.length;
	if ( arrvalue==null )
	{
		arrvalue = new Array();
		for ( var j=0; j<arrayvar.length; j++ )
		{
			arrvalue[j] = j+1;
		}
	}	
	
	for ( var i=0+objlen,x=0; i<arrayvar.length+objlen; i++,x++ )
	{
		//option begin at 0
		
		if(arrayvar[x]=="")
		{
			i--;
			objlen--;
		}
		else
		{
			E(objid).options[i] = new Option(arrayvar[x],arrvalue[x]); //value begin at 1
		}
	}
}


function removeAllOptions(objid)
{
	var obj = E(objid);
	var browsernum = checkBrowser();
	if ( browsernum==2 || browsernum == 3) //firefox and google
	{
		obj.length = 0;
	}
	else
	{
		try
		{
			while(obj.options[0] != null)
			{
				obj.options.removeChild(obj.options[0]);  
			}
		}
		catch(err)
		{
		}
	}
}

	function checkBrowser()
	{		
		if ( navigator.userAgent.indexOf("MSIE")>0 )
			return 1;
		if ( isFirefox=navigator.userAgent.indexOf("Firefox")>0 )
			return 2;
		if ( isSafari=navigator.userAgent.indexOf("Safari")>0 ) //google
			return 3;
		if ( isCamino=navigator.userAgent.indexOf("Camino")>0 )
			return 4;
		if ( isMozilla=navigator.userAgent.indexOf("Gecko/")>0)
			return 5;
		return 0;
	}
	
	RegExp.escape = function(text) {
	  if (!arguments.callee.sRE) {
	    var specials = [
	      '/', '.', '*', '+', '?', '|',
	      '(', ')', '[', ']', '{', '}', '\\'
	    ];
	    arguments.callee.sRE = new RegExp(
	      '(\\' + specials.join('|\\') + ')', 'g'
	    );
	  }
	  return text.replace(arguments.callee.sRE, '\\$1');
	}
	
	function urlEncode(str){
		return encodeURIComponent(str);
	}
	
	function debugObj(obj) { 
	   var props = ""; 
	    for(var p in obj){  
	       if(typeof(obj[p])=="function"){  
	           obj[p](); 
	       }else{  
	           props+= p + "=" + obj[p] + "\t"; 
	       }  
	   }  
	  alert(props); 
	} 
	
	function onRun(fun, run_stop_cond, stop_cond){
		var timeout=30000;
		var timeper = 250;
		var timecounter=0;
		var t=window.setInterval(
			function(){
				//E("debugstr").innerHTML+=".";
				timecounter+=timeper;
				if(stop_cond()||timecounter>timeout){
					window.clearInterval(t);
					return;
				}
				if(run_stop_cond()){
					window.clearInterval(t);
					fun();
					return;
				}
			}
			,timeper
		);
	}
	
	function reloadVerify(imgid){
		E(imgid).src="code.php?t="+getTimer();
	}
	
	
	//得到字符长度，英文1，中文2
	function getLength(input)
	{
		var i,cnt = 0;
		var temp = input;
		for ( i=0; i<temp.length; i++ )
		{
			if ( escape(temp.charAt(i)).length>=4 )
			{
				cnt+=2;
			}
			else
			{
				cnt++;
			}
		}
		return cnt;
	}
	
	function isSucceed(calldata){
		return (calldata.substring(0,3)=='_Y_');
	}

////////////////////////////
////Tabs
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function Tabs()
	{
		this.nowTab = "";
		this.needSelect = true;
		this.tabidsAry = new Array();
		this.tabvalsAry = new Array();
		this.classpre = "tab_";
		this.container;
		this.defaultTab = "";
		this.createTab = function (id,title,value,type)
		{
			var _type = 0;
			
			if(type)
				_type = 1;
			
			if(value == null)
				value = "";
							
			this.tabidsAry.push(id);	
			this.tabvalsAry.push(value);
			
			var nid="tab_"+id;
			var rstr="<div id="+nid+" class=\""+this.classpre+_type+"_all\"><input type='hidden' id='Val_"+id+"' value='"+value+"' /><div id="+id+"_1 class=\""+this.classpre+_type+"_left\"></div><div id="+id+"_2 class=\""+this.classpre+_type+"_center\"><span id='Title_"+id+"' >"+title+"</span></div><div id="+id+"_3 class=\""+this.classpre+_type+"_right\"></div></div>";
			if(this.container==undefined){
				document.write(rstr);
			}else{
				document.getElementById(this.container).innerHTML += rstr;
			}

			
			
			if(type)
			{
				this.nowTab=id;
			}
		}
		this.initTab = function ()
		{
			for(var i=0;i<this.tabidsAry.length;i++)
			{
				(
					function(tab  ,id )
					{
						var nid="tab_"+id;
						document.getElementById(nid).onclick = function ()
						{
							tab.clickTab(id);
							tab.changeTab();
						}
					}
				)
				(this , this.tabidsAry[i]);
			}
			
			if(this.defaultTab != "")
			{
				var nid = this.getIdByValue(this.defaultTab);
				this.changeTabCss(nid);
				this.nowTab = nid;
				this.changeTab();
			}
			
			this.init();
		}
		
		this.getIdByValue = function (val)
		{
			for(var i=0;i<this.tabvalsAry.length;i++)
			{
				if(this.tabvalsAry[i] == val)
				{
					return this.tabidsAry[i];
				}
			}
			
			return "";
		}
		
		this.getValue = function ()
		{
			try
			{
				return document.getElementById("Val_"+this.nowTab).value;
			}
			catch(err)
			{
				return "";
			}
		}
		this.setValue = function (id,value)
		{
			try
			{
				document.getElementById("Val_"+this.nowTab).value = value;
			}
			catch(err)
			{}
		}
		this.setTitle = function (id,title)
		{
			try
			{
				document.getElementById("Title_"+id).innerHTML = title;
			}
			catch(err)
			{}
		}
		this.clickNowTab = function ()
		{
			this.click(this.nowTab);
		}
		this.click = function (id)
		{
			this.clickTab(id);
			this.changeTab();
		}
		this.changeTabCss = function (id)
		{
			if(this.nowTab != id)
			{
				try
				{
					document.getElementById(this.nowTab+"_1").className= this.classpre+"0_left"; //'tab_1_1_'+this.styleID;
					document.getElementById(this.nowTab+"_2").className= this.classpre+"0_center"; //'tab_1_2_'+this.styleID;
					document.getElementById(this.nowTab+"_3").className= this.classpre+"0_right"; //'tab_1_3_'+this.styleID;
				}catch(err)
				{}
				
				document.getElementById(id+"_1").className= this.classpre+"1_left";
				document.getElementById(id+"_2").className= this.classpre+"1_center";
				document.getElementById(id+"_3").className= this.classpre+"1_right";
			}
			else
			{
				/*
				if(!this.needSelect)
				{
					var selectVal = 1;
					if(document.getElementById(this.nowTab+"_1").className == 'tab_1_1_'+this.styleID) 
					{
						selectVal = 2; // change to selecting
					}
					
					try
					{
						document.getElementById(this.nowTab+"_1").className='tab_'+selectVal+'_1_'+this.styleID;
						document.getElementById(this.nowTab+"_2").className='tab_'+selectVal+'_2_'+this.styleID;
						document.getElementById(this.nowTab+"_3").className='tab_'+selectVal+'_3_'+this.styleID;
					}catch(err)
					{}
				
				}
				*/
			}
		}
		this.clickTab = function (id)
		{
			this.changeTabCss(id);
			this.nowTab = id ;
			this.onclick();
		}
		this.changeTab = function ()
		{
			for(var i=0;i<this.tabidsAry.length;i++)
			{
				try
				{
					document.getElementById(this.tabidsAry[i]).style.display = this.tabidsAry[i] != this.nowTab ? "none" : "";
				}
				catch(err)
				{}
			}
		}
		
		this.init = function (){} // please override
		this.onclick = function (){} // please override
		
	}

//------------------------------------------Tabs ------------------------------------------//
	
//弹出窗口类popwin
function E(elementid)
{
	var obj;
	try
	{
		obj = document.getElementById(elementid);
	}
	catch (err)
	{
		alert(elementid+" NOT Found!");
	}
	return obj;
}

function setDisplays(es,s){
	for(var n=0;n<es.length;n++){
		if(E(es[n])){
			E(es[n]).style.display = ((s[n])?"":"none");
		}
	}
}
function setDisplay(e,s){
	if(E(e)){
		E(e).style.display = (s?"":"none");
	}
}

function POPUP(){
	var _t=this;
	_t.ID="popwin";
	_t.X=0;
	_t.Y=0;
	_t.W = 300 ;	_t.H = 200 ;	//Default Size
	_t.fixX = 0;	_t.fixY = 20;	//Fix position
	_t.mX = 0;		_t.mY = 0;		//Mouse Position
	_t.title ;
	_t.url ;
	_t.html ;
	_t.zindex =50000;
	_t.isShow = false;
	_t.showNum = 0;
	_t.ifrBlank = "about:blank";
	_t.closeEvent = "";

	_t.setSize = function(w,h,v){
		if(v==false)
		{
			setDisplays([_t.ID,_t.ID+"_html",_t.ID+"_loading",_t.ID+"_iframe"],[false,false,true,false]);
		}
		_t.W =w;
		_t.H =h;
		var elemSize = [
			{ID:_t.ID,w:_t.W,h:_t.H},
			{ID:_t.ID+"_main",w:(_t.W),h:20},
			{ID:_t.ID+"_title",w:(_t.W-26),h:20},
			{ID:_t.ID+"_content",w:(_t.W-26),h:(_t.H-46)},
			{ID:_t.ID+"_html",w:(_t.W-26),h:(_t.H-20)},
			{ID:_t.ID+"_loading",w:(_t.W-26),h:(_t.H-20)},
			{ID:_t.ID+"_iframe",w:(_t.W-26),h:(_t.H-46)},
			{ID:_t.ID+"_ifr",w:(_t.W-26),h:(_t.H-46)}
		]
		var curE;
		for(var n=0;n<elemSize.length;n++){
			curE=elemSize[n];
			if(E(curE.ID)){
				if(curE.w !=undefined)E(curE.ID).style.width = curE.w +"px";
				if(curE.h !=undefined)E(curE.ID).style.height = curE.h +"px";
			}
		}
	}

	_t.Init = function(){

		if(!E(_t.ID+"_out")){
			document.write("<div id=\""+_t.ID+"_out\" style=\"width:0px;height:0px;overflow:hidden;\">"+_t.ID+"_out</div>");
		}
		else{
			E(_t.ID+"_out").innerHTML = "";
		}
		_t.createDiv();
		_t.setSize(_t.W,_t.H);
		window.onresize = function () { popwin.refreshCover(); };
	}

	_t.createDiv = function(){
		var s="";
			s+="<div id='"+_t.ID+"coverDiv' class='coverDiv' style='display:none; z-index:" +_t.zindex+ ";' >";
				s+="<iframe id='"+_t.ID+"coverFrame' class='coverFrame' border='0' frameborder='0' src='"+_t.ifrBlank+"'></iframe>";
			s+="</div>";
			s+=("<div id=\""+_t.ID+"_ajaxloading\" class=\"snapdiv_loading\" style=\"position:absolute;display:none;z-index:500;\"><\/div>");
			s+=("<div style=\"position:absolute;left:0px;top:0px;display:none;z-index:"+_t.zindex+5+";\" id=\""+_t.ID+"\">");
			s+=("	<div style=\"\" id=\""+_t.ID+"_main\" class=\"snapdiv_title_div\"><div style=\"float:left;\" id=\""+_t.ID+"_title\" class=\"snapdiv_title\">&nbsp;<\/div><div class=\"snapdiv_button_close\" onclick=\"popwin.close()\"></div><\/div>	");
				s+=("	<div id=\""+_t.ID+"_content\" class=\"snapdiv_content\">");
				s+=("		<div id=\""+_t.ID+"_loading\" class=\"snapdiv_loading\"><\/div>");
				s+=("		<div id=\""+_t.ID+"_html\" style=\"display:none;\"><\/div>");
				s+=("		<div id=\""+_t.ID+"_iframe\" style=\"display:none;\"><iframe src=\""+_t.ifrBlank+"\" onreadystatechange=\"popwin.IFrameStateChangeIE(this)\" onload=\"popwin.IFrameStateChangeFF(this)\" style=\"border:0px;width:"+(_t.W-20)+"px;height:"+(_t.H-46)+"px\" marginwidth=\"1\" marginheight=\"1\" name=\""+_t.ID+"_ifr\" id=\""+_t.ID+"_ifr\"  frameborder=\"0\" scrolling=\"auto\"><\/iframe></div>");
				s+=("	<\/div>");
			s+=("<\/div>");
			E(_t.ID+"_out").innerHTML =s;
	}

	//Interface:showURL
	_t.showURL	= function(title,url,w,h,cevt){
		_t.show(title,url,null,w,h,cevt);
	}

	//Interface:showHTML
	_t.showHTML	= function(title,html,w,h,cevt){
		_t.show(title,null,html,w,h,cevt);
	}

	//Interface:showDialog
	_t.showDialog = function(icon,title,html,btns, w,h,cevt){
		var btstr="";
		var iconclass=["dialog_ico_err","dialog_ico_yes","dialog_ico_info","dialog_ico_ask","dialog_ico_stop"][icon];

		for(var i=0;i<btns.length;i++){
			var focusstr="";
			if(btns[i].focus){
				focusstr ="id=\"focus_button\"";
			}
			btstr+="<input type=\"button\" value=\""+btns[i].value+"\" onclick=\""+btns[i].onclick+"\" "+focusstr+" \/>";
		}

		var s="<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" class=\"dialog_table\"><tr><td class=\"dialog_table_td\"><div class=\""+iconclass+"\"></div></td><td class=\"dialog_content\">"+html+"</td></tr></table>";
		s+="<div class=\"dialog_button\">"+btstr+"</div>";

		_t.show(title,null,s,w,h,cevt);

		//按钮焦点
		if(E("focus_button")){
			E("focus_button").focus();
		}
	}


	_t.show = function(title,url,html,w,h,cevt){
		if(w&&h){
			_t.setSize(w,h,false);
		}

		_t.showNum ++;
		_t.closeEvent = cevt;
		_t.title = title;
		_t.url = url;
		_t.html = html;

		_t.showDiv();
	}

	_t.showDiv = function(){
		_t.isShow = true;
		_t.refreshCover();
		_t.X = document.documentElement.scrollLeft;
		_t.Y = document.documentElement.scrollTop;

		var winW = document.documentElement.clientWidth;
		var winH = document.documentElement.clientHeight;

		_t.X += (winW - _t.W)/2;
		_t.Y += (winH - _t.H)/2;


		E(_t.ID).style.width = _t.W+"px";
		E(_t.ID).style.height = _t.H+"px";
		E(_t.ID).style.left = _t.X+"px";
		E(_t.ID).style.top = _t.Y+"px";
		E(_t.ID).style.display = "";

		E(_t.ID+"_title").innerHTML = _t.title;
		if(_t.html != null){
			setDisplays([_t.ID+"coverDiv",_t.ID+"_loading",_t.ID+"_iframe",_t.ID+"_ifr",_t.ID+"_html"],[true,false,false,false,true]);
			//E(_t.ID+"_ifr").src =_t.ifrBlank;
			//E(_t.ID+"_iframe").innerHTML ="";
			E(_t.ID+"_html").innerHTML = _t.html;
		}
		else if(_t.url != null){
			setDisplays([_t.ID+"coverDiv",_t.ID+"_loading",_t.ID+"_iframe",_t.ID+"_ifr",_t.ID+"_html"],[true,true,false,true,false]);
			E(_t.ID+"_html").innerHTML = "";
			E(_t.ID+"_ifr").src =_t.url;
			//E(_t.ID+"_iframe").innerHTML = "<iframe src=\""+_t.url+"\" onreadystatechange=\"popwin.IFrameStateChangeIE(this)\" onload=\"popwin.IFrameStateChangeFF(this)\" style=\"border:0px;width:"+(_t.W-20)+"px;height:"+(_t.H-46)+"px\" marginwidth=\"1\" marginheight=\"1\" name=\""+_t.ID+"_ifr\" id=\""+_t.ID+"_ifr\"  frameborder=\"0\" scrolling=\"auto\"><\/iframe>";

		}
	}

	_t.IFrameStateChangeIE = function(obj){
		if (obj.readyState=="interactive")		//state: loading ,interactive,   complete
		{
			setDisplays([_t.ID+"_loading",_t.ID+"_iframe"],[false,true]);
		}
	}

	_t.IFrameStateChangeFF = function(obj){
		setDisplays([_t.ID+"_loading",_t.ID+"_iframe"],[false,true]);
	}

	//Interface: close
	_t.close = function(){
		if(_t.closeEvent){
			eval(_t.closeEvent);
		}
		setDisplays([_t.ID+"coverDiv",_t.ID,_t.ID+"_html",_t.ID+"_loading",_t.ID+"_iframe"],[false,false,false,true,false]);
		E(_t.ID+"_html").innerHTML = "";
		E(_t.ID+"_title").innerHTML = "";
		//E(_t.ID+"_iframe").innerHTML ="";
		E(_t.ID+"_ifr").src = _t.ifrBlank;
		_t.isShow = false;
	}
	
	//Interface: loading
	_t.loading = function(){
		_t.isShow = true;
		_t.refreshCover();
		_t.X = document.documentElement.scrollLeft;
		_t.Y = document.documentElement.scrollTop;

		var winW = document.documentElement.clientWidth;
		var winH = document.documentElement.clientHeight;

		_t.X += (winW - 32)/2;
		_t.Y += (winH - 32)/2;

		E(_t.ID+"_ajaxloading").style.left = _t.X+"px";
		E(_t.ID+"_ajaxloading").style.top = _t.Y+"px";

		setDisplays([_t.ID+"coverDiv",_t.ID+"_ajaxloading"],[true,true]);

	}

	//Interface: loaded
	_t.loaded = function(){
		setDisplays([_t.ID+"coverDiv",_t.ID+"_ajaxloading"],[false,false]);
	}

	_t.refreshCover = function(){
		if(!_t.isShow)return;
		var nowHeight=_t.getBodyObj().scrollHeight;
		E(_t.ID+"coverDiv").style.height=(nowHeight*1)+"px";
		E(_t.ID+"coverFrame").style.height=(nowHeight*1)+"px";

		var nowWidth=_t.getBodyObj().scrollWidth;

		E(_t.ID+"coverDiv").style.width=(nowWidth*1)+"px";
		E(_t.ID+"coverFrame").style.width=(nowWidth*1)+"px";
	}

	_t.getBodyObj = function()
	{
		return (document.documentElement) ? document.documentElement : document.body;
	}

}

var popwin=new POPUP();
popwin.Init();

