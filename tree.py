
from flask import Blueprint

tree= Blueprint("tree", __name__)

@tree.route("/hello")
def hello():
    return 'Hello, World'