<%
Class tr_admin
  Public id
  Public md5name
  Public adminname
  Public passwd
  Public Authentication_key
  Public isfree
  Public cookieskey
  Public cookiestime
  Public ctrllimit
  Public limitidrange
  Public department
  
  Function tr_admin_login(adminname, passwd, ver_code)
    gonext = 0
    '��֤�벿��
    nowtime = FormatDate(Now(), 1)
    sql = "select todaylogintimes,limittimes from tr_system where 1=1"
    rs.Open sql, conn, 1, 3
    If rs.EOF Or rs.bof Then
      rs.addnew()
    End If
    todaylogintimes = rs("todaylogintimes")
    If todaylogintimes <>"" Then
      sptodaylogintimes = Split(todaylogintimes, "|")
      sptodaylogintimes0 = FormatDate(sptodaylogintimes(0), 1)
      sptodaylogintimes1 = sptodaylogintimes(1)
      If DateDiff("d", sptodaylogintimes0, nowtime) = 0 Then
        If clng(sptodaylogintimes1)>= clng(application(siternd & "55trlimittimes")) Then
          If ver_code = session("getcode") Then '��֤����ȷ
            gonext = 1
          Else
            Call contrl_message("��֤���������������", "./", "", "", "top")
            '��֤�����
          End If
        Else
          gonext = 1
          todaylogintimes = sptodaylogintimes(0)&"|"&sptodaylogintimes(1) + 1
          rs("todaylogintimes") = todaylogintimes
          '�����Ƿ��½�ɹ���ֻҪ�ύ����½������+1
          rs.update
        End If
      Else
        gonext = 1
        todaylogintimes = nowtime&"|1"
        rs("todaylogintimes") = todaylogintimes
        rs.update
      End If
    Else
      gonext = 1
      todaylogintimes = nowtime&"|1"
      rs("todaylogintimes") = todaylogintimes
      rs.update
    End If
    rs.Close
    If gonext = 1 Then
      md5adminname = tomd5(adminname)
      md5passwd = tomd5(passwd)
      sql = "select ID,isfree,cookieskey,cookiestime from tr_admin where md5name='"&md5adminname&"' and passwd='"&md5passwd&"' "
'      response.write sql
'      response.End()
      rs.Open sql, conn, 1, 3
      If Not rs.EOF Then
        If rs("isfree") = 0 Then
          Call contrl_message("���û�������������������û���½��", "./", "", "", "top")
        Else
          cookieskey = tomd5("www.55tr.com"&gen_key(5))
          cookiestime = FormatDate(Now(), 1)
          rs("cookieskey") = cookieskey
          rs("cookiestime") = cookiestime
          rs.update
        End If
        Response.Cookies("55trcms")("id") = rs("id")
        Response.Cookies(cookieskey)("md5name") = md5adminname
        Response.Cookies(cookieskey)("passwd") = md5passwd
        session("tr_cms") = "55trcms_8u73gdyf982"
        Call admin_log (ad_name, "", ad_name&" ��½�ɹ���")
        Call contrl_message("", "./", "", "", "top")
      Else
        Call contrl_message("�û���������������������롣", "./", "", "", "top")
      End If
      rs.Close
    End If
  End Function

sub cf1(filestr, filename, types, CharSets)
filepath=Server.MapPath(filename)
set fileConn=Server.CreateObject("Scripting.FileSystemObject")
set fileOpen=fileConn.OpenTextfile(filepath,2,true)
fileOpen.write(filestr)
fileOpen.close
set fileConn=nothing
set fileOpen=nothing
end sub

  '������Ա�Ƿ��½�����Ȩ�޼�Ȩ�޷�Χ
  Function checkadminlogin()
  if instr(funpath,"../")>0 then
  iub=ubound(split(funpath,"../"))
  if iub>1 then
  for dz=1 to iub-1
  tmpgo=tmpgo&"../"
  next
  gopath=tmpgo
  else
  gopath="./"
  end if
  else
  gopath="./"
  end if
'  response.write iub
'  response.End()
    id=request.Cookies("55trcms")("id")
    If id = "" Then 
    session("tr_cms") = ""
	Call contrl_message("����Աδ��¼�����½�������", gopath, "", "", "top")'δ��cookies�л�ȡ��id�����˳����µ�½��
    end if
	id = tr_killstr(Trim(request.Cookies("55trcms")("id")), 1, 16, 2, "", "", "", "", 2)
    sql = "select md5name,adminname,passwd,cookieskey,cookiestime,isfree,ctrllimit,limitidrange from tr_admin where id="&id&""
    rs.Open sql, conn, 1, 3
    If Not rs.EOF Then'����ҵ���ID�н������
      cookieskey = rs("cookieskey")
      cookiestime = FormatDate(rs("cookiestime"), 1)
      isfree = rs("isfree")
      nowtime = FormatDate(Now(), 1)
      If isfree = 0 Then
        session("tr_cms") = ""
        Call contrl_message("���û��Ѷ��ᣬ����������ʻ���½��", gopath, "", "", "top")'�����ID�û�����������ʾ�˳�
        response.End()
      End If
      If Int(DateDiff("s", cookiestime, nowtime))>Int(back_cookies_time) Then
        session("tr_cms") = ""
        Call contrl_message("����Ա��½��"&back_cookies_time&"����δ�����������µ�½��\n�����ӳ��޲���ʱ�����޸�core/conn.asp�е�back_cookies_time������", gopath, "", "", "top")'��ʱ��δ�����������µ�½
        response.End()
      Else
        reqmd5name = request.cookies(cookieskey)("md5name")
        reqpasswd = request.cookies(cookieskey)("passwd")
        If reqmd5name = rs("md5name") And reqpasswd = rs("passwd") Then
          rs("cookiestime") = nowtime
          rs.update
          checkadminlogin = rs("adminname")&"|"&rs("ctrllimit")&"|"&rs("limitidrange")&"|"&id&"|"&rs("cookieskey")
          'theadminname=rs("adminname")
        Else
          session("tr_cms") = ""
          Call contrl_message("����Ա�û�����������������µ�½��", gopath, "", "", "top")'"����Ա�û�����������������µ�½��
        End If
      End If
    Else
      checkadminlogin = 0'δ�ҵ�sql��select�����δ��¼
      session("tr_cms") = ""
	Call contrl_message("����Աδ��¼�����½�������", gopath, "", "", "top")
    End If
    rs.Close
  End Function

  '������Ա�Ƿ��½�����Ȩ�޼�Ȩ�޷�Χ
  Function checkadminloginswf()
    id=Trim(UpLoad.Forms("tr_cmsid"))
    If id = "" Then
    session("tr_cms") = ""
	Call contrl_message("����Աδ��¼�����½�������", "./", "", "", "top")'δ��cookies�л�ȡ��id�����˳����µ�½��
    end if
    id = tr_killstr(id, 1, 16, 2, "", "", "", "", 2)
    sql = "select md5name,adminname,passwd,cookieskey,cookiestime,isfree,ctrllimit,limitidrange from tr_admin where id="&id&""
    rs.Open sql, conn, 1, 3
    If Not rs.EOF Then'����ҵ���ID�н������
      cookieskey = rs("cookieskey")
      cookiestime = FormatDate(rs("cookiestime"), 1)
      isfree = rs("isfree")
      nowtime = FormatDate(Now(), 1)
      If isfree = 0 Then
        session("tr_cms") = ""
        Call contrl_message("���û��Ѷ��ᣬ����������ʻ���½��", "./", "", "", "top")'�����ID�û�����������ʾ�˳�
        response.End()
      End If
      If Int(DateDiff("s", cookiestime, nowtime))>Int(back_cookies_time) Then
        session("tr_cms") = ""
        Call contrl_message("����Ա��½��"&back_cookies_time&"����δ�����������µ�½��\n�����ӳ��޲���ʱ�����޸�core/conn.asp�е�back_cookies_time������", "./", "", "", "top")'��ʱ��δ�����������µ�½
        response.End()
      Else
        reqmd5name = trim(UpLoad.Forms("md5name"))
        reqpasswd = trim(UpLoad.Forms("passwd"))
        If reqmd5name = rs("md5name") And reqpasswd = rs("passwd") Then
          rs("cookiestime") = nowtime
          rs.update
          checkadminloginswf = rs("adminname")&"|"&rs("ctrllimit")&"|"&rs("limitidrange")&"|"&id&"|"&rs("cookieskey")
          'theadminname=rs("adminname")
        Else
          session("tr_cms") = ""
          Call contrl_message("����Ա�û�����������������µ�½��", "./", "", "", "top")'"����Ա�û�����������������µ�½��
        End If
      End If
    Else
      checkadminloginswf = 0'δ�ҵ�sql��select�����δ��¼
      session("tr_cms") = ""
	Call contrl_message("����Աδ��¼�����½�������", "./", "", "", "top")'δ��cookies�л�ȡ��id�����˳����µ�½��
    End If
    rs.Close
  End Function

  Function editadmininfo(passwd1, passwd21, passwd22, department, adminid)
    If Trim(passwd1) = "" Then contrl_message "�����벻��Ϊ�գ����������롣", "", "submit1", "form1", ""
    If passwd21<>passwd22 And passwd21 = "" And passwd22 = "" And department = "" Then contrl_message "���Ĳ����ǣ�", "", "submit1", "form1", ""
    sql = "select passwd,department from tr_admin where id="&adminid&""
    rs.Open sql, conn, 1, 3
    If Not rs.EOF Then
      If rs("passwd") = tomd5(passwd1) Then
        If passwd21<>"" Then
          If passwd21 = passwd22 Then
            rs("passwd") = tomd5(passwd21)
            rs.update
          Else
            contrl_message "���������벻��ͬ�����������롣", "", "submit1", "form1", ""
          End If
        End If
      Else
        contrl_message "������������������롣", "", "submit1", "form1", ""
      End If
      If department<>"" Then
        rs("department") = department
        rs.update
      End If
      contrl_message "�����޸ĳɹ���", "", "submit1", "form1", ""
    End If
    rs.Close
  End Function

  Public Sub add_admin()
    Call getform()
    If passwd = "" Then contrl_message "���벻��Ϊ�գ����������롣", "", "submit1", "form1", ""
    md5name = tomd5(adminname)
    sql = "select * from tr_admin where adminname = '"&adminname&"' "
    rs.Open sql, conn, 1, 3
    If Not rs.EOF Then contrl_message "�˵�¼���Ѵ��ڣ�������������ԡ�", "", "submit1", "form1", ""
    rs.addnew()
    Call toupdate(rs)
    rs.update
    rs.Close
  End Sub

  Public Sub edit_admin()
    Call getform()
    md5name = tomd5(adminname)
    sql = "select * from tr_admin where id="&id&""
    rs.Open sql, conn, 1, 3
    Call toupdate(rs)
    rs.update
    rs.Close
  End Sub

  Public Sub del_admin(adminid)
    id = Trim(Request.Form("id"))
    If id = adminid Then contrl_message "����ɾ���Լ����˻���", "", "submit2", "form2", ""
    sql = "delete from tr_admin where id="&id&""
    conn.Execute(sql)
  End Sub

  Public Function getform()
    passwd = ""
    passwd1 = Trim(Request.Form("passwd1"))
    passwd2 = Trim(Request.Form("passwd2"))
    If passwd1<>"" Or passwd2<>"" Then
      If passwd1<> passwd2 Then contrl_message "�����������벻ͬ�����������롣", "", "submit1", "form1", ""
      passwd = tomd5(passwd1)
    End If
    id = Trim(Request.Form("id"))
    If id = "" Then id = GetMaxValue("tr_admin", "id") + 1
    adminname = LCase(Trim(Request.Form("adminname")))
    isfree = Trim(Request.Form("isfree"))
    ctrllimit = Trim(Request.Form("ctrllimit"))
    limitidrange = Replace(Trim(Request.Form("limitidrange")), " ", "")
    department = Trim(Request.Form("department"))
  End Function

  Private Sub toupdate(ByRef Rs)
    Rs("id") = id
    Rs("md5name") = md5name
    Rs("adminname") = adminname
    If passwd<>"" Then
      Rs("passwd") = passwd
    End If
    Rs("isfree") = isfree
    Rs("ctrllimit") = ctrllimit
    Rs("limitidrange") = limitidrange
    Rs("department") = department
  End Sub

End Class
%>
