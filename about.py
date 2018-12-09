
from flask import Blueprint
from flask import render_template,redirect,request,make_response,url_for,session
from PIL import Image, ImageFont, ImageDraw, ImageFilter
from io import BytesIO
import pymysql
import datetime
import os
import random
import requests
from pager import Pagination
from urllib.parse import urlencode
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired
aaa= Blueprint("aaa", __name__)
#session = requests.Session()
def validate_picture():
	total = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ012345789'
	# 图片大小130 x 50
	width = 130
	heighth = 60
	# 先生成一个新图片对象
	im = Image.new('RGB',(width, heighth), 'black')
	# 设置字体
	#font=ImageFont.load_default().font
	font = ImageFont.truetype('g:\\WINDOWS\\Fonts\\msyh.ttf', 40)
	# 创建draw对象
	draw = ImageDraw.Draw(im)
	str = ''
	# 输出每一个文字
	for item in range(3):
		text = random.choice(total)
		str += text
		draw.text((5+random.randint(4,7)+20*item,5+random.randint(3,7)), text=text, fill='white',font=font )

	# 划几根干扰线
	for num in range(8):
		x1 = random.randint(0, width/2)
		y1 = random.randint(0, heighth/2)
		x2 = random.randint(0, width)
		y2 = random.randint(heighth/2, heighth)
		draw.line(((x1, y1),(x2,y2)), fill='blue', width=1)
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
	session['image'] = str
	return response

@aaa.route("/login")
def login():
	print(session.get('image'))
	return render_template("login.html")

@aaa.route("/logout")
def logout():
	return redirect("/")

@aaa.route("/main")
def main():
	return render_template("main.html")

@aaa.route("/checkin", methods=['POST'])
def checkin():
	admin1=request.form.get('admin1')
	pass1=request.form.get('pass1')
	image1=request.form.get('code')
	print(session.get('image'))
	print("admin:",admin1)
	if admin1==pass1:
		print("ok!pass")
		return render_template("home.html")

	else:
		print("bad!")
		return render_template("login.html")

@aaa.route("/list/<int:post_id>")
def list(post_id):
	aa1=""
	aa=""
	img=""
	aa2=""
	li=[]
	if post_id=="":
		post_id=1
	sql1 = "SELECT * FROM config"
	try:
        # 执行SQL语句
   		cursor.execute(sql1)
        # 获取所有记录列表
   		results1 = cursor.fetchall()
   		
   		for r1 in results1:
   			aa=r1[1]
   		#print (aa) 
	except:
  		print ("Error: unable to fetch data")	
	sql1 = "SELECT * FROM liaotb where classid=%d order by id desc" %(post_id)
	try:
        # 执行SQL语句
   		cursor.execute(sql1)
   		db.commit()
        # 获取所有记录列表
   		results1 = cursor.fetchall()
   		aa1=results1
   		li=aa1
	except:
  		print ("Error: list unable to fetch data")
	#return render_template("list.html",data=aa1,site=aa)
	pager_obj = Pagination(request.args.get("page",1),len(li),request.path,request.args,per_page_count=5) #可设置每页显示数量
	# print(request.args)
	index_list = li[pager_obj.start:pager_obj.end]
	html = pager_obj.page_html()
	#return render_template("pager.html",index_list=index_list, html = html)
	return render_template("list.html",site=aa,name=index_list, html = html)
@aaa.route("/mlist")
def mlist():
	aa1=""
	aa=""
	img=""
	aa2=""
	li=[]
	sql1 = "SELECT * FROM liaotb order by id desc" 
	try:
        # 执行SQL语句
   		cursor.execute(sql1)
   		db.commit()
        # 获取所有记录列表
   		results1 = cursor.fetchall()
   		aa1=results1
   		li=aa1
	except:
  		print ("Error: list unable to fetch data")
	#return render_template("mlist.html",data=aa1,site=aa)
	pager_obj = Pagination(request.args.get("page",1),len(li),request.path,request.args,per_page_count=5) #可设置每页显示数量
	# print(request.args)
	index_list = li[pager_obj.start:pager_obj.end]
	html = pager_obj.page_html()
	#return render_template("pager.html",index_list=index_list, html = html)
	return render_template("mlist.html",site=aa,data=index_list, html = html)

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
   		db.commit()
        # 获取所有记录列表
   		results1 = cursor.fetchall()
   		aa1=results1
	except:
  		print ("Error: unable to fetch data")
	return render_template("view.html",vd=aa1,site=aa)
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
  return redirect("/list")


@aaa.route("/editclass/<int:post_id>", methods=['POST', 'GET'])   #编辑分类
def editclass(post_id):
	form = classform()
	class1=""
	aa1=""
	img=""
	class2=""
	cursor = db.cursor()
	sql1 = "SELECT * FROM classtb where id=%s" % (str(post_id))   #查询分类
	try:
		# 执行SQL语句
		cursor.execute(sql1)
		db.commit()
		# 获取所有记录列表
		results1 = cursor.fetchall()
		aa1=results1
	except:
		print ("Error: 查询分类unable to fetch data")
		
	if form.validate_on_submit():
		class1 = form.class1.data
		sql_insert ="update classtb set class='%s' where id=%s" % (class1,str(post_id))
		#print(sql_insert)	
		try:
			cursor.execute(sql_insert)
			#提交
			db.commit()
		except Exception as e:
			#错误回滚
			print("edit bad!!")
			db.rollback() 
		return redirect("/addclass")
		#return render_template('class.html', form=form, class1=class1)
	return render_template('editclass.html',form=form,class1=class2,data=aa1)

@aaa.route("/delclass/<int:post_id>")
def delclass(post_id):
  aa1=""
  aa=""
  img=""
  aa2=""
  cur = db.cursor()
  #sql1 = "delete from liaotb where id=1"
  sql1 = "delete from classtb where id=%d" %(post_id)
  try:
      print(sql1)
        # 执行SQL语句
      cur.execute(sql1)
        # 获取所有记录列表
      db.commit()
      print ("删除class成功！") 
  except:
      print ("Error:删除class失败")
      db.rollback()
  return redirect("/addclass")
@aaa.route("/addclass", methods=['POST', 'GET'])
def addclass():
	form = classform()
	aa1=""
	class1=""
	#print(form.class1.data)
	sql1 = "SELECT * FROM classtb"   #查询分类
	try:
        # 执行SQL语句
   		cursor.execute(sql1)
   		db.commit()
        # 获取所有记录列表
   		results1 = cursor.fetchall()
   		aa1=results1
	except:
  		print ("Error: unable to fetch data")
	if form.validate_on_submit():
		class1 = form.class1.data
		saveclass(class1)
		return redirect("/addclass")
		#return render_template('class.html', form=form, class1=class1)
	return render_template('class.html',form=form,data=aa1)
def saveclass(classname):
	class1=""
	#print(form.class1.data)
	#查询分类
	sql_insert ="insert into classtb(class) values('%s')" % (classname)
 
	try:
		cursor.execute(sql_insert)
		#提交
		db.commit()
	except Exception as e:
		#错误回滚
		print("add class bad!!")
		db.rollback() 
	#finally:
		#print("add class ok!!")
		#db.close()
	#return redirect("/addclass")	
class classform(FlaskForm):
    #class1 = StringField("class1",[Required()])
    class1 = StringField('Class1',validators=[DataRequired()])
    submit = SubmitField("Submit")