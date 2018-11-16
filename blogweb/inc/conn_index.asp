<!--#include file="data_name.asp"-->
<%
Response.Buffer=True
Db = replace(data_name,"../","")
Connstr="Provider=Microsoft.Jet.OLEDB.4.0;Data Source="&Server.MapPath(db)
SqlNowString="Now()"
SqlChar="'"
On Error Resume Next
Set Conn=Server.CreateObject("ADODB.Connection")
Conn.open ConnStr
If Err Then
err.Clear
Set Conn = Nothing
Response.Write "网站数据库连接出错，请检查设置的数据库路径是否正确！"
Response.End
End If
On Error GoTo 0
%>
<%
set rs=conn.execute("select * from ft_site ")
if rs("webclose")=true then
response.write "<div align='center' style='font-size:30px; color:#FF0000;'><br /><br /><br />"&rs("webclosewhy")&"</div>"
response.end
else
ft_webname=rs("ft_webname")
ft_icpname=rs("icp")
end if
rs.close
set rs=nothing
%><!--#include file="config.asp"--><!--#include file="htmlurl.asp"-->