<%
'如下为封装好的加水印程序
Function AddWater(n) 
Set Photo = Server.CreateObject("Persits.Jpeg") 
PhotoPath = Server.MapPath(n) '调用图片
Photo.Open PhotoPath 
Photo.Interpolation=1 
Photo.Quality=100 '图片质量
iWidth=Photo.OriginalWidth 
iHeight=Photo.OriginalHeight 
iiwidth=waterwidth '水印图片宽度，自定义
iiheight=waterheight '水印图片高度，自定义
Photo.Canvas.DrawPNG iWidth-iiWidth-15, iHeight-iiHeight-15,Server.MapPath(watermark) 'watermark为水印文件
Photo.save Server.mappath(n) '再次保存文件
Set Photo = Nothing 
End Function
%>