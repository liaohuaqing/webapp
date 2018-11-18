
from flask import Blueprint
from flask import render_template
aaa= Blueprint("aaa", __name__)

@aaa.route("/about")
def about():
    return render_template("about.html")
    