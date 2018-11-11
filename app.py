import logging;logging.basicConfig(level=logging.INFO)
import asyncio,os,json,time
from datetime import datetime
from aiohttp import web
def index(request):
	return web.response(body=b'<h1>Awesome</h1>')
def init(loop):
	app=web.Application(loop=loop)
	app.router.add_route('get','/',index)
	srv=yield from loop.create_server(app.mak_handler(),'127.0.0.1',9000)
	return srv
	pass
loop=asyncio.get_event_loop()
loop.run_until_complete(init(loop))
loop.run_forever()
