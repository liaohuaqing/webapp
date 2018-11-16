<%
dim sitename
sitename="My SQL"
Function Mydb(MySqlstr,MyDBType)
	Select Case MyDBType
	Case 0 : Conn.Execute(MySqlstr) : Dataquery = Dataquery + 1
	Case 1 : Set Mydb = Conn.Execute(MySqlstr) : Dataquery = Dataquery + 1
	Case 2 : Set Mydb = Server.CreateObject("Adodb.Recordset") : Mydb.Open MySqlstr,Conn,1,1 : Dataquery = Dataquery + 1
	case 3:
		set db = server.createobject("Adodb.Recordset")
		db.open sqlstr, conn, 1, 3
	End Select
End Function
%>
<%
Function alert(message,gourl)
message = replace(message,"'","\'")
If gourl="-1" then
Response.Write ("<script language=javascript>alert('" & message & "');history.go(-1)</script>")
ElseIf gourl="-2" then
Response.Write ("<script language=javascript>alert('" & message & "');history.go(-2)</script>")
ElseIf gourl="Close" then
Response.Write ("<script language=javascript>alert('" & message & "');window.opener=null;window.close();</script>")
Else
Response.Write ("<script language=javascript>alert('" & message & "');location='" & gourl &"'</script>")
End If
Response.End()
End Function
%>
<%
function checkreal(v)
dim w
if not isnull(v) then
w=replace(v,",","|")
w=replace(w," ","")
checkreal=w
end if
end function
%>
<%
Const sFileExt="jpg|gif|bmp|png"
Function ReplaceRemoteUrl(sHTML, sSaveFilePath, sFileExt)
     Dim s_Content
     s_Content = sHTML
     If IsObjInstalled("Microsof" & "t.X" & "MLHTTP") = False then
         ReplaceRemoteUrl = s_Content
         Exit Function
     End If
     
     Dim re, RemoteFile, RemoteFileurl,SaveFileName,SaveFileType,arrSaveFileNameS,arrSaveFileName,sSaveFilePaths
     Set re = new RegExp
     re.IgnoreCase = True
     re.Global = True
     re.Pattern = "((http|https|ftp|rtsp|mms):(\/\/|\\\\){1}((\w)+[.]){1,}(net|com|cn|org|cc|tv|[0-9]{1,3})(\S*\/)((\S)+[.]{1}(" & sFileExt & ")))"
     Set RemoteFile = re.Execute(s_Content)
     For Each RemoteFileurl in RemoteFile
		 arrSaveFileName = Split(RemoteFileurl,".")
  		 SaveFileType=arrSaveFileName(UBound(arrSaveFileName))
		 RanNum=Int(900*Rnd)+100
         arrSaveFileName = Year(Now()) & Right("0" & Month(Now()),2)&  Right("0" & Day(Now()),2) & Right("0" & Hour(Now()),2) & Right("0" & Minute(Now()),2) & Right("0" & Second(Now()),2) &ranNum&"."&SaveFileType
  sSaveFilePaths= sSaveFilePath'淇濆瓨璺緞
         SaveFileName = sSaveFilePaths & arrSaveFileName
		 
		 if SaveRemoteFile(""&SaveFileName&"",""&RemoteFileurl&"") then 
response.Write ""&SaveFileName&" 鍥剧墖淇濆瓨鎴愬姛. <br />"

s_Content = Replace(s_Content,RemoteFileurl,SaveFileName)
else 
Response.write ""&RemoteFileurl&" 鍥剧墖淇濆瓨<font color='#FF0000'>澶辫触</font>.<br />" 
end if

if shuiyin=1 and watermark<>"" then
Dim RV_img2 
RV_img2=SaveFileName
Set Photo = Server.CreateObject("Persits.Jpeg") 
PhotoPath = Server.MapPath(RV_img2) 
Photo.Open PhotoPath 
Photo.Interpolation=1 
Photo.Quality=100 
iWidth=Photo.OriginalWidth 
iHeight=Photo.OriginalHeight 
iiwidth=waterwidth
iiheight=waterheight
Photo.Canvas.DrawPNG iWidth-iiWidth-15, iHeight-iiHeight-15,Server.MapPath(watermark)
Photo.save Server.mappath(RV_img2)
Set Photo = Nothing
end if

     Next
     ReplaceRemoteUrl = s_Content
End Function
function SaveRemoteFile(s_LocalFileName,s_RemoteFileUrl)
     Dim Ads, Retrieval, GetRemoteData
     On Error Resume Next
     Set Retrieval = Server.CreateObject("Microso" & "ft.XM" & "LHTTP")
     With Retrieval
         .Open "Get", s_RemoteFileUrl, False, "", ""
         .Send
         GetRemoteData = .ResponseBody
     End With
     Set Retrieval = Nothing
     Set Ads = Server.CreateObject("Ado" & "db.Str" & "eam") 
     With Ads
         .Type = 1
         .Open
         .Write GetRemoteData
         .SaveToFile Server.MapPath(s_LocalFileName), 2
         .Cancel()
         .Close()
     End With
     Set Ads=nothing
	 if err <> 0 then 
SaveRemoteFile = false 
err.clear 
else 
SaveRemoteFile = true 
end if

End Function
%>

<%
Function file_rename(oldname,newname)
set fso=Server.CreateObject("scripting.filesystemobject")
oldname=Server.mappath(oldname)
newname=Server.mappath(newname)
fso.movefile oldname,newname
Set fso=Nothing
End Function
%>

<%
Function file_delete(filename)
set Fs=server.CreateObject("Scripting.FileSystemObject")
if filename<>"" then
If Fs.FileExists(server.mappath(filename)) Then
Set Os = Fs.GetFile(server.mappath(filename))
Os.Delete
end if
if err.Number<>0 then
err.clear
response.write "鍒犻櫎鏂囦欢澶辫触!"
end if
end if
End Function
%>
<%
Function IsObjInstalled(s_ClassString)
     On Error Resume Next
     IsObjInstalled = False
     Err = 0
     Dim xTestObj
     Set xTestObj = Server.CreateObject(s_ClassString)
     If 0 = Err Then IsObjInstalled = True
     Set xTestObj = Nothing
     Err = 0
End Function
%>
<%
  Function get_filename(filename) 
  if filename<>"" then
  filename=replace(filename,right(filename,4),"")
  get_filename=Mid(filename,InStrRev(filename,"/")+1)  
  end if
End Function 
%>
<%
  Function get_pic(filename,mulu) 
  if filename<>"" and mulu=3  then
  get_pic=replace(replace(filename,"big","small"),"../","")
  else if filename<>"" and mulu=2  then
  get_pic=replace(filename,"big","small")
  else if filename<>"" and mulu=1  then
  get_pic=replace(filename,"../","")
  end if
  end if
  end if
End Function 
%>
<%  
Function MoveHtml(strHTML)    '过滤HTML代码的函数包括过滤CSS和JS  
  
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
  
MoveHtml=strHTML   
Set objRegExp = Nothing   
End Function  
  
%>  
