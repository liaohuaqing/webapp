from flask import Flask,redirect,url_for
#from tree_mold  import tree_mold
#from tree import tree
from about import aaa
from flask import render_template
import pymysql

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

#app.register_blueprint(tree, url_prefix="/")
#app.register_blueprint(tree_mold, url_prefix="/ash")


if __name__ == '__main__':
    app.run(port=8001)