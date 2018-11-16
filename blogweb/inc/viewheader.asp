<script>
function addBookmark(title, url) {
if (window.sidebar) {
window.sidebar.addPanel
(title, url,"");
} else if( document.all ) {
window.external.AddFavorite( url, title);
} else {
alert("Sorry, your browser doesn't support this");
}
}
</script>
<div data-role="header" data-position="fixed" data-theme="b">
<a href="<%=webfolder%>list.asp?id=<%=class_id%>" data-icon="back" data-direction="reverse" class="ui-btn-left" data-transition="slidefade" data-inline="true">返回</a>
<h1><%=pagename%></h1>
</div>