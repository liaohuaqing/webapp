
from flask import Blueprint
from flask import render_template,redirect,request,make_response,url_for
from PIL import Image, ImageFont, ImageDraw, ImageFilter
from io import BytesIO
import pymysql
import datetime
import os
import random
aaa= Blueprint("aaa", __name__)
def validate_picture():
	total = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ012345789'
	# 图片大小130 x 50
	width = 130
	heighth = 60
	# 先生成一个新图片对象
	im = Image.new('RGB',(width, heighth), 'white')
	# 设置字体
	#font=ImageFont.load_default().font
	font = ImageFont.truetype('g:\\WINDOWS\\Fonts\\msyh.ttf', 40)
	# 创建draw对象
	draw = ImageDraw.Draw(im)
	str = ''
	# 输出每一个文字
	for item in range(5):
		text = random.choice(total)
		str += text
		draw.text((5+random.randint(4,7)+20*item,5+random.randint(3,7)), text=text, fill='black',font=font )

	# 划几根干扰线
	for num in range(8):
		x1 = random.randint(0, width/2)
		y1 = random.randint(0, heighth/2)
		x2 = random.randint(0, width)
		y2 = random.randint(heighth/2, heighth)
		draw.line(((x1, y1),(x2,y2)), fill='black', width=1)
	# 模糊下,加个帅帅的滤镜～
	im = im.filter(ImageFilter.FIND_EDGES)
	return im, str
# 打开数据库连接
db = pymysql.connect("localhost","root","liao1977","liao" )
# 使用cursor()方法获取操作游标 
cursor = db.cursor()
# SQL 查询语句
@aaa.route("/about")
def about():
	return render_template("about.html") 



@aaa.route('/code')
def get_code():
	image, str = validate_picture()
	# 将验证码图片以二进制形式写入在内存中，防止将图片都放在文件夹中，占用大量磁盘
	buf = BytesIO()
	image.save(buf, 'jpeg')
	buf_str = buf.getvalue()
	# 把二进制作为response发回前端，并设置首部字段
	response = make_response(buf_str)
	response.headers['Content-Type'] = 'image/gif'
	# 将验证码字符串储存在session中
	#session['image'] = str
	return response

@aaa.route("/login")
def login():
	return render_template("login.html") 
    

	
@aaa.route("/view/<int:post_id>")

def view(post_id):
	aa1=""
	aa=""
	img=""
	aa2=""
	sql1 = "SELECT * FROM config"
	try:
        # 执行SQL语句
   		cursor.execute(sql1)
   		db.commit()
        # 获取所有记录列表
   		results = cursor.fetchall()

   		for r in results:
   			aa=r[1]
	except:
  		print ("Error: unable to fetch data")
	sql1 = "SELECT * FROM liaotb where id=" + str(post_id)
	try:
        # 执行SQL语句
   		cursor.execute(sql1)
        # 获取所有记录列表
   		results1 = cursor.fetchall()
   		
   		for r1 in results1:
   			aa1=r1[1]
   		print (aa1) 
	except:
  		print ("Error: unable to fetch data")
	return render_template("view.html",vd=results1,site=aa)
@aaa.route("/delid/<int:post_id>")
def delid(post_id):
  aa1=""
  aa=""
  img=""
  aa2=""
  cur = db.cursor()
  #sql1 = "delete from liaotb where id=1"
  sql1 = "delete from liaotb where id=%d" %(post_id)
  try:
      print(sql1)
        # 执行SQL语句
      cur.execute(sql1)
        # 获取所有记录列表
      db.commit()
      print ("删除成功！") 
  except:
      print ("Error:删除失败")
      db.rollback()
  return redirect("/")
