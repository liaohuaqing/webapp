<!--#include file="../inc/conn.asp"-->
<%dim action
action=request("action")
select case action
		case "news_hits"
		call news_hits()
		case else
		call main()
end select
		sub main()%>
<%
end sub		
sub news_hits()
dim hits_sql 
dim hits_rs 
set hits_rs=server.createobject("adodb.recordset") 
hits_sql="select * from ft_news where id="&request("id") 
hits_rs.open hits_sql,conn,1,3 
conn.execute "update ft_news set hits=hits+1 where id="&request("id") 
%>
<% 
hits_rs.close 
Set hits_rs = Nothing 
conn.close 
set conn=Nothing
end sub 
%>