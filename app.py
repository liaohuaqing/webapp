from flask import Flask,render_template,request,url_for,send_from_directory,redirect,make_response
#from tree_mold  import tree_mold
#from tree import tree
from about import aaa
import pymysql
import os
import re
import json
import random
import urllib
import datetime
from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField
from wtforms.validators import DataRequired
from flask_ckeditor import CKEditor, CKEditorField, upload_fail, upload_success

app = Flask(__name__)
ckeditor = CKEditor(app)

basedir = os.path.abspath(os.path.dirname(__file__))
app.config['CKEDITOR_SERVE_LOCAL'] = True
app.config['CKEDITOR_HEIGHT'] = 400
app.config['CKEDITOR_FILE_UPLOADER'] = 'upload'
# app.config['CKEDITOR_ENABLE_CSRF'] = True  # if you want to enable CSRF protect, uncomment this line
app.config['UPLOADED_PATH'] = os.path.join(basedir, 'uploads1')

app.secret_key = 'secret string'

app.register_blueprint(aaa, url_prefix="/")
 

# 打开数据库连接
db = pymysql.connect("localhost","root","liao1977","liao" )
# 使用cursor()方法获取操作游标 
cursor = db.cursor()
# SQL 查询语句



@app.route("/")
def index():
	aa1=""
	aa=""
	img=""
	aa2=""
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
	sql = "SELECT * FROM liaotb"
	try:
        # 执行SQL语句
		cursor.execute(sql)
        # 获取所有记录列表
		results = cursor.fetchall()
   		#aa=results
		aa2=results
		for r in results:
			aa=aa+r[1]+"<br>"
			img=img+r[4]
			print (img)
	except:
		print ("Error: unable to fetch data")
		aa="bbbbbb"
	return render_template("index.html",site=aa1,name=aa2)

def gen_rnd_filename():
    filename_prefix = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    return '%s%s' % (filename_prefix, str(random.randrange(1000, 10000)))#app.register_blueprint(tree, url_prefix="/")
#app.register_blueprint(tree_mold, url_prefix="/ash")

def upcontent(title,body):
	
	#print(body)
	sql_insert ="insert into liaotb(name,content,date1,img,author) values('%s','%s','%s','%s','%s')" % (title,body,title,title,title)
 
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
    form = PostForm()
    if form.validate_on_submit():
        title = form.title.data
        body = form.body.data
        # You may need to store the data in database here
        upcontent(title,body)
        return render_template('post.html', title=title, body=body)
        
    return render_template('add.html', form=form)
class PostForm(FlaskForm):
    title = StringField('Title')
    body = CKEditorField('Body', validators=[DataRequired()])
    submit = SubmitField()



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