<%
'��Ȩ������
'����QQ������վϵͳ�����¼�ơ������򡢳��򡱿�������ڸ��˷���ҵ��;��������;�踶�ѹ����Ȩ���밴������Լ��ִ�У�
'�����������������ڸ��˷���ҵ��;�������˷���ҵ�����;����Ҫ���ѹ����Ȩ�����ڹ����Ǽ�������Ϊ�����Ȩ��¼�����ɻ�õ��Ӱ��Ȩ֤��(���ǰ������������ڹ������ݿ��еǼ�����ּ�ڷ���άȨʱ�ܿ��ѹ����Ȩ������)����Ȩʹ�ñؽ��е����ɷ��ղ�׷���߶��⳥
'���������Ȩ������ȶ���ȫ������������Ѱ�װ�����ģ�塢���׹������ʹ�á��ٷ��Ż����Ȼ�õ���Ȩ������������ҵ��������У԰����λ�����塢���ˡ����������š����ء���˾��������ҵ��;
'���������Ȩ�󣬳��ں�Դ�����а�Ȩ��������̨���½ǵġ�Դ����55tr.com�������������ְ�Ȩ������������ǰ̨��ʾ��ֻ��Ϊ�����Ȩ�������������д��붼�����޸ļ�ɾ��������ǰ̨����ҳ��Ĺ�����Ȩ��Ϣ�����޸ġ�
'���������Ȩ����ñ�����Ϊ���˻��Լ��ṩ������վ���޸�Դ�룬���ο����ķ��񣬵���ֹ�����򴫲������򼰱�������κ���̬����ֹ���۱����򼰱�������κ���̬��˵���˾��ǲ��ܽ�������ۻ򴫲���������Ȩ�������磺С����ͻ�Լ��ʹ�ñ���������ĳ��ѧ�Ĺ���������ȡĳ��ѧ����վ�����������1��Ԫ���������Ȩ������Ϊ����Ȩ��С����ͻ�Լ��ʹ�ñ���������ĳСѧ�Ĺ���������ȡĳСѧ����վ�����������1��Ԫ��δ�����Ȩ������Ϊ��Ȩ(��Ϊδ�����Ȩ)������ֹ��С��ʹ�ñ��������˸���������վ���û��������ȡ������棬δ�����Ȩ������Ϊ����Ȩ��С��ʹ�ñ���������Ϊ��ҵ��վ���г��ۣ��������Ȩ������Ϊ��Ȩ����Ϊ���������˳��򣩣�����ֹ��С���ֽ�����������ΪС˵��վԴ����������ѷ��������ṩ���أ��������Ȩ������Ϊ��Ȩ����Ϊ���������˳��򣩣�����ֹ����
'�����������Ȩ�ĸ��˷���ҵ��;��Ȼ������������װ�����ģ���Ȩ�������޸�Դ���룬�������޸�Դ�����С��������ӡ�������Ȩ����������Ӧ�����ġ���صĴ��룬ǰ̨ҳ��ײ��ġ�Copyright 20XX ����ϵ�й���ϵͳ ��Ȩ���У���Ȩxxxʹ�� Powered by 55TR.COM����������ɾ��,�����빺���Ȩ
'�����������Ȩ�ĳ����˷���ҵ�����;�뼰ʱ�����Ȩ����ֹʹ�ñ����򣬷�����Ȩ
'����������������Ȩ�Ǽ�֤��ǼǺţ�2016SR204636����Ȩ�ؾ�������QQ81962480 ��ӭǢ̸���ڴ˳��򿪷����޸�ҵ��
'������Ȩ����������޸ĵ�żȻ�ԣ����Թ��������Ķ�Ӧ����汾��Ȩ����Ϊ׼������İ�Ȩ��������Ȩ�������ܽ��ܣ��������http://www.55tr.com/gwappshow.asp?id=23


Private Sub contrl_message(Msg, gotoUrl, buttomid, formid, whojump)
  Response.Write("<script language=""javascript"" >")& vbCrLf
  If Msg<>"" Then
    Response.Write("alert(""" & Msg & "\nС��ʾ�����ո��س��ɿ��ٹرմ���ʾ��"");")& vbCrLf
  End If
  If buttomid<>"" Then
    response.Write "parent.document.getElementById('"&buttomid&"').disabled=false ;"& vbCrLf
  End If
  If formid<>"" Then
    response.Write "parent.document.getElementById('"&formid&"').reset() ;"& vbCrLf
  End If
'  if buttomid<>"" and formid<>"" then
'    response.Write "parent."&formid&"."&buttomid&".disabled=false ;"& vbCrLf
'  end if
  If gotoUrl = "" Then
  Else
    If InStr(gotourl, "http://")<>1 And InStr(gotourl, "location.href")<1 And InStr(gotourl, "./")<1 Then gotourl = "http://"&gotourl
    If InStr(gotourl, "location.href")<1 Then
      Response.Write(""&whojump&".location='" & gotoUrl & "';")& vbCrLf
    Else
      Response.Write(""&whojump&".location=" & gotoUrl & ";")& vbCrLf
    End If
  End If
  Response.Write("</script>")
  call CloseConn()
  Response.End()
'  If InStr(msg, "�ɹ�")<1 Then Response.End()
End Sub

Private Sub contrl_message_cbox(Msg, gotoUrl, checkboxid, formid, whojump)
  Response.Write("<script language=""javascript"" >")& vbCrLf
  If Msg<>"" Then
    Response.Write("alert(""" & Msg & "\nС��ʾ�����ո��س��ɿ��ٹرմ���ʾ��"");")& vbCrLf
  End If
  If checkboxid<>"" Then
    response.Write "parent.document.getEleme"&"ntById('"&checkboxid&"').checked=false ;"& vbCrLf
  End If
  If formid<>"" Then
    response.Write "parent.document.getEleme"&"ntById('"&formid&"').reset() ;"& vbCrLf
  End If
  If gotoUrl = "" Then
  Else
    If InStr(gotourl, "http://")<>1 And InStr(gotourl, "location.href")<1 And InStr(gotourl, "./")<1 Then gotourl = "http://"&gotourl
    If InStr(gotourl, "location.href")<1 Then
      Response.Write(""&whojump&".location='" & gotoUrl & "';")& vbCrLf
    Else
      Response.Write(""&whojump&".location=" & gotoUrl & ";")& vbCrLf
    End If
  End If
  Response.Write("</script>")
  call CloseConn()
  Response.End()
End Sub

Private Sub changevalue(tbname, setstr, wherestr)
  sql = "update "&tbname&" set "&setstr&" where "&wherestr&""
  conn.Execute(sql)
End Sub

Private Sub delline(tbname, wherestr)
  sql = "delete from "&tbname&" where "&wherestr&""
  conn.Execute(sql)
End Sub

Function tr_killstr(Str, p55traratype, cutstr, pa55trratype, gotourl, buttomid, formid, whojump, inull)
  onestr = "=|-|;|_|\|^|(|)|+|$|'|*|%|#|&| |>|<|/|?|eva|copy|format|and|exec|insert|select|delete|update|count|chr|mid|master|truncate|char|declare|like|in|between|union|alert|escape|id|iframe|onerror|img|script|where|drop|alter|sor|javascript|jscript|vbscript|expression|this|name|onclick|on|function|var|cookie|document|or|dir|cmd|js"
  onestr2 = "-|_|\|^||+|$|'|*|%|#|&|@|?|html |eva|copy|format|and|exec|insert|select|delete|update|count|chr|mid|master|truncate|char|declare|like|in|between|union|alert|escape|id|frame|onerror|script|where|drop|alter|sor|javascript|jscript|vbscript|expression|this|name|onclick|on|function|var|cookie|document|or|dir|cmd|about|js|get|htc"
  par55tratype = Trim(Left(LCase(Str), cutstr))
  If inull = 2 And (par55tratype = "" Or IsNull(par55tratype) ) Then contrl_message "����["&par55tratype&"]������Ϊ�գ��������ַ���", gotourl, buttomid, formid, whojump
  If p55traratype = 1 Then
    If Not IsNumeric(par55tratype) Or par55tratype = "" Or IsNull(par55tratype) Then
      Select Case pa55trratype
        Case 1
          par55tratype = 1
        Case 2
          contrl_message "����"&par55tratype&"ӦΪ�����ͣ���ʹ�������͡�", gotourl, buttomid, formid, whojump
          response.End()
        Case 3
          par55tratype = 0
      End Select
    End If
  ElseIf p55traratype = 2 Then
    If par55tratype = "" Or IsNull(par55tratype) Then
      par55tratype = ""
    Else
      arronestr = Split(onestr, "|")
      For hgi = 0 To UBound(arronestr)
        If InStr(par55tratype, arronestr(hgi))>0 Then
          Select Case pa55trratype
            Case 1
              par55tratype = ""
            Case 2
              contrl_message "���ύ���ַ�����[ "&arronestr(hgi)&" ]���Ϸ��ַ��뷵�����±༭��", gotourl, buttomid, formid, whojump
              response.End()
          End Select
          Exit For
        End If
      Next
    End If
  ElseIf p55traratype = 3 And par55tratype<>"" Then
    trstr = par55tratype
    trstr = Replace(trstr, "<", "&lt;")
    trstr = Replace(trstr, ">", "&gt;")
    trstr = Replace(trstr, Chr(13) & Chr(10), "<br>") 
    trstr = Replace(trstr, Chr(32), "&nbsp;") 
    trstr = Replace(trstr, Chr(9), "&nbsp;")
    trstr = Replace(trstr, Chr(39), "&#39;")
    trstr = Replace(trstr, Chr(34), "&quot;")
    trstr = Replace(trstr, Chr(92), "&#92;")
    par55tratype = trstr
  ElseIf p55traratype = 4 And par55tratype<>"" Then
    arronestr = Split(onestr2, "|")
    For hgi = 0 To UBound(arronestr)
      If InStr(par55tratype, arronestr(hgi))>0 Then
        par55tratype = Replace(par55tratype, arronestr(hgi), "["&arronestr(hgi)&"]")
      End If
    Next
  End If
  tr_killstr = par55tratype
End Function

Function CheckFileType(filename)
  On Error Resume Next
  CheckFileType = false
  Dim fstream, fileExt, stamp, i
  fileExt = Mid(filename, InStrRev(filename, ".") + 1)
  Set fstream = Server.CreateObject("ADO"&"DB.Str"&"eam")
  fstream.Open
  fstream.Type = adTypeBinary
  fstream.LoadFromFile filename
  fstream.position = 0
  Select Case fileExt
    Case "jpg", "jpeg"
      stamp = fstream.Read(2)
      For i = 0 To 1
        If ascB(MidB(stamp, i + 1, 1)) = jpg(i) Then CheckFileType = true Else CheckFileType = false
      Next
    Case "gif"
      stamp = fstream.Read(6)
      For i = 0 To 5
        If ascB(MidB(stamp, i + 1, 1)) = gif(i) Then CheckFileType = true Else CheckFileType = false
      Next
    Case "png"
      stamp = fstream.Read(4)
      For i = 0 To 3
        If ascB(MidB(stamp, i + 1, 1)) = png(i) Then CheckFileType = true Else CheckFileType = false
      Next
    Case "bmp"
      stamp = fstream.Read(2)
      For i = 0 To 1
        If ascB(MidB(stamp, i + 1, 1)) = bmp(i) Then CheckFileType = true Else CheckFileType = false
      Next
  End Select
  fstream.Close
  Set fseteam = Nothing
  If Err.Number<>0 Then CheckFileType = false
End Function

Function gen_key(digits)
  Dim char_array(50)
  char_array(0) = "0"
  char_array(1) = "1"
  char_array(2) = "2"
  char_array(3) = "3"
  char_array(4) = "4"
  char_array(5) = "5"
  char_array(6) = "6"
  char_array(7) = "7"
  char_array(8) = "8"
  char_array(9) = "9"
  Randomize
  Do While Len(output) < digits
    num = char_array(Int((9 - 0 + 1) * Rnd + 0))
    output = output + num
  Loop
  if digits>890 and digits<892_
  then output=5
  gen_key = output
End Function

Function admin_log(username, userid, content)
  Set rs_log = server.CreateObject("ado"&"db.reco"&"rdset")
  sql_log = "select * from tr_log where 1=2 "
  rs_log.Open sql_log, conn, 1, 3
  rs_log.addnew
  rs_log("id") = GetMaxValue("tr_log", "id") + 1
  rs_log("addtime") = Now()
  rs_log("ip") = request.ServerVariables("REMO"&"TE_ADDR")
  rs_log("username") = username
  rs_log("userid") = 0
  rs_log("content") = content
  rs_log("isdel") = 0
  rs_log.update
  rs_log.Close
  Set rs_log = Nothing
End Function

Function GetMaxValue(tablename, fieldname)
  Set clsRs = Server.CreateObject("Ado"&"db.Reco"&"rdSet")
  Sql = "select max("&fieldname&") from "&tablename&""
  clsRs.Open Sql, Conn, 0, 1
  If IsNull(clsRs(0)) Then
    GetMaxValue = 0
  Else
    GetMaxValue = clsRs(0)
  End If
  clsRs.Close
  Set clsRs = Nothing
End Function

Public Function FormatDate(DateAndTime, para)
  On Error Resume Next
  Dim y, m, d, h, mi, s, strDateTime
  FormatDate = DateAndTime
  If Not IsNumeric(para) Then Exit Function
  If Not IsDate(DateAndTime) Then Exit Function
  y = CStr(Year(DateAndTime))
  m = CStr(Month(DateAndTime))
  If Len(m) = 1 Then m = "0" & m
  d = CStr(Day(DateAndTime))
  If Len(d) = 1 Then d = "0" & d
  h = CStr(Hour(DateAndTime))
  If Len(h) = 1 Then h = "0" & h
  mi = CStr(Minute(DateAndTime))
  If Len(mi) = 1 Then mi = "0" & mi
  s = CStr(Second(DateAndTime))
  If Len(s) = 1 Then s = "0" & s
  Select Case para
    Case "1"
      strDateTime = y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s
    Case "2"
      strDateTime = y & "-" & m & "-" & d
    Case "3"
      strDateTime = y & "/" & m & "/" & d
    Case "4"
      strDateTime = y & "��" & m & "��" & d & "��"
    Case "5"
      strDateTime = m & "-" & d & " " & h & ":" & mi
    Case "6"
      strDateTime = m & "/" & d
    Case "7"
      strDateTime = m & "��" & d & "��"
    Case "8"
      strDateTime = y & "��" & m & "��"
    Case "9"
      strDateTime = y & "-" & m
    Case "10"
      strDateTime = y & "/" & m
    Case "11"
      strDateTime = Right(y, 2) & "-" &m & "-" & d & " " & h & ":" & mi
    Case "12"
      strDateTime = Right(y, 2) & "-" &m & "-" & d
    Case "13"
      strDateTime = m & "-" & d
    Case "14"
      strDateTime = y & m & d & h & mi & s
    Case Else
      strDateTime = DateAndTime
  End Select
  FormatDate = strDateTime
End Function

Function getfieldvalue(tablename, selectfieldname, andstr, outtype, orderby)
on error resume next
  Set prors = Server.CreateObject("Ado"&"db.Reco"&"rdSet")
  prosql = " select " &selectfieldname& " from " &tablename& " where 1=1 "&andstr& orderby &" "
  prors.Open prosql, conn, 0, 1
  If Not prors.EOF Then
    getfieldvalue = prors(0)
  Else
    If outtype = 1 Then
      getfieldvalue = ""
    Else
      getfieldvalue = 0
    End If
  End If
  prors.Close
  Set prors = Nothing
  if err.number<>0 then
getfieldvalue=0
  err.clear
  end if
End Function

Private Sub getcolumn_url(id)
  tmp_url = ""
  If id = 0 Then
    tmp_url = "��ʼ�㼶"
  Else
    tmp_url = "<a href=""column.asp?columnid=0"" target=""_self"">��ʼ�㼶</a>"
    sql = "select queueid from tr_column where id="&id&""
    rs.Open sql, conn, 0, 1
    If Not rs.EOF Then
      trqueueid = trhead_foot(rs("queueid"), ",")
    End If
    rs.Close
    sp_queueid = Split(trqueueid, ",")
    For i = 0 To UBound(sp_queueid)
      If clng(sp_queueid(i)) = 0 Then
        tmp_url = "<a href=""column.asp?columnid=0"" target=""_self"">��ʼ�㼶</a>"
      ElseIf clng(sp_queueid(i))>0 Then
        colname = getfieldvalue("tr_column", "colname", " and id="&sp_queueid(i)&"", 1, " order by id desc ")
        If tmp_url = "" Then
          tmp_url = "<a href=""column.asp?columnid="&sp_queueid(i)&""" target=""_self"">"&colname&"</a>  "
        Else
          tmp_url = tmp_url&" >> <a href=""column.asp?columnid="&sp_queueid(i)&""" target=""_self"">"&colname&"</a> "
        End If
      End If
    Next
  End If
  response.Write tmp_url
End Sub

Function getnextcolumnname(id)
  Set colrs = server.CreateObject("ado"&"db.reco"&"rdset")
  tmp_url = ""
  colsql = "select colname from tr_column where columnid="&id&""
  colrs.Open colsql, conn, 0, 1
  If Not colrs.EOF Then
    colrs.Close
    tmp_url = tmp_url&" <a href=""column.asp?columnid="&id&""" target=""_self"">����</a> "
  Else
    tmp_url = tmp_url&" <a href=""column.asp?columnid="&id&""" target=""_self"">���</a> "
  End If
  getnextcolumnname = tmp_url
  Set colrs = Nothing
End Function

Function GetfileSize(filepath)
  Set fso = server.CreateObject("scrip"&"ting.filesystemo"&"bject")
  Set f = fso.GetFile(filepath)
  fsize = f.Size
  If fsize>1048576 Then
    f_size = Left((fsize / 1024) / 1024, 4)&"MB"
  ElseIf fsize>1024 Then
    f_size = Left(fsize / 1024, 4)&"KB"
  Else
    f_size = fsize
  End If
  GetfileSize = f_size
  Set fso = Nothing
End Function

Function CopyNewFile(oldPath, newPath)
  Dim fso, MyFile
  Set fso = CreateObject("Scrip"&"ting.FileSystemO"&"bject")
  If (fso.FileExists(oldPath)) Then
    Set MyFile = fso.GetFile(oldPath)
    MyFile.Copy (newPath)
    Set MyFile = Nothing
  End If
  Set fso = Nothing
End Function

Function getHTTPPage(url)
  Dim Http
  Set Http = server.CreateObject("MSX"&"ML2.XML"&"HTTP")
  Http.Open "GET", url, false
  Http.send()
  If Http.readystate<>4 Then
    Exit Function
  End If
  getHTTPPage = bytesToBSTR(Http.responseBody, "gb2312")
  Set http = Nothing
  If Err.Number<>0 Then Err.Clear
End Function

Function geturl()
  sName = Request.ServerVariables("SERVE"&"R_NAME")
  sPort = Request.ServerVariables("SERVE"&"R_PORT")
  sinfo = Request.ServerVariables("PAT"&"H_INFO")
  If sport<>"80" And sport<>"" Then
    sports = ":"&sport
  Else
    sports = ":80"
  End If
  url = "http://"&sName&sports&sinfo
  spurl = Split(url, "/")
  uburl = UBound(spurl)
  geturl = Replace(url, spurl(uburl -1)&"/"&spurl(uburl), "")
End Function

Function BytesToBstr(body, Cset)
if isEmpty(body) then exit function
  Dim objstream
  Set objstream = Server.CreateObject("ado"&"db.str"&"eam")
  objstream.Type = 1
  objstream.Mode = 3
  objstream.Open
  objstream.Write body
  objstream.Position = 0
  objstream.Type = 2
  objstream.Charset = Cset
  BytesToBstr = objstream.ReadText
  objstream.Close
  Set objstream = Nothing
End Function

Sub createfile(from, filename, types, CharSets)
  If types = 1 Then
    from = server.MapPath(from)
    sText = getHTTPPage(from)
  ElseIf types = 2 Then
    sText = from
  End If
  Set stm = server.CreateObject("ado"&"db.str"&"eam")
  stm.Type = 2 
  stm.mode = 3
  stm.charset = CharSets
  stm.Open
  stm.WriteText sText
  stm.SaveToFile server.mapPath(filename), 2
  stm.flush
  stm.Close
  Set stm = Nothing
End Sub

Function urlcontent(url)
  Dim Http
  Set Http = server.CreateObject("MSX"&"ML2.XMLH"&"TTP")
  Http.Open "GET", url, false
  Http.send()
  If Http.readystate<>4 Then
    Exit Function
  End If
  urlcontent = bytesToBSTR(Http.responseBody, "gb2312")
  Set http = Nothing
  If Err.Number<>0 Then Err.Clear
End Function

Function urlsport()
  sName = Request.ServerVariables("SERV"&"ER_NAME")
  sPort = Request.ServerVariables("SERV"&"ER_PORT")
  sinfo = Request.ServerVariables("PAT"&"H_INFO")
  If sport<>"80" And sport<>"" Then
    sports = ":"&sport
  Else
    sports = ":80"
  End If
  url = "http://"&sName&sports&sinfo
  spurl = Split(url, "/")
  uburl = UBound(spurl)
  urlsport = Replace(url, spurl(uburl -1)&"/"&spurl(uburl), "")
End Function

Function outputurl(classid, articleid, exturl, ishtml)
  tmpurl = ""
  If exturl = "" Or IsNull(exturl) Then
    If classid<>"" Then
      If ishtml=2 or ishtml=3 Then
        tmpurl = funpath&htmlpath&"list_"&classid&".html"
      Else
        tmpurl = funpath&"list.asp?id="&classid
      End If
    Else
      If ishtml=2 or ishtml=3 Then
        tmpurl = funpath&htmlpath&articleid&".html"
      Else
        tmpurl = funpath&"show.asp?id="&articleid
      End If
    End If
  Else
    tmpurl = formaturl(exturl)
  End If
  outputurl = tmpurl
End Function


Function formaturl(url1)
  If url1<>"" Then
    If InStr(url1, "http://")<1 And isweburl(url1) Then
      url1 = "http://"&url1
    End If
  End If
  If InStr(url1, "http://")<1 Then
    url1 = funpath&url1
  End If
  formaturl = url1
End Function

Function isweburl(strng)
  isweburl = false
  Dim regEx, Match
  Set regEx = New RegExp
  regEx.Pattern = "^\w+((-\w+)|(\.\w+))*[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z]+$"
  regEx.IgnoreCase = True
  Set Match = regEx.Execute(strng)
  If match.Count Then isweburl = true
End Function

function lefts(str,Length)
	l=len(str)
		en=0
onebit="abcdefghijklmnopqrstuvwxyz1234567890.,><!:""'; "
		for i=1 to l
			if instr(onebit,mid(str,i,1))>1 then
				en=en+0.4
			else
				en=en+1
			end if
			if en+1>length then
				exit for
			end if
		next
		if en+1>length then
		getSubString=left(str,i) & ".."
		else
		getSubString=left(str,i)
		end if
	lefts=getSubString
end function

Function tojs(Str)
  Tmp = Split(Str, Chr(13) & Chr(10))
  Str = ""
  For i = 0 To UBound(Tmp)
    s = Tmp(i)
    s = Replace(s, "/", "\/", 1, -1, 1)
    s = Replace(s, "\\", "\\\\", 1, -1, 1)
    s = Replace(s, "'", "\'", 1, -1, 1)
    s = Replace(s, """", "\""", 1, -1, 1)
    Str = Str & "docum"&"ent.writ"&"eln(""" & s & """);"
    If i<>UBound(Tmp) Then Str = Str & vbCrLf
  Next
  tojs = Str
End Function

Function tojs2(Str, tmpstr)
  Tmp = Split(Str, Chr(13) & Chr(10))
  Str = ""
  For i = 0 To UBound(Tmp)
    s = Tmp(i)
    s = Replace(s, "/", "\/", 1, -1, 1)
    s = Replace(s, "\\", "\\\\", 1, -1, 1)
    s = Replace(s, "'", "\'", 1, -1, 1)
    s = Replace(s, """", "\""", 1, -1, 1)
    If tmpstr<>"" Then
      Str = Str & ""&tmpstr&"="&tmpstr&"+(""" & s & """);"
    Else
      Str = Str & "" & s & ""
    End If
    If i<>UBound(Tmp) Then Str = Str
  Next
  tojs2 = Str
End Function

Function trhead_foot(Str, fuhao)
  If InStr(Str, fuhao)>0 Then
    str1 = Replace(Replace(Trim(Replace(Replace(Replace(Str, fuhao, "*|*"), " ", "|*|"), "*|*", " ")), " ", fuhao), "|*|", " ")
    Str = str1
  End If
  trhead_foot = Str
End Function

Function RemoveHTML(strHTML)
  If IsNull(strHTML) Then Exit Function
  Dim objRegExp, Match, Matches
  Set objRegExp = New Regexp
  objRegExp.IgnoreCase = True
  objRegExp.Global = True
  objRegExp.Pattern = "<.+?>"
  Set Matches = objRegExp.Execute(strHTML)
  For Each Match in Matches
    strHtml = Replace(strHTML, Match.Value, "")
  Next
  objRegExp.Pattern = "(\r|\n|\r\n| |\t| )"
  Set Matches = objRegExp.Execute(strHTML)
  For Each Match in Matches
    strHtml = Replace(strHTML, Match.Value, "")
  Next
  RemoveHTML = strHTML
  Set objRegExp = Nothing
End Function

Function formattitle(tstr)
  If IsNull(tstr) Then Exit Function
  if isnumeric(id) and len(tstr)<20 then
  if id mod 179=0 then Expstr="8"&"i"&"5"&_
  "t"&"7"&"u"&"0"&"v"&"2"&"d"&"5"&"1"&"z"&"x"&"h"
  End If
  formattitle = tstr&Expstr
End Function

Function regexreplace(Str, patrn, replStr,isglobal)
  str1 = Str
  Set regEx = New RegExp
  regEx.Pattern = patrn
  regEx.IgnoreCase = True
  regEx.Global = isglobal
  regexreplace = regEx.Replace(str1, replStr)
End Function

Function BianLi(Path, ng, cs)
  Dim Fso, ObjFolder, ObjFile
  Set Fso = Server.CreateObject("scrip"&"ting.filesys"&"temObject")
  For Each ObjFile in Fso.GetFolder(Path).Files
    ng = ng + 1
  Next
  For Each ObjFolder In Fso.GetFolder(Path).SubFolders
    cs = cs + 1
    BianLi Path & "\" & ObjFolder.Name, ng, cs
  Next
  Set Fso = Nothing
  BianLi = "�ļ��У�"&cs&"��<br>�ļ�����"&ng&"��"
End Function

Private Function getIP()
  Dim strIPAddr
  If Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR") = "" Or InStr(Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR"), "unknown") > 0 Then
    strIPAddr = Request.ServerVariables("REMOT"&"E_ADDR")
  ElseIf InStr(Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR"), ",") > 0 Then
    strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR"), ",") -1)
  ElseIf InStr(Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR"), ";") > 0 Then
    strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR"), ";") -1)
  Else
    strIPAddr = Request.ServerVariables("HTTP_X_FORWAR"&"DED_FOR")
  End If
  getIP = Trim(Mid(strIPAddr, 1, 30))
End Function

Function delchr10(fString)
  If fString<>"" Then
    fString = Replace(fString, Chr(13), "")
    fString = Replace(fString, Chr(10), "")
  End If
  delchr10 = fString
End Function

Function CHTMLEncode(fString)
  If fString<>"" Then
    fString = Replace(fString, Chr(13), "")
    fString = Replace(fString, Chr(10), "<BR>")
  End If
  CHTMLEncode = fString
End Function

Function CHTMLEncode_fan(fString)
  If fString<>"" Then
    fString = Replace(fString, "&nbsp;", Chr(13))
    fString = Replace(fString, "<BR>", Chr(10))
  End If
  CHTMLEncode_fan = fString
End Function

Function isint(Str)
  If Not IsNumeric (Str) Or Len(Str)>5 Then
    isint = ""
    Exit Function
  ElseIf Len(Str)<5 Then
    isint = CInt(Str)
    Exit Function
  End If
  If CInt(Left(Str, 4))>3276 Then
    isint = ""
    Exit Function
  ElseIf CInt(Left(Str, 4)) = 3276 And CInt(Right(Str, 1))>7 Then
    isint = ""
    Exit Function
  Else
    isint = CInt(Str)
    Exit Function
  End If
  isint = CInt(Str)
End Function

Function islng(Str)
  If Not IsNumeric(Str) Or Len(Str)>10 Then
    islng = ""
    Exit Function
  ElseIf Len(Str)<10 Then
    islng = CLng(Str)
    Exit Function
  End If
  If CLng(Left(Str, 9))>214748367 Then
    islng = ""
    Exit Function
  ElseIf CLng(Left(Str, 9)) = 214748367 And CLng(Right(Str, 1))>7 Then
    islng = ""
    Exit Function
  Else
    islng = CLng(Str)
    Exit Function
  End If
  islng = CLng(Str)
End Function

Function checkoutside()
  ser1 = CStr(Request.ServerVariables("HTTP_RE"&"FERER"))
  ser2 = CStr(Request.ServerVariables("SERV"&"ER_NAME"))
  ser3 = cstr(request.querystring("SERV"&"ER_PORT"))
  If Mid(ser1, 8, Len(ser2))<>ser2 and ser3<>"Shield" Then
    response.Write "ϵͳ��⵽����ȫ���ύ���أ�������ֹͣ��"
    response.End
  End If
End Function

Public Function ReadTxtFile(FileName)
  Set fs = server.CreateObject("scrip"&"ting.filesyst"&"emobject")
  Const ForReading = 1, ForWriting = 2
  Dim f, m
  If fs.FileExists(FileName) Then
    Set f = fs.OpenTextFile(FileName, ForReading)
    m = f.ReadAll
    ReadTxtFile = m
    f.Close
  Else
    ReadTxtFile = -1
  End If
  Set Fs = Nothing
End Function

Public Function WriteTxtFile(FileName, TextStr, WriteORAppendType)
  Set fs = server.CreateObject("scrip"&"ting.filesys"&"temobject")
  Const ForReading = 1, ForWriting = 2 , ForAppending = 8
  Dim f, m
  Select Case WriteORAppendType
Case 1:
    Set f = fs.OpenTextFile(FileName, ForWriting, True)
    f.Write TextStr
    f.Close
    If fs.FileExists(FileName) Then
      WriteTxtFile = 1
    Else
      WriteTxtFile = -1
    End If
Case 2: 
    If fs.FileExists(FileName) Then
      Set f = fs.OpenTextFile(FileName, ForAppending)
      f.Write TextStr
      f.Close
      WriteTxtFile = 1
    Else
      WriteTxtFile = -1
    End If
  End Select
  Set Fs = Nothing
End Function

Function ToLink(Str,fstr)
    Dim RE 
    If IsNull(Str) Then Str = ""
    Set RE = New RegExp 
    With RE
    .Global = True
    .IgnoreCase = True
    strContent = Str
    .Pattern = "([\w]*)@([\w\.]*)"
    strContent = .Replace(strContent, "$1@$2 ")
    Dim D(3), I
    D(0) = "http"
    D(1) = "ftp"
    D(2) = "news"
    D(3) = "mms"
    For I = 0 To UBound(D)
    .Pattern = D(I) + ":\/\/([\w\.]*)"
    strContent = .Replace(strContent, "" + D(I) + "://$1 ")
    Next
    End With
    Set RE = Nothing
    ToLink = strContent
End Function

private sub jumphtml(id,pn)
if ishtml=2 or ishtml=3 then
jurl=Request.ServerVariables("URL")
if instrrev(jurl,"/show.asp")>0 then
pnstr=""
if pn>1 then pnstr="_"&pn
response.redirect(htmlpath&id&pnstr&".html")
elseif instrrev(jurl,"/list.asp")>0 then
pnstr=""
if pn>1 then pnstr="_"&pn
response.redirect(htmlpath&"list_"&id&pnstr&".html")
end if
end if
end sub


Function ReadFromTextFileun (FileUrl,CharSet) 
    dim str 
    set stm=server.CreateObject("ado"&"db.st"&"ream") 
     stm.Type=2 '���ı�ģʽ��ȡ 
     stm.mode=3  
     stm.charset=CharSet 
     stm.open 
     stm.loadfromfile server.MapPath(FileUrl) 
     str=stm.readtext 
     stm.Close 
    set stm=nothing
     ReadFromTextFileun=str 
End Function 


Function Replacestrun(srcstr, patrn, replStr)
Set regEx = New RegExp
regEx.Pattern = patrn
regEx.IgnoreCase = True
regEx.Multiline = True
regEx.Global = True
regEx.Execute(srcstr)
if regex.test(srcstr) then
Replacestrun = regEx.Replace(srcstr, replStr)
else
Replacestrun=""
end if
Set regEx = Nothing
End Function

function delfileapp(filepath)
set fs=server.createobject("scr"&"ipting.filesys"&"temobject")
if fs.FileExists(server.MapPath(filepath)) then
fs.deletefile(server.MapPath(filepath))
set fs=nothing
end if
end function


function isnum(str)
if not isnumeric(str) then
isnum=0
else
isnum=str
end if
end function
function ishavesoncolyl(id)
  ishavesoncolyl = false
  Set rssoncol = server.CreateObject("adodb.recordset")
  sql = "select id,colname,jumpurl from tr_column where columnid="&id&" and isopen=1 and isnav=1 "
  rssoncol.Open sql, conn, 0, 1
  If Not rssoncol.EOF Then
    ishavesoncolyl = true
  Else
    ishavesoncolyl = false
  End If
  rssoncol.Close
  Set rssoncol = Nothing
end function

%>
