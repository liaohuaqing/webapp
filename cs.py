#!/usr/bin/env python
# -*- coding:utf-8 -
import os
from flask import Flask,render_template,request,url_for,send_from_directory,redirect,make_response,session
#from tree_mold  import tree_mold
from flask_session import Session

  
app = Flask(__name__)
#app.debug = True
app.config['SESSION_TYPE'] = 'filesystem'

app.config['SECRET_KEY'] = os.urandom(24)

Session(app)

@app.route('/')
def index():
	session['user'] = 'liaohuaqing0'
	ss=session.get('user')				#注意是小括号shit
	return  render_template("index.html",site=ss)
@app.route('/main')
def main():
	session['user1'] = 'liaohuaqing1'
	ss=session.get('user')				#注意是小括号shit
	return  render_template("index.html",site=ss)  
if __name__ == '__main__':
  app.run()