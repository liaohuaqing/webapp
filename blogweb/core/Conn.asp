<%
'*******************�����������********************
Const data_type = "access"'Ϊaccess��mssql
Const back_cookies_time = "48000"'��λΪ�룬������д1200��
Const siternd = "55tr"'ͬ�������·��ö��׳���ʱ�轫�˸�Ϊ��ͬ���ַ�
ishtml = application(siternd & "55trurltype")'�����Ƿ�Ϊ��̬�汾
htmlpath = application(siternd & "55trhtmlurl")&"/"'��̬ҳ��洢�ļ���
if not isnumeric(ishtml) then
ishtml=1
end if
mishtml = application(siternd & "55trmurltype")'�ֻ�������Ƿ�Ϊ��̬�汾
if not isnumeric(mishtml) then
mishtml=1
end if
mhtmlpath = application(siternd & "55trmhtmlurl")&"/"'�ֻ��澲̬ҳ��洢�ļ���
'response.write ishtml
Const trversion = "55TR_AH_AccJS_GV"'����汾����Ҫ�޸ķ������

dim dburl,ser_dburl,fs,conn,connstr,rs,rs1,rs2,havefile
'*******************���ݿ�����********************
Select Case data_type
  Case "access"
    dburl = dbpath&"db/%66$9&&##_55tr.asa"
    ser_dburl = server.MapPath("./"&dburl)
    Set fs = Server.CreateObject("Scripting.FileSystemObject")
    Set conn = server.CreateObject("adox.catalog")
    If fs.FileExists(ser_dburl) Then '�ж��ļ��Ƿ����
      havefile = 1
    End If
    Set conn = Nothing
    connstr = "provider=microsoft.jet.oledb.4.0;data source="&ser_dburl
End Select
Set rs = server.CreateObject("adodb.recordset")
Set rs1 = server.CreateObject("adodb.recordset")
Set rs2 = server.CreateObject("adodb.recordset")
Set conn = server.CreateObject("adodb.connection")
Call OpenConn()
Private Sub OpenConn()
  On Error Resume Next
  Conn.Open ConnStr
  If Err.Number<>0 Then
    Response.Write("���ݿ����ӳ��ִ���")
'    Response.Write(Err.Description)
    Err.Clear
    Response.End()
  Else
    On Error GoTo 0
  End If
End Sub

Private Sub CloseConn()
  Conn.Close
  Set Conn = Nothing
  Set rs = Nothing
  Set rs1 = Nothing
  Set rs2 = Nothing
  Set ctr_page = Nothing
  Set ctr_user = Nothing
  Set ctr_admin = Nothing
  Set ctr_ads = Nothing
  Set ctr_article = Nothing
  Set ctr_comment = Nothing
  Set ctr_column = Nothing
  Set ctr_link = Nothing
  Set ctr_site = Nothing
  Set ctr_ulev = Nothing
  Set ctr_link = Nothing
End Sub

If Application(siternd & "55trsitetitle") = "" Then
  Application.Lock()
  Sql = "select top 1 * from tr_system order by id desc "
  Rs.Open Sql, Conn, 1, 1
  d = rs.fields.Count -1
  For ns = 0 To d
    application(siternd&"55tr"& rs.fields(ns).Name) = rs(ns).Value
  Next
  Rs.Close
  Application.UnLock()
End If

%>
