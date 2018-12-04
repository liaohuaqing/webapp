#!usr/bin/env python
# -*- coding:utf-8 -*-
from flask import Flask,render_template,request,redirect
from pager import Pagination
from urllib.parse import urlencode
import pymysql
import os
import re
app = Flask(__name__)
# 打开数据库连接
db = pymysql.connect("localhost","root","liao1977","liao" )
# 使用cursor()方法获取操作游标 
cursor = db.cursor()
# SQL 查询语句


@app.route('/pager')
def pager():
    li = []
    aa="111"
    #for i in range(1,200):
     #   li.append(i)
    #print(li)

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
        li=results
        #for r in results:
            #li.append(r[1])

    except:
        print ("Error: unable to fetch data")
        aa="bbbbbb"
    print(aa)
    print(li)

    pager_obj = Pagination(request.args.get("page",1),len(li),request.path,request.args,per_page_count=10)
    # print(request.args)
    index_list = li[pager_obj.start:pager_obj.end]
    html = pager_obj.page_html()
    return render_template("pager.html",index_list=index_list, html = html)

if __name__ == '__main__':
    app.run(debug=True)