__author__ = 'peter'

from bottle import Bottle, run, template, request
import bottle

import sae
import sys, os, hashlib, StringIO
import bencode
from BTL import BTFailure

bottle.debug(mode=True)
app = Bottle()

@app.route('/', method="GET")
def index():
    return template('index.tpl')

@app.route('/', method="POST")
def convert():
    data = request.files.torrent_file
    if data and data.file:
        torrent = data.file.read() # This is dangerous for big files
        filename = data.filename
        try:
            metainfo = bencode.bdecode(torrent)
            info = metainfo['info']
            btih=hashlib.sha1(bencode.bencode(info)).hexdigest()
            dn=metainfo['info']['name']
            link=template('magnet:?xt=urn:btih:{{btih}}&dn={{dn}}', btih=btih, dn=dn)
            return template('success.tpl', link=link)
        except BTFailure:
            return template('notice.tpl', error=template('{{filename}} is not a valid .torrent file', filename=filename))

application = sae.create_wsgi_app(app)