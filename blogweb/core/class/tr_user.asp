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


Class tr_user
  Public id
  Public username
  Public md5username
  Public passwd0
  Public passwd
  Public passwd1
  Public passwd2
  Public nickname
  Public qq
  Public homepage
  Public tel
  Public regtime
  Public lastlogintime
  Public lastsigntime
  Public signs
  Public gavesignpoints
  Public regip
  Public lastloginip
  Public age
  Public mail
  Public sex
  Public address
  Public zip
  Public birthday
  Public points
  Public signature
  Public intro
  Public photo
  Public headpic
  Public isfree
  Public gavecommentpoints
  Public gavearticlepoints
  Public ismailactivated
  Public isdel
  Public articlenum
  Public commentnum
  Public mailcode
  Public opencomment
  Public openarticle
  Public openuserreg
  Public openuserlogin
  Public edittime
  Public logcount
  Public safemd5

  Public Sub getfieldv(id)
    sql = "select * from tr_user where id="&id&""
    rs.Open sql, conn, 0, 1
    If Not rs.EOF Then
      Call getrs(2)
    End If
    rs.Close
  End Sub
  
  Public Sub usersign()
    safemd5 = trmd5(session(siternd & "_55tr.uname"))
    fnow = FormatDate(Now(), 1)
    sql = "select * from tr_user where safemd5='"&safemd5&"' and (datediff('d','"&fnow&"',lastsigntime)<>0 or lastsigntime is null )"
    rs.Open sql, conn, 1, 3
    If Not rs.EOF Then
      If DateDiff("d", rs("lastsigntime"), fnow) = 1 Then
        rs("signs") = rs("signs") + 1
      Else
        rs("signs") = 1
      End If
      rs("gavesignpoints") = rs("gavesignpoints") + application(siternd & "55trsignpoints")
      rs("lastsigntime") = fnow
      rs("points") = rs("points") + application(siternd & "55trsignpoints")
      rs.update
      rs.Close
      Call contrl_message("��ǩ���ɹ���", "", "", "", "")
    Else
      rs.Close
      Call contrl_message("�������Ѿ�ǩ�����ˡ�", "", "", "", "")
    End If
  End Sub

  Public Sub udelnew()
    id = tr_killstr(request.Form("id"), 1, 8, 1, "", "", "", "", 2)
    safemd5 = trmd5(session(siternd & "_55tr.uname"))
    sql = "select isdel from tr_article where contrimd5 ='"&safemd5&"' and id="&id&" and ispass=0 "
    rs.Open sql, conn, 1, 3
    If Not rs.EOF Then
      rs("isdel") = 1
      rs.update
      Call contrl_message("ɾ���ɹ���", "", "", "", "top")
    Else
      Call contrl_message("���ִ����޷�ɾ����", "", "", "", "top")
    End If
    rs.Close
  End Sub

  Public Sub ueditnews(how)'addΪ������£�editΪ�༭����
    safemd5 = trmd5(session(siternd & "_55tr.uname"))
    sql = "select * from tr_user where safemd5='"&safemd5&"'"
    rs.Open sql, conn, 0, 1
    Call getrs(1)
    rs.Close
    title = tr_killstr(request.Form("title"), 3, 100, 1, "", "submit1", "", "", 2)
    titlecolor = tr_killstr(request.Form("titlecolor"), 3, 16, 1, "", "submit1", "", "", 1)
    content = tr_killstr(request.Form("content"), 4, 99999, 1, "", "submit1", "", "", 2)
    keywords = tr_killstr(request.Form("keywords"), 3, 200, 1, "", "submit1", "", "", 1)
    descriptions = tr_killstr(request.Form("descriptions"), 3, 200, 1, "", "submit1", "", "", 1)
    columnid = tr_killstr(request.Form("columnid"), 2, 100, 1, "", "submit1", "", "", 2)
    id = tr_killstr(request.Form("id"), 1, 100, 1, "", "submit1", "", "", 2)
    columnname = getfieldvalue("tr_column", "colname", " and id="&columnid&" ", 1, "order by id desc")
    queueid = getfieldvalue("tr_column", "queueid", " and id="&columnid&" ", 1, "order by id desc")
    contributor = username
    contrimd5 = safemd5
    iscontribute = 1
    If how = "add" Then
      sql = "select * from tr_article where 1=2 "
      rs.Open sql, conn, 1, 3
      rs.addnew
      id = GetMaxValue("tr_article", "id") + 1
    ElseIf how = "edit" Then
      sql = "select * from tr_article where id="&id&" and contrimd5='"&safemd5&"' and isdel=0 and ispass=0 "
      rs.Open sql, conn, 1, 3
      If rs.EOF Then Call contrl_message("�������޷��༭����༭�������¡�", "", "", "", "")
    End If
    Rs("id") = id
    Rs("channelid") = 1
    Rs("title") = title
    Rs("titlecolor") = titlecolor
    Rs("content") = content
    Rs("keywords") = keywords
    Rs("descriptions") = descriptions
    Rs("addtime") = Now()
    Rs("author") = "����Ͷ��"
    Rs("sources") = "����Ͷ��"
    Rs("inputer") = "����Ͷ��"
    Rs("columnid") = columnid
    Rs("queueid") = queueid
    Rs("columnname") = columnname
    Rs("isfocus") = 0
    Rs("isroll") = 0
    Rs("isindextop") = 0
    Rs("islisttop") = 0
    Rs("iscommend") = 0
    Rs("isrollimg") = 0
    Rs("picfiles") = ""
    Rs("pgcount") = 1
    Rs("isdel") = 0
    Rs("iscontribute") = iscontribute
    Rs("contributor") = contributor
    Rs("contrimd5") = contrimd5
    Rs("isabout") = 0
    Rs("isgavepoints") = 0
    If application(siternd & "55tropencheckarticle") = 0 Then
      Rs("ispass") = 1
      Rs("isgavepoints") = 1
      sql = "select * from tr_user where safemd5='"&safemd5&"'"
      rs2.Open sql, conn, 1, 3
      rs2("gavearticlepoints") = rs2("gavearticlepoints") + application(siternd & "55trpublisharticlepoints")
      rs2("points") = rs2("points") + application(siternd & "55trpublisharticlepoints")
      rs2.update
      rs2.Close
	  givejf=true
    Else
      Rs("ispass") = 0
	  givejf=false
    End If
    rs.update
    rs.Close
	if givejf=true and how="add" then
	Call contrl_message("�������³ɹ�����������"&application(siternd & "55trpublisharticlepoints")&"���֡�", "", "", "", "")
	elseif givejf=false and how="add" then
	Call contrl_message("�������³ɹ��������ͨ���󣬻�������"&application(siternd & "55trpublisharticlepoints")&"���֡�", "", "", "", "")
	end if
	if how="edit" then Call contrl_message("�������³ɹ���", "", "", "", "")

  End Sub

  Function truserislog(alert)'alert,1���棬2������
    sessionuname = session(siternd & "_55tr.uname")
    If Len(sessionuname) >1 Then
      sql = "select * from tr_user where safemd5='"&trmd5(sessionuname)&"'"
      rs.Open sql, conn, 0, 1
      If Not rs.EOF Then
        Call getrs(2)
        truserislog = session(siternd & "_55tr.uname")
      Else
        If alert = 1 Then
          Call contrl_message("����δ��¼�����½����в�����", funpath&"user/login.asp", "", "", "top")
        Else
          response.End()
        End If
      End If
      rs.Close
    Else
      truserislog = ""
      If alert = 1 Then
        Call contrl_message("����δ��¼�����½����в�����", funpath&"user/login.asp", "", "", "top")
      End If
    End If
  End Function

  Function truserlogin()
    gonext = 0
    nowtime = FormatDate(Now(), 1)
    username = LCase(tr_killstr(request.Form("username"), 5, 50, 2, "", "submit1", "", "", 2))
    passwd = tr_killstr(request.Form("passwd"), 5, 50, 2, "", "submit1", "", "", 2)
    vcode = tr_killstr(request.Form("vcode"), 1, 4, 2, "", "submit1", "", "", 2)
    If vcode = tr_killstr(session("getcode"), 1, 4, 2, "", "submit1", "", "", 2) Then
      gonext = 1
    Else
      Call contrl_message("��֤���������������", "./login.asp", "", "", "top")
    End If
    If gonext = 1 Then
      md5username = tomd5(username)
      md5passwd = tomd5(passwd)
      sql = "select ID,isfree,isdel,lastloginip,username,lastlogintime,ismailactivated,logcount,points,safemd5 from tr_user where md5username='"&md5username&"' and passwd='"&md5passwd&"' "
      rs.Open sql, conn, 1, 3
      If Not rs.EOF Then
        If rs("isfree") = 0 Then
          Call contrl_message("���û�����������Ҫ��˺���ʹ�ã��������Ա���������", "", "submit1", "form1", "")
        ElseIf rs("isdel") = 1 Then
          Call contrl_message("���û���ɾ�����������Ա����ָ����û�������ע�ᡣ", "", "submit1", "form1", "")
        ElseIf rs("ismailactivated") = 0 Then
          Call contrl_message("���û�����δ����뼤�����е�½��", "", "submit1", "form1", "")
        Else
          session(siternd & "_55tr.uname") = Trim(rs("username"))
          lstip = rs("lastloginip")
          If Len(lstip)>7 Then
            ublstip = UBound(Split(lstip, ","))
          ElseIf ublstip<10 Then
            lstip = lstip&","&getip()
          ElseIf ublstip = 10 Then
            lstip = lstip&",|"&getip()
          ElseIf ublstip>10 And ublistip<20 Then
            lstip = lstip&","&getip()
          ElseIf ublstip>= 20 Then
            splstip2 = Split(lstip, "|")
            lstip = splstip2(0)&Mid(splstip2(1), InStr(splstip2(1), ","), Len(splstip2(1)))&","&getip()
          End If
          If DateDiff("d", rs("lastlogintime"), nowtime)<>0 Or IsNull(rs("lastlogintime")) Then
            rs("points") = rs("points") + application(siternd & "55trloginpoints")
            If IsNull(rs("logcount")) Or rs("logcount") = "" Then
              rs("logcount") = 1
            Else
              rs("logcount") = rs("logcount") + 1
            End If
          End If
          rs("lastlogintime") = nowtime
          rs("lastloginip") = lstip
          rs.update
        End If
        Response.Redirect("./sign.asp")
      Else
        Call contrl_message("��¼���ɹ����û���������������������롣", "", "submit1", "form1", "")
      End If
      rs.Close
    End If
  End Function

  Public Sub userreg()
    Call getform(1)
    If Len(passwd1)<5 Or passwd1<>passwd2 Then
      Call contrl_message("�������벻ͬ�����볤��С��5���ַ�������������", "", "submit1", "form1", "")
    End If
    vcode = tr_killstr(request.Form("vcode"), 1, 4, 2, "", "submit1", "", "", 2)
    If vcode<>tr_killstr(session("getcode"), 1, 4, 2, "", "submit1", "", "", 2) Then
      Call contrl_message("��֤���������������", "", "submit1", "form1", "")
    End If
    md5username = tomd5(username)
    passwd = tomd5(passwd1)
    regtime = Now()
    lastlogintime = ""
    regip = getIP()
    lastloginip = ""
    points = application(siternd & "55trinitialpoints")
    photo = ""
    headpic = ""
    If application(siternd & "55tropencheckuser") = 1 Then
      isfree = 0
    Else
      isfree = 1
    End If
    gavecommentpoints = 0
    gavearticlepoints = 0
    ismailactivated = 1
    isdel = 0
    articlenum = 0
    commentnum = 0
    mailcode = 0
    opencomment = 1
    openarticle = 1
    openuserlogin = 1
    edittime = ""
    logcount = 0
    sql = "select * from tr_user where 1=2 "
    rs.Open sql, conn, 1, 3
    rs.addnew()
    Call toupdate(rs, 1)
    rs("passwd") = passwd
    Rs("regtime") = regtime
    rs.update
    rs.Close
    Call contrl_message("ע��ɹ������ھͿ��Ե�½�ˡ�", "./login.asp", "", "form1", "top")
  End Sub
  
  Public Sub useredit()'requesttype�������ͣ�1��Աע�ᣬ2��Ա�༭��3����Ա��ӣ�4����Ա�༭
    safemd5 = trmd5(session(siternd & "_55tr.uname"))
    Call getform(2)
    md5passwd0 = tomd5(passwd0)
    If passwd2<>"" Then
      If Len(passwd1)<5 Or passwd1<>passwd2 Then
        Call contrl_message("�������벻ͬ�����볤��С��5���ַ�������������", "", "submit1", "form1", "")
      End If
      passwd = tomd5(passwd1)
    Else
      passwd = md5passwd0
    End If
    edittime = Now()
    sql = "select * from tr_user where safemd5='"&safemd5&"' and passwd='"&md5passwd0&"' "
    rs.Open sql, conn, 1, 3
    If Not rs.EOF Then
      Call toupdate(rs, 2)
      Rs("passwd") = passwd
      rs.update
      Call contrl_message("�����޸ĳɹ�", "", "submit1", "form1", "")
    Else
      Call contrl_message("ԭʼ���벻��ȷ������������", "", "submit1", "form1", "")
    End If
    rs.Close
  End Sub

  Public Sub adminadduser()
    Call getform(3)
    If Len(passwd1)<5 Or passwd1<>passwd2 Then
      Call contrl_message("�������벻ͬ�����볤��С��5���ַ�������������", "", "sutmit1", "form1", "")
    End If
    md5username = tomd5(username)
    passwd = tomd5(passwd1)
    regtime = Now()
    lastlogintime = ""
    regip = getIP() &"����ԱID:"&adminid&"���"
    lastloginip = ""
    points = application(siternd & "55trinitialpoints")
    photo = ""
    headpic = ""
    isfree = 1
    gavecommentpoints = 0
    gavearticlepoints = 0
    ismailactivated = 1
    isdel = 0
    articlenum = 0
    commentnum = 0
    mailcode = 0
    opencomment = 1
    openarticle = 1
    openuserlogin = 1
    edittime = ""
    logcount = 0
    sql = "select * from tr_user where 1=2 "
    rs.Open sql, conn, 1, 3
    rs.addnew()
    Call toupdate(rs, 3)
    Rs("passwd") = passwd
    rs.update
    rs.Close
  End Sub

  Public Sub adminedit()
    Call getform(4)
    If passwd2<>"" Then
      If Len(passwd1)<5 Or passwd1<>passwd2 Then
        Call contrl_message("�������벻ͬ�����볤��С��5���ַ�������������", "", "submit1", "form1", "")
      End If
      passwd = tomd5(passwd1)
    End If

    edittime = Now()
    sql = "select * from tr_user where id="&id&""
    rs.Open sql, conn, 1, 3
    Call toupdate(rs, 4)
    If passwd2<>"" Then
      Rs("passwd") = passwd
    End If
    rs.update
    rs.Close
  End Sub

  Public Sub del()
    id = Trim(Request.Form("id"))
    sql = "delete from tr_user where id="&id&""
    conn.Execute(sql)
  End Sub

  Public Function getform(requesttype)'requesttype�������ͣ�1��Աע�ᣬ2��Ա�༭��3����Ա��ӣ�4����Ա�༭
    If requesttype = 2 Then
      passwd0 = Trim(Request.Form("passwd0"))
    End If
    If requesttype<>2 And requesttype<>4 Then
      username = LCase(tr_killstr(Trim(request.Form("username")), 5, 30, 2, "", "submit1", "", "", 2))
      If InStr(application(siternd & "55trforbidusername"), ","&username&",")>0 Then Call contrl_message ("��¼���������дʣ��������", "", "submit1", "form1", "")
      If getfieldvalue("tr_user", "id", " and safemd5='"&trmd5(username)&"'", 1, " order by id desc ")<>"" Then Call contrl_message ("��¼���Ѵ��ڣ��������", "", "submit1", "form1", "")
      safemd5 = trmd5(username)
    End If
    If requesttype<>2 Then
      id = tr_killstr(Trim(request.Form("id")), 1, 8, 3, "", "submit1", "", "", 1)
      If id = 0 Then id = GetMaxValue("tr_user", "id") + 1
      mail = LCase(tr_killstr(Trim(request.Form("mail")), 3, 30, 2, "", "submit1", "", "", 2))
      If getfieldvalue("tr_user", "id", " and mail='"&mail&"' and safemd5<>'"&trmd5(username)&"' " , 1, " order by id desc ")<>"" Then Call contrl_message ("�����Ѵ��ڣ��������", "", "submit1", "form1", "")
      points = Trim(Request.Form("points"))
      isfree = Trim(Request.Form("isfree"))
      If isfree = "" Then isfree = 0
      gavecommentpoints = Trim(Request.Form("gavecommentpoints"))
      If gavecommentpoints = "" Then gavecommentpoints = 0
      gavearticlepoints = Trim(Request.Form("gavearticlepoints"))
      If gavearticlepoints = "" Then gavearticlepoints = 0
      isdel = Trim(Request.Form("isdel"))
      If isdel = "" Then isdel = 0
      opencomment = Trim(Request.Form("opencomment"))
      If opencomment = "" Then opencomment = 0
      openarticle = Trim(Request.Form("openarticle"))
      If openarticle = "" Then openarticle = 0
      openuserreg = Trim(Request.Form("openuserreg"))
      If openuserreg = "" Then openuserreg = 0
      openuserlogin = Trim(Request.Form("openuserlogin"))
      If openuserlogin = "" Then openuserlogin = 0
      articlenum = Trim(Request.Form("articlenum"))
      If articlenum = "" Then articlenum = 0
      commentnum = Trim(Request.Form("commentnum"))
      If commentnum = "" Then commentnum = 0
    End If
    passwd1 = Trim(Request.Form("passwd1"))
    passwd2 = Trim(Request.Form("passwd2"))
    nickname = tr_killstr(Trim(request.Form("nickname")), 3, 30, 2, "", "submit1", "", "", 1)
    qq = tr_killstr(Trim(request.Form("qq")), 3, 30, 2, "", "submit1", "", "", 1)
    homepage = tr_killstr(Trim(request.Form("homepage")), 3, 30, 2, "", "submit1", "", "", 1)
    tel = tr_killstr(Trim(request.Form("tel")), 1, 30, 3, "", "submit1", "", "", 1)
    If tel = 0 Then tel = null
    age = tr_killstr(Trim(request.Form("age")), 1, 30, 3, "", "submit1", "", "", 1)
    If age = 0 Then age = null
    sex = tr_killstr(Trim(request.Form("sex")), 1, 30, 3, "", "submit1", "", "", 1)
    If sex = 0 Then sex = null
    zip = tr_killstr(Trim(request.Form("zip")), 1, 30, 3, "", "submit1", "", "", 1)
    If zip = 0 Then zip = null
    address = tr_killstr(Trim(request.Form("address")), 3, 50, 2, "", "submit1", "", "", 1)
    birthday = Trim(request.Form("birthday"))
    If Not IsDate(birthday) Then birthday = null
    signature = tr_killstr(Trim(request.Form("signature")), 3, 300, 2, "", "submit1", "", "", 1)
    intro = tr_killstr(Trim(request.Form("intro")), 3, 300, 2, "", "submit1", "", "", 1)
    photo = tr_killstr(Trim(request.Form("photo")), 3, 50, 2, "", "submit1", "", "", 1)
    headpic = tr_killstr(Trim(request.Form("headpic")), 3, 50, 2, "", "submit1", "", "", 1)
  End Function

  Private Sub toupdate(ByRef Rs, requesttype)'�������ͣ�1��Աע�ᣬ2��Ա�༭��3����Ա��ӣ�4����Ա�༭
    If requesttype = 1 Or requesttype = 3 Then
      Rs("id") = id
      Rs("username") = username
      Rs("md5username") = md5username
      rs("safemd5") = safemd5
      Rs("regtime") = regtime
      Rs("regip") = regip
      Rs("signs") = 0
      Rs("gavesignpoints") = 0
    End If
    If requesttype<>2 Then
      Rs("points") = points
      Rs("isfree") = isfree
      Rs("mail") = mail
      Rs("gavecommentpoints") = gavecommentpoints
      Rs("gavearticlepoints") = gavearticlepoints
      Rs("ismailactivated") = ismailactivated
      Rs("articlenum") = articlenum
      Rs("commentnum") = commentnum
      Rs("opencomment") = opencomment
      Rs("openarticle") = openarticle
      Rs("openuserreg") = openuserreg
      Rs("openuserlogin") = openuserlogin
    End If
    If requesttype = 4 Then
      Rs("isdel") = isdel
    End If
    If requesttype = 2 Or requesttype = 4 Then
      Rs("edittime") = edittime
    End If
    Rs("nickname") = nickname
    Rs("qq") = qq
    Rs("homepage") = homepage
    Rs("tel") = tel
    Rs("age") = age
    Rs("sex") = sex
    Rs("address") = address
    Rs("zip") = zip
    Rs("birthday") = birthday
    Rs("signature") = signature
    Rs("intro") = intro
    'Rs("photo")=photo
    'Rs("headpic")=headpic
  End Sub

  Private Sub getrs(gettype)'1Ϊ��ȡ�û�����md5���û�����2�ǻ�ȡ����
    username = Rs("username")
    If gettype<>1 Then
      id = Rs("id")
      md5username = Rs("md5username")
      passwd = Rs("passwd")
      nickname = Rs("nickname")
      qq = Rs("qq")
      homepage = Rs("homepage")
      tel = Rs("tel")
      regtime = Rs("regtime")
      lastlogintime = Rs("lastlogintime")
      regip = Rs("regip")
      lastloginip = Rs("lastloginip")
      age = Rs("age")
      mail = Rs("mail")
      sex = Rs("sex")
      address = Rs("address")
      zip = Rs("zip")
      birthday = Rs("birthday")
      points = Rs("points")
      signature = Rs("signature")
      intro = Rs("intro")
      photo = Rs("photo")
      headpic = Rs("headpic")
      isfree = Rs("isfree")
      gavecommentpoints = Rs("gavecommentpoints")
      gavearticlepoints = Rs("gavearticlepoints")
      ismailactivated = Rs("ismailactivated")
      isdel = Rs("isdel")
      articlenum = Rs("articlenum")
      commentnum = Rs("commentnum")
      mailcode = Rs("mailcode")
      opencomment = Rs("opencomment")
      openarticle = Rs("openarticle")
      openuserreg = Rs("openuserreg")
      openuserlogin = Rs("openuserlogin")
      edittime = Rs("edittime")
      signs = Rs("signs")
      lastsigntime = Rs("lastsigntime")
      gavesignpoints = Rs("gavesignpoints")
      logcount = Rs("logcount")
    End If
  End Sub

End Class
%>
