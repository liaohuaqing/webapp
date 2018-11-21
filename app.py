from flask import Flask,redirect,url_for
#from tree_mold  import tree_mold
#from tree import tree
from about import aaa
from flask import render_template,request,make_response
import pymysql
import os
import re
import json
import random
import urllib
import datetime
app = Flask(__name__)
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
@app.route("/add", methods=['POST', 'GET'])
def add():
	return render_template("add.html")
@app.route('/ckupload/', methods=['POST', 'OPTIONS'])
def ckupload():
    """CKEditor file upload"""
    error = ''
    url = ''
    callback = request.args.get("CKEditorFuncNum")

    if request.method == 'POST' and 'upload' in request.files:
        fileobj = request.files['upload']
        fname, fext = os.path.splitext(fileobj.filename)
        rnd_name = '%s%s' % (gen_rnd_filename(), fext)

        filepath = os.path.join(app.static_folder, 'upload', rnd_name)

        # 检查路径是否存在，不存在则创建
        dirname = os.path.dirname(filepath)
        if not os.path.exists(dirname):
            try:
                os.makedirs(dirname)
            except:
                error = 'ERROR_CREATE_DIR'
        elif not os.access(dirname, os.W_OK):
            error = 'ERROR_DIR_NOT_WRITEABLE'

        if not error:
            fileobj.save(filepath)
            url = url_for('static', filename='%s/%s' % ('upload', rnd_name))
    else:
        error = 'post error'

    res = """<script type="text/javascript">
  window.parent.CKEDITOR.tools.callFunction(%s, '%s', '%s');
</script>""" % (callback, url, error)

    response = make_response(res)
    response.headers["Content-Type"] = "text/html"
    return response

if __name__ == '__main__':
    app.run(port=8001)