from flask import Flask,render_template,request,url_for,send_from_directory,redirect,make_response,session
#from tree_mold  import tree_mold
from flask_session import Session
from about import aaa
import pymysql
import os
import re
import requests
import random
import urllib
import datetime
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField
from wtforms.validators import DataRequired
from flask_ckeditor import CKEditor, CKEditorField, upload_fail, upload_success
from datetime import timedelta
from pager import Pagination
from urllib.parse import urlencode
app = Flask(__name__)
ckeditor = CKEditor(app)
Session(app) 
basedir = os.path.abspath(os.path.dirname(__file__))
app.config['CKEDITOR_SERVE_LOCAL'] = True
app.config['CKEDITOR_HEIGHT'] = 400
app.config['CKEDITOR_FILE_UPLOADER'] = 'upload'
# app.config['CKEDITOR_ENABLE_CSRF'] = True  # if you want to enable CSRF protect, uncomment this line
app.config['UPLOADED_PATH'] = os.path.join(basedir, 'uploads1')

#app.secret_key = 'secret string'

app.register_blueprint(aaa, url_prefix="/")
 

# 打开数据库连接
db = pymysql.connect("localhost","root","liao1977","liao" )
# 使用cursor()方法获取操作游标 
cursor = db.cursor()
# SQL 查询语句
app.config['SESSION_TYPE'] = 'filesystem'

app.config['SECRET_KEY'] = os.urandom(24)

Session(app)

#session = requests.Session()

@app.route("/")
def index():
	aa1=""
	aa=""
	img=""
	aa2=""
	li = []
	sql1 = "SELECT * FROM config"
	try:
        # 执行SQL语句
   		cursor.execute(sql1)
        # 获取所有记录列表
   		results1 = cursor.fetchall()
   		
   		for r1 in results1:
   			aa1=r1[1]
   		#print (aa1) 
	except:
  		print ("Error: unable to fetch data")
	sql = "SELECT * FROM liaotb order by id desc"
	try:
        # 执行SQL语句
		cursor.execute(sql)
		db.commit()
        # 获取所有记录列表
		results = cursor.fetchall()
		session['username']= 'liaohuaqing'
		ss=session.get('username')
		print(ss) 
		aa2=results
		li=aa2
			
	except:
		print ("Error: unable to fetch data")

	pager_obj = Pagination(request.args.get("page",1),len(li),request.path,request.args,per_page_count=5) #可设置每页显示数量
	# print(request.args)
	index_list = li[pager_obj.start:pager_obj.end]
	html = pager_obj.page_html()
	#return render_template("pager.html",index_list=index_list, html = html)
	return render_template("index.html",site=aa1,name=index_list, html = html)
def gen_rnd_filename():
    filename_prefix = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    return '%s%s' % (filename_prefix, str(random.randrange(1000, 10000)))#app.register_blueprint(tree, url_prefix="/")
#app.register_blueprint(tree_mold, url_prefix="/ash")

def upcontent(title,class1,img,body):
	
	#print(body)
	nowTime=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')#现在时间
	if img=="":
		img="images/s.jpg"
	author="admin"
	sql_insert ="insert into liaotb(name,content,date1,img,author,classid) values('%s','%s','%s','%s','%s',%d)" % (title,body,nowTime,img,author,class1)
 
	try:
		cursor.execute(sql_insert)
		#提交
		db.commit()
	except Exception as e:
		#错误回滚
		print("bad!!")
		db.rollback() 
	finally:
		print("ok!!")
		#db.close()

@app.route("/add/", methods=['POST', 'GET'])
def add():
	li1=[]
	sql2 = "SELECT * FROM classtb"
	try:
        # 执行SQL语句
		cursor.execute(sql2)
		db.commit()
        # 获取所有记录列表
		results2 = cursor.fetchall()
		li1=results2
		print("results2:")
		print(results2)
	except:
		print ("Error2: unable to fetch data")
	form = PostForm()
	
	form.class1.choices=li1
	if form.validate_on_submit():
		title = form.title.data
		class1= form.class1.data
		img= form.img.data
		body = form.body.data
		# You may need to store the data in database here
		upcontent(title,class1,img,body)
		#return render_template('post.html', title=title, img=img, body=body)
		return redirect("/mlist")
	form.img.data="images/s.jpg"
	return render_template('add.html', form=form)

def editcontent(title,class1,img,body,post_id):
	
	#print(body)
	nowTime=datetime.datetime.now().strftime('%Y-%m-%d %H:%M:%S')#现在时间
	if img=="":
		img="images/s.jpg"
	author="admin"
	sql_insert ="update liaotb set name='%s',content='%s',date1='%s',img='%s',author='%s',classid=%d where id=%s" % (title,body,nowTime,img,author,int(class1),str(post_id))
	#print(sql_insert)	
	try:
		cursor.execute(sql_insert)
		#提交
		db.commit()
	except Exception as e:
		#错误回滚
		print("edit bad!!")
		db.rollback() 
	finally:
		print("edit ok!!")
		#db.close()
@app.route("/edit/<int:post_id>", methods=['POST', 'GET'])
def edit(post_id):
	aa2=""
	aa=""
	bb=""
	cc=""
	r2=""
	li1=[]
	sql = "SELECT * FROM liaotb where id=" + str(post_id)
	try:
        # 执行SQL语句
		cursor.execute(sql)
		#db.commit()
        # 获取所有记录列表
		results = cursor.fetchall()

		aa2=results
		for r in results:
			aa=r[6]
	except:
		print ("Error: unable to fetch data")

	sql2 = "SELECT * FROM classtb"
	try:
        # 执行SQL语句
		cursor.execute(sql2)
		db.commit()
        # 获取所有记录列表
		results2 = cursor.fetchall()
		li1=results2
		print("results2:")
		print(results2)
	except:
		print ("Error2: unable to fetch data")

	form = PostForm()
	
	print("classid:",aa)
	form.class1.choices=li1
	if form.validate_on_submit():
		title = form.title.data
		class1= form.class1.data
		img= form.img.data
		body = form.body.data
		# You may need to store the data in database here
		editcontent(title,class1,img,body,post_id)
		#return render_template('post.html', title=title, img=img, body=body)
		return redirect("/mlist")
	form.title.data=r[1]
	
	
	
	form.class1.data=aa
	#form.class1.coerce=int
	form.img.data=r[4]
	form.body.data=r[2]
	return render_template('edit.html', form=form)	
class PostForm(FlaskForm):
    title = StringField('Title')
    #class1 = StringField('Class1',validators=[DataRequired()])
    img = StringField('Image',validators=[DataRequired()])
    body = CKEditorField('Body', validators=[DataRequired()])
    class1 = SelectField('类别',coerce=int)
    submit = SubmitField('提  交')



@app.route('/files/<filename>')
def uploaded_files(filename):
    path = app.config['UPLOADED_PATH']
    return send_from_directory(path, filename)


@app.route('/upload', methods=['POST'])
def upload():
    f = request.files.get('upload')
    extension = f.filename.split('.')[1].lower()
    if extension not in ['jpg', 'gif', 'png', 'jpeg']:
        return upload_fail(message='Image only!')
    f.save(os.path.join(app.config['UPLOADED_PATH'], f.filename))
    url = url_for('uploaded_files', filename=f.filename)
    return upload_success(url=url)



if __name__ == '__main__':
    app.run(port=8001)