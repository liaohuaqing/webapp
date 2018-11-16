<%
function createfile(byval content,byval filedir)
	on error resume next
	dim obj : set obj = server.createobject("adodb.Stream")
	obj.type = 2
	obj.open
	obj.charset = "utf-8"
	obj.position = obj.Size
	obj.writeText = content
	obj.savetofile server.mappath(filedir), 2
	obj.close
	if err then err.clear: createfile = false else createfile = true
	set obj = nothing
End function
%>