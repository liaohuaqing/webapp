from flask import Flask,redirect,url_for
from tree_mold  import tree_mold
from tree import tree
from flask import render_template

app = Flask(__name__)

@app.route("/")
def index():
    return render_template("about.html")

app.register_blueprint(tree_mold, url_prefix="/oak")
app.register_blueprint(tree, url_prefix="/")
app.register_blueprint(tree_mold, url_prefix="/ash")


if __name__ == '__main__':
    app.run(port=8888)