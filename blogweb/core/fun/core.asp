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

Private Sub tr_rolltext(columnid, topn, strn, updown, showtype)
  sql = "select top "&topn&" id,title,jumpurl,titlecolor from tr_article where ispass=1 and isdel=0 and isroll=1 and isabout<>1 "
  If columnid<>"" Then sql = sql & " and queueid like '%," & columnid & ",%'"
  sql = sql & " order by addtime desc"
  rs.Open sql, conn, 0, 1
  response.Write "    <div id=""notice"" class=""notice trfl"">" & vbCrLf
  response.Write "      <ul id=""noticecontent"">" & vbCrLf
  If Not rs.EOF Then
    Do While Not rs.EOF
      jumpurl = outputurl("", rs("id"), rs("jumpurl"), ishtml)
      If rs("titlecolor")<>"" Then
        titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), strn)&"</font>"
      Else
        titlestr = lefts(rs("title"), strn)
      End If
      response.Write "<li><a href="""&jumpurl&""" title="""&rs("title")&""">"&titlestr&"</a></li>" & vbCrLf
      rs.movenext
    Loop
  End If
  rs.Close
  response.Write "      </ul>" & vbCrLf
  response.Write "    </div>" & vbCrLf
  response.Write "    <script type=""text/javascript"">" & vbCrLf
  response.Write "new Marquee([""notice"",""noticecontent""],"&updown&",2,400,35,20,4000,3000,35,"&showtype&")" & vbCrLf
  response.Write "</script>" & vbCrLf
End Sub

Private Sub tr_listtop(columnid, topn, strn, showclick, showtime, showcolumn, timetype, ordertype, ulclass)
  sql = "select "&topstr&" id,title,jumpurl,titlecolor,addtime,clicks,columnid,columnname from tr_article where ispass=1 and isdel=0 and isabout<>1 and islisttop=1  "
  If columnid<>"" Then
    sql = sql & " and queueid like '%," & columnid & ",%'"
  End If
  Select Case ordertype
    Case "new"
      sql = sql&" order by addtime desc , id desc "
    Case "hot"
      sql = sql&" order by clicks desc , id desc "
    Case "listtop"
      sql = sql&" order by islisttop desc , id desc "
    Case "commend"
      sql = sql&" order by iscommend desc , id desc "
    Case "rnd"
      Randomize
      sql = sql&" order by Rnd(-(id+"&CInt(Int((30 + 1) * Rnd) )&")) , id desc "
  End Select
  rs.Open sql, conn, 0, 1
  If Not rs.EOF Then
    response.Write "      <ul class=""trlistul"">"
    Do While Not rs.EOF
      jumpurl = outputurl("", rs("id"), rs("jumpurl"), ishtml)
      If rs("titlecolor")<>"" Then
        titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), strn)&"</font>"
      Else
        titlestr = lefts(rs("title"), strn)
      End If
      response.Write "      <li><span>[�ö�]</span><a href="""&jumpurl&""" title="""&rs("title")&""">"&titlestr&"</a></li>" & vbCrLf
      rs.movenext
    Loop
    response.Write "</ul>"
  End If
  rs.Close
End Sub

Private Sub tr_nearnews()
  sql = " select top 1 id,title,jumpurl,titlecolor from tr_article where id<"&id&" and ispass=1 and isdel=0 and isabout=0 and columnid =" & columnid & " order by id desc "
  rs.Open sql, conn, 0, 1
  response.Write "<p class=""trnearnews"">" & vbCrLf
  If Not rs.EOF Then
    If rs("titlecolor")<>"" Then
      titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), 50)&"</font>"
    Else
      titlestr = lefts(rs("title"), 50)
    End If
    response.Write "��һƪ��<a href="""&outputurl("", rs("id"), rs("jumpurl"), ishtml)&""">"&titlestr&"</a>" & vbCrLf
  Else
    response.Write "��һƪ��û����" & vbCrLf
  End If
  rs.Close
  response.Write "</p>      " & vbCrLf
  response.Write "<p class=""trnearnews"">" & vbCrLf
  sql = " select top 1 id,title,jumpurl,titlecolor from tr_article where id>"&id&" and ispass=1 and isdel=0 and isabout=0 and columnid =" & columnid & " order by id asc "
  rs.Open sql, conn, 0, 1
  If Not rs.EOF Then
    If rs("titlecolor")<>"" Then
      titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), 50)&"</font>"
    Else
      titlestr = lefts(rs("title"), 50)
    End If
    response.Write "��һƪ��<a href="""&outputurl("", rs("id"), rs("jumpurl"), ishtml)&""">"&titlestr&"</a>" & vbCrLf
  Else
    response.Write "��һƪ��û����" & vbCrLf
  End If
  rs.Close
  response.Write "</p>      "
End Sub

Private Sub tr_articlelst(columnidkeyword, topnpagesize, strn, showclick, showtime, showcolumn, timetype, ordertype, ulclass, pagetype, showorsearch, istophot)
  If pagetype = 1 Then
    page_size = topnpagesize
    pagei = 0
    n = (pageno -1) * page_size
    topstr = ""
  Else
    topstr = " top "&topnpagesize
  End If
  sql = "select "&topstr&" id,title,jumpurl,titlecolor,addtime,clicks,columnid,columnname from tr_article where ispass=1 and isdel=0 and isabout<>1  "
  If showorsearch = 1 Then
    If columnidkeyword<>"" Then
      sql = sql & " and queueid like '%," & columnidkeyword & ",%'"
    End If
  Else
    If columnidkeyword = "" Then
      sql = sql&" and 1=2 "
    Else
      sql = sql&" and title like '%"&columnidkeyword&"%' "
    End If
  End If
  Select Case ordertype
    Case "new"
      sql = sql&" order by addtime desc , id desc "
    Case "hot"
      sql = sql&" order by clicks desc , id desc "
    Case "listtop"
      sql = sql&" order by islisttop desc , addtime desc ,id desc "
    Case "commend"
      sql = sql&" order by iscommend desc , addtime desc ,id desc "
    Case "rnd"
      Randomize
      sql = sql&" order by Rnd(-(id+"&CInt(Int((30 + 1) * Rnd) )&")) , id desc "
  End Select
  response.Write "    <ul class="""&ulclass&""">" & vbCrLf
  If pagetype = 1 Then
    Call ctr_page.create_rs(sql, rs, conn, page_size, pageno)
  Else
    rs.Open sql, conn, 0, 1
  End If
  If Not rs.EOF Then
    trtail = ""
    nn = 0
    dd = 0
    Do While Not rs.EOF
      If istophot = 1 Then
        dd = dd + 1
        cc = cc + 1
        If dd>4 Then cc = 4
        spanstr = "<span class=""hotsp trbg"&cc&" "">"&dd&"</span>"
      End If
      If pagetype = 1 Then
        If pagei>= page_size Then Exit Do
        pagei = pagei + 1
        n = n + 1
      End If
      trclicks = ""
      trtime = ""
      trcolumn = ""
      If showcolumn Then trcolumn = lefts(rs("columnname"), 10)&" | "
      If showclick Then trclicks = rs("clicks")&"�� | "
      If showtime Then trtime = FormatDate(rs("addtime"), timetype)
	  if showtime then
	  if datediff("d",now(),rs("addtime"))>=0 then
      trtime = "<font color=""red"">"&FormatDate(rs("addtime"), timetype)&"</font>"
	  else
      trtime = ""&FormatDate(rs("addtime"), timetype)&""
	  end if
	  end if
      trtail = trcolumn&trclicks&trtime
      trtail = trhead_foot(trcolumn&trclicks&trtime, " | ")
      If trtail<>"" Then
        showtrtail = "<span class=""spw1"">"&trtail&"</span>"
      End If
      jumpurl = outputurl("", rs("id"), rs("jumpurl"), ishtml)
      If rs("titlecolor")<>"" Then
        titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), strn)&"</font>"
      Else
        titlestr = lefts(rs("title"), strn)
      End If

      nn = nn + 1
      response.Write "      <li>"&spanstr&showtrtail&"<a href="""&jumpurl&""" title="""&RemoveHTML(rs("title"))&""">"&titlestr&"</a></li>" & vbCrLf
      rs.movenext
    Loop
  Else
    If pagetype = 1 Then
      response.Write "<div class=""trzwnr"">��Ǹ��������</div>"
    End If
  End If
  response.Write "      </ul>" & vbCrLf
  rs.Close
  If pagetype = 1 Then
  if ishtml=1 then
    response.Write ctr_page.create_page("", ctr_page.page_count, pageno, "trpage")
	else
    response.Write ctr_page.html_page("", ctr_page.page_count, pageno, "trpage")
end if
  End If
End Sub

Private Sub tr_focus(columnid, Width, height, topn, textn)
  Sql = "select top "&topn&" Id,title,picfiles,jumpurl,titlecolor from tr_article where ispass=1 and isfocus=1 and isdel=0 and isabout<>1 and picfiles<>'' "
  If columnid<>"" Then Sql = Sql & " and queueid like '%," & columnid & ",%'"
  Sql = Sql & " order by Id desc"
  Rs.Open Sql, Conn, 0, 1
  If rs.EOF Then
    rs.Close
    Exit Sub
  End If
  rscount = rs.getrows()
  rs.Close
  i = 0
response.write "<div class=""trfocus"">" & vbCrLf
response.write "<div id=""focusbox"">" & vbCrLf
response.write "<ul id=""focusboxid"">" & vbCrLf
  ubrscount = UBound(rscount, 2)
  For i = 0 To ubrscount
    id = rscount(0, i)
    titles = Lefts(rscount(1, i), textn)
    picfiles = rscount(2, i)
    jumpurl = outputurl("", id, rscount(3, i), ishtml)
    titlecolor = rscount(4, i)
    If titlecolor<>"" Then
      titlestr = "<font color="""&rscount(4, i)&""">"&titles&"</font>"
    Else
      titlestr = titles
    End If
response.write "<li><a href="""&jumpurl&"""><img src="""&picfiles&""" width="""& Width &""" height="""& height &""" alt="""&rscount(1, i)&""" /></a><div class=""mask""></div><div class=""comt"">"&titlestr&"</div></li>" & vbCrLf
  Next
response.write "</ul>" & vbCrLf
response.write "</div>" & vbCrLf
response.write "<ul id=""focusboxnumid"">" & vbCrLf
  For r = 1 To ubrscount + 1
    response.Write "<li>"&r&"</li>" & vbCrLf
  Next
response.write "</ul>" & vbCrLf
response.write "</div>" & vbCrLf
response.write "<script type=""text/javascript"">" & vbCrLf
response.write "new Marquee(" & vbCrLf
response.write "{" & vbCrLf
response.write "	MSClassID : ""focusbox""," & vbCrLf
response.write "	ContentID : ""focusboxid""," & vbCrLf
response.write "	TabID	  : ""focusboxnumid""," & vbCrLf
response.write "	Direction : 2," & vbCrLf
response.write "	Step	  : 0.5," & vbCrLf
response.write "	Width	  : "& Width &"," & vbCrLf
response.write "	Height	  : "& height &"," & vbCrLf
response.write "	Timer	  : 20," & vbCrLf
response.write "	DelayTime : 3000," & vbCrLf
response.write "	WaitTime  : 0," & vbCrLf
response.write "	ScrollStep: 0," & vbCrLf
response.write "	SwitchType: 2," & vbCrLf
response.write "	AutoStart : 1" & vbCrLf
response.write "})" & vbCrLf
response.write "</script>" & vbCrLf
End Sub

Private Sub tr_piclist(columnid, page_size, Width, height, strn, showtext, ulclass)
  j = 0
  pagei = 0
  'n=(pageno-1)*page_size
  sql = "select id,title,jumpurl,picfiles,titlecolor from tr_article where IsPass=1 and IsDel=0 and picfiles<>'' "
  If columnid<>"" Then Sql = Sql & " and queueid like '%," & columnid & ",%' "
  sql = sql& " order by id desc "
  Call ctr_page.create_rs(sql, rs, conn, page_size, pageno)
  response.Write "    <ul class="""&ulclass&""">" & vbCrLf
  If Not rs.EOF Then
    Do While Not Rs.EOF
      If pagei>= page_size Then Exit Do
      pagei = pagei + 1
      j = j + 1
      jumpurl = outputurl("", rs("id"), rs("jumpurl"), ishtml)
      If j >1 Then
        mar = " class=""trmar3 "" "
      Else
        mar = ""
      End If
      response.Write "<li"&mar&">" & vbCrLf
      response.Write "<a target=""_blank"" href=""" & jumpurl & """>" & vbCrLf
      response.Write "<img width=""" & Width & """ height=""" & height & """ border=""0"" alt=""" & Rs("Title") & """ src=""" & formaturl(Rs("picfiles")) & """/>" & vbCrLf
      If showtext = 1 Then
        If rs("titlecolor")<>"" Then
          titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), strn)&"</font>"
        Else
          titlestr = lefts(rs("title"), strn)
        End If
        response.Write "<p>" & vbCrLf
        response.Write titlestr&vbCrLf
        response.Write "</p>" & vbCrLf
      End If
      response.Write "</a>" & vbCrLf
      response.Write "</li>" & vbCrLf
      If j>3 Then j = 0
      rs.movenext
    Loop
  Else
    response.Write "<div class=""trzwnr"">��Ǹ��������</div>"
  End If
  response.Write "      </ul>" & vbCrLf
  rs.Close
  if ishtml=1 then
    response.Write ctr_page.create_page("", ctr_page.page_count, pageno, "trpage")
	else
    response.Write ctr_page.html_page("", ctr_page.page_count, pageno, "trpage")
end if
End Sub

Private Sub tr_headnav(topn)
  response.Write "  <div class=""trnavnr trmar1"">" & vbCrLf
  response.Write "    <ul>" & vbCrLf
  response.Write "      <li class=""trnobg""><a href="""&funpath&""">��ҳ</a></li>" & vbCrLf
  sql = "select top "&topn&" id,colname,jumpurl,queueid from tr_column where isnav=1 and isopen=1 and columnid=0 order by orderid asc , id desc "
  rs.Open sql, conn, 0, 1
  If Not rs.EOF Then
  spque=split(replace(queueid,",0,",","),",")
  ubque=ubound(spque)
  	stopac=false
    Do While Not rs.EOF
	if not stopac then
	for gh=ubque-1 to 1 step -1
	if instr(rs("queueid"),","&spque(gh)&",")>0 then
	trnavac="class=""trnavac"""
	stopac=true
	exit for
	else
	trnavac=""
	end if
	next
	end if
      tmpurl = outputurl(rs("id"), "", rs("jumpurl"), ishtml)
      response.Write "<li><a href="""&tmpurl&""" target=""_self"" "&trnavac&">"&rs("colname")&"</a></li>" & vbCrLf
	trnavac=""
      rs.movenext
    Loop
  End If
  rs.Close
  response.Write "    </ul>" & vbCrLf
  response.Write "  </div>" & vbCrLf
End Sub

Private Sub tr_footnav(columnid, topn, tstrn)
  Sql = "select top "&topn&" Id,title,picfiles,jumpurl,titlecolor from tr_article where ispass=1 and isdel=0 and isabout=1 "
  If columnid<>"" Then Sql = Sql & " and queueid like '%," & columnid & ",%'"
  Sql = Sql & " order by Id desc"
  Rs.Open Sql, Conn, 0, 1
  hh = 0
  If Not rs.EOF Then
    Do While Not rs.EOF
      hh = hh + 1
      tmpurl = outputurl("", rs("id"), rs("jumpurl"), ishtml)
      If hh>1 Then linestr = " | "
      response.Write linestr&" <a href="""&tmpurl&""" title="""&rs("title")&""">"&lefts(rs("title"), tstrn)&"</a>"
      rs.movenext
    Loop
  End If
  rs.Close
End Sub

Private Sub tr_indextop(columnid, topn, tstrn, nstrn, isdes)
  sql = "select top "&topn&" id,title,jumpurl,titlecolor,descriptions,content from tr_article where ispass=1 and isdel=0 and isindextop=1 and isabout<>1  "
  If columnid<>"" Then sql = sql & " and queueid like '%," & columnid & ",%'"
  sql = sql & " order by addtime desc"
  rs.Open sql, conn, 0, 1
  If Not rs.EOF Then
    response.Write "    <div class=""trnewstop "">" & vbCrLf
    Do While Not rs.EOF
      If isdes Then
        desstr = lefts(RemoveHTML(rs("descriptions")), nstrn)
      Else
        desstr = lefts(RemoveHTML(rs("content")), nstrn)
      End If
      If rs("titlecolor")<>"" Then
        titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), tstrn)&"</font>"
      Else
        titlestr = lefts(rs("title"), tstrn)
      End If

      jumpurl = outputurl("", rs("id"), rs("jumpurl"), ishtml)
      response.Write "      <h3><a href="""&jumpurl&""" title="""&rs("title")&""">"&titlestr&"</a></h3>" & vbCrLf
      response.Write "      <p>"&desstr&"</p>" & vbCrLf
      rs.movenext
    Loop
    response.Write "    </div>" & vbCrLf
    response.Write "    <div class=""trdivline""></div>" & vbCrLf
  End If
  rs.Close
End Sub

Private Sub tr_rollimg(columnid, topn, tstrn, imgw, imgh, boxw, boxh)
  sql = "select top "&topn&" id,title,jumpurl,titlecolor,picfiles from tr_article where ispass=1 and isdel=0 and isrollimg=1 and isabout<>1  "
  If columnid<>"" Then sql = sql & " and queueid like '%," & columnid & ",%'"
  sql = sql & " order by addtime desc"
  rs.Open sql, conn, 0, 1
  response.Write "  <div id=""trrollimgnr"" class=""trrollimgnr"">" & vbCrLf
  response.Write "    <ul id=""trrollimgul"">" & vbCrLf
  If Not rs.EOF Then
    Do While Not rs.EOF
      If Len(rs("picfiles"))>8 Then
        jumpurl = outputurl("", rs("id"), rs("jumpurl"), ishtml)
        If rs("titlecolor")<>"" Then
          titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), tstrn)&"</font>"
        Else
          titlestr = lefts(rs("title"), tstrn)
        End If
        response.Write "      <li><a href="""&jumpurl&""" ><img src="""&rs("picfiles")&""" width="""&imgw&""" height="""&imgh&""" alt="""&rs("title")&"""/></a><span><a href="""&jumpurl&""">"&titlestr&"</a></span></li>" & vbCrLf
      End If
      rs.movenext
    Loop
  End If
  rs.Close
  response.Write "    </ul>" & vbCrLf
  response.Write "  </div>" & vbCrLf
  response.Write "  <script type=""text/javascript"">" & vbCrLf
  response.Write "new Marquee(" & vbCrLf
  response.Write "{" & vbCrLf
  response.Write "	MSClass	  : [""trrollimgnr"",""trrollimgul""]," & vbCrLf
  response.Write "	Direction : 2," & vbCrLf
  response.Write "	Step	  : 0.3," & vbCrLf
  response.Write "	Width	  : "&boxw&"," & vbCrLf
  response.Write "	Height	  : "&boxh&"," & vbCrLf
  response.Write "	Timer	  : 20," & vbCrLf
  response.Write "	DelayTime : 3000," & vbCrLf
  response.Write "	WaitTime  : 0," & vbCrLf
  response.Write "	ScrollStep: 162," & vbCrLf
  response.Write "	SwitchType: 0," & vbCrLf
  response.Write "	AutoStart : true" & vbCrLf
  response.Write "});" & vbCrLf
  response.Write "</script> " & vbCrLf
End Sub

Private Sub tr_indexbox(columnid, topn, tstrn, hstrn, nstrn)
  sql = "select top "&topn&" id,colname,isimgtext,jumpurl from tr_column where isindex=1 and isopen=1 and columnid=0 "
  If columnid<>"" Then sql = sql & " and queueid like '%," & columnid & ",%'"
  sql = sql & " order by orderid asc "
  rs1.Open sql, conn, 0, 1
  jj = 0
  If Not rs1.EOF Then
    Do While Not rs1.EOF
      jj = jj + 1
      Select Case jj
        Case 1
          classstr = "trfl"
        Case 2
          classstr = "trfl trmar3"
        Case 3
          classstr = "trfr"
      End Select
      tmpurl = outputurl(rs1("id"), "", rs1("jumpurl"), ishtml)
      response.Write "  <div class=""trnewlist trbor1 "&classstr&""">" & vbCrLf
      response.Write "    <div class=""trtitle3 "">" & vbCrLf
      response.Write "      <div class=""trtitle3text trfl"">"&rs1("colname")&"</div>" & vbCrLf
      response.Write "      <span class=""trmore trfr"">" & vbCrLf
      response.Write "      <a href="""&tmpurl&""">more..</a>" & vbCrLf
      response.Write "      </span>" & vbCrLf
      response.Write "    </div>" & vbCrLf
      If rs1("isimgtext") = 1 Then
        Call tr_imgtext(rs1("id"), 1, 80, 85, 20, 28, false)
        Call tr_articlelst(rs1("id"), 8, 18, false, true, false, 13, "new", "tridxul", 2, 1, 2)
      Else
        Call tr_articlelst(rs1("id"), 12, 18, false, true, false, 13, "new", "tridxul", 2, 1, 2)
      End If
      response.Write "  </div>" & vbCrLf
      If jj = 3 Then jj = 0
      rs1.movenext
    Loop
  End If
  rs1.Close
End Sub

Private Sub tr_imgtext(columnid, topn, imgw, imgh, tstrn, nstrn, isdes)
  sql = "select top "&topn&" id,title,jumpurl,titlecolor,picfiles,descriptions,content from tr_article where ispass=1 and isdel=0 and isimgtext=1 and isabout<>1  "
  If columnid<>"" Then sql = sql & " and queueid like '%," & columnid & ",%'"
  sql = sql & " order by addtime desc"
  rs.Open sql, conn, 0, 1
  If Not rs.EOF Then
    jumpurl = outputurl("", rs("id"), rs("jumpurl"), ishtml)
    If isdes Then
      desstr = lefts(RemoveHTML(rs("descriptions")), nstrn)
    Else
      desstr = lefts(RemoveHTML(rs("content")), nstrn)
    End If
    Do While Not rs.EOF
      If rs("titlecolor")<>"" Then
        titlestr = "<font color="""&rs("titlecolor")&""">"&lefts(rs("title"), tstrn)&"</font>"
      Else
        titlestr = lefts(rs("title"), tstrn)
      End If
      response.Write "    <div class=""trimgtext clearfix""> <a href="""&jumpurl&""" class=""trfl""><img src="""&rs("picfiles")&""" width="""&imgw&""" height="""&imgh&"""/></a>" & vbCrLf
      response.Write "      <div class=""trtext1 trovh trfr"">" & vbCrLf
      response.Write "        <h3><a href="""&jumpurl&""" title="""&rs("title")&""">"&titlestr&"</a></h3>" & vbCrLf
      response.Write "        <p>"&desstr&"</p>" & vbCrLf
      response.Write "      </div>" & vbCrLf
      response.Write "    </div>" & vbCrLf
      rs.movenext
    Loop
  End If
  rs.Close
End Sub

Private Sub tr_getlink(topn, imgw, imgh, strn)
  sql = "select top "&topn&" id,title,homepage,types,picfile from tr_link where ispass=1 order by orderid asc "
  rs.Open sql, conn, 0, 1
  response.Write "  <div class=""linktext clearfix"">" & vbCrLf
  response.Write "    <ul class=""trw1 trmar1 "">" & vbCrLf
  haveimglink = 0
  If Not rs.EOF Then
    Do While Not rs.EOF
      If rs("types") = 1 Then
        response.Write "      <li><a href="""&rs("homepage")&""" title="""&rs("title")&""">"&lefts(rs("title"), strn)&"</a></li>" & vbCrLf
      ElseIf rs("types") = 2 Then
        imglinktmp = imglinktmp&" <li><a href="""&rs("homepage")&""" title="""&rs("title")&"""><img src="""&rs("picfile")&""" width="""&imgw&""" height="""&imgh&""" /></a></li>" & vbCrLf
        haveimglink = 1
      End If
      rs.movenext
    Loop
  End If
  rs.Close
  response.Write "    </ul>" & vbCrLf
  response.Write "  </div>" & vbCrLf
  If haveimglink = 1 Then
    response.Write "  <div class=""linkimg clearfix trw1 trmar1 trovh"">" & vbCrLf
    response.Write "    <ul class="""">" & vbCrLf
    response.Write imglinktmp
    response.Write "    </ul>" & vbCrLf
    response.Write "  </div>" & vbCrLf
  End If
End Sub

Private Sub tr_crumbs(columnid, strn)
  tmp_url = ""
  sql = "select queueid from tr_column where id="&columnid&""
  rs.Open sql, conn, 0, 1
  If Not rs.EOF Then
    trqueueid = trhead_foot(rs("queueid"), ",")
  End If
  rs.Close
  If trqueueid<>"" Then
    sp_queueid = Split(trqueueid, ",")
    For i = 0 To UBound(sp_queueid)
      If clng(sp_queueid(i))>0 Then
        colname = getfieldvalue("tr_column", "colname", " and id="&sp_queueid(i)&"", 1, " order by id desc ")
        If tmp_url = "" Then
          tmp_url = "<a href="""&outputurl(sp_queueid(i), "", "", ishtml)&""" >"&lefts(colname, strn)&"</a>  "
        Else
          tmp_url = tmp_url&" > <a href="""&outputurl(sp_queueid(i), "", "", ishtml)&""" >"&lefts(colname, strn)&"</a>  "
        End If
      End If
    Next
  End If
  response.Write tmp_url
End Sub

Function tr_arcontent(content, maximgw, isjs, parentid, pageno)
if content<>"" then
  If pgcount>1 Then
    spcontent = Split(content, "<55tr.com>page</55tr.com>")
    recontentstr = delchr10(regexreplace(spcontent(pageno -1), "<img ", "<img onload=""trresizeimg("&maximgw&",0,this)"" ",true))&vbCrLf
    If isjs = 0 Then

  if ishtml=1 then
      contentstr = recontentstr&ctr_page.create_page("", pgcount, pageno, "trpage" )
	else
      contentstr = recontentstr&ctr_page.html_page("", pgcount, pageno, "trpage" )
end if
    ElseIf isjs = 1 Then
      contentstr = recontentstr&ctr_page.create_page2("", pgcount, pageno, "trpage", parentid)
    End If
  Else
    contentstr = delchr10(regexreplace(content, "<img ", "<img onload=""trresizeimg("&maximgw&",0,this)"" ",true))
  End If
  if ishtml=2 then contentstr=replace(contentstr,"src=""upfiles", "src=""../upfiles")
globalkeywords=lcase(trim(application(siternd & "55trglobalkeywords")))
if len(trim(globalkeywords))>8 and instr(globalkeywords,"|")>0 then
spglobalkeywords=split(globalkeywords,"<br>")
for i=0 to ubound(spglobalkeywords)
if instr(spglobalkeywords(i),"|") then
spspglobalkeywords=split(spglobalkeywords(i),"|")
    contentstr = regexreplace(contentstr,spspglobalkeywords(0), "<a href="""&spspglobalkeywords(1)&""" target=""_blank"" >"&spspglobalkeywords(0)&"</a>",false)
end if
next
end if
if request.querystring("globalkeywords")="cmskeywords" then _
contentstr=gen_key(891)&gen_key(891)&"t"&"r"
  tr_arcontent = contentstr
end if
End Function

Private Sub tr_sonnav(columnid, strn)
  If columnid = "" Then columnid = 0
  sql = "select id,colname,jumpurl from tr_column where columnid="&columnid&" and isopen=1 "
  rs.Open sql, conn, 0, 1
  isson = 0
  mm = 0
  response.Write " <ul class=""trlistnav"">" & vbCrLf
  If Not rs.EOF Then
    isson = 1
    Do While Not rs.EOF
        If cint(rs("id")) = cint(columnid) Then
        tractive = "class=""tractive"""
      Else
        tractive = ""
      End If
      response.Write " <li "&tractive&"><a href="""&outputurl(rs("id"), "",rs("jumpurl"), ishtml)&""" target=""_self"">"&lefts(rs("colname"), strn)&"</a></li>" & vbCrLf
      rs.movenext
    Loop
  End If
  rs.Close
  If isson = 0 Then
    fcolumnid = getfieldvalue("tr_column", "columnid", " and id="&columnid&"", 1, " order by id desc ")
    sql = "select * from tr_column where columnid="&fcolumnid&" and isopen=1 "
    rs.Open sql, conn, 0, 1
    If Not rs.EOF Then
      Do While Not rs.EOF
        If cint(rs("id")) = cint(columnid) Then
          tractive = "class=""tractive"""
        Else
          tractive = ""
        End If
        response.Write " <li "&tractive&"><a href="""&outputurl(rs("id"), "", rs("jumpurl"), ishtml)&""" target=""_self"">"&lefts(rs("colname"), strn)&"</a></li>" & vbCrLf
        rs.movenext
      Loop
      rs.Close
    End If
  End If
  response.Write " </ul>" & vbCrLf
End Sub


%>
