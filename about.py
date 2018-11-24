
from flask import Blueprint
from flask import render_template,redirect,request,make_response,url_for
import pymysql
import datetime
import os
import random
aaa= Blueprint("aaa", __name__)

# 打开数据库连接
db = pymysql.connect("localhost","root","liao1977","liao" )
# 使用cursor()方法获取操作游标 
cursor = db.cursor()
# SQL 查询语句
@aaa.route("/about")
def about():
	return render_template("about.html") 


	
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
