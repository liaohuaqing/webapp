<%
Function RemoveHTML(str)
    Dim objRegExp, Match,strHTML
    if isnull(str) then
        str=""
    end if
    strHTML=str
    strHTML=replace(replace(replace(strHTML,vblf,""),vbcr,""),vbcrlf,"")

    Set objRegExp = New Regexp
    objRegExp.IgnoreCase = True
    objRegExp.Global = True

    objRegExp.Pattern = "<script[^>]*?>.*?</script>"
    strHTML  = objRegExp.Replace(strHTML,"")

    objRegExp.Pattern = "<style[^>]*?>.*?</style>"
    strHTML  = objRegExp.Replace(strHTML,"")

    objRegExp.Pattern = "<.+?>"
    strHTML  = objRegExp.Replace(strHTML,"")

    Set objRegExp = Nothing

    RemoveHTML=strHTML
End Function

%>