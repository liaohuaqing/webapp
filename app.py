from flask import Flask
from tree_mold  import tree_mold
from tree import tree
app = Flask(__name__)


app.register_blueprint(tree_mold, url_prefix="/oak")
app.register_blueprint(tree, url_prefix="/fir")
app.register_blueprint(tree_mold, url_prefix="/ash")


if __name__ == '__main__':
    app.run(port=8888)