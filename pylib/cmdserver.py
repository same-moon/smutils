#!/usr/bin/env python

import inspect

from twisted.internet import reactor, defer

from twisted.web import server, static
from twisted.web.server import Site
from twisted.web.resource import Resource

class HttpCmdBase(Resource):
    isLeaf = True
    def __init__(self, name):
        self.name = name
        self.current_request = None
    def _get_link(self, target, text):
        return '<a href="%s">%s</a>' % (target, text)
    def _get_doc(self, title='', body='', js=''):
        if title == '':
            title = self.name
        return """<!DOCTYPE html> <!-- html 5 -->
<html>
<head>
%s
<title>%s</title>
</head>
<body>
%s
</body>
</html>
""" % (title, body)

    def cmd_sample_index(self, *args, **kwargs):
        body = '<ol>\n'
        body += '<li>%s</li>\n' % (self._get_link('foo', 'bar'))
        body += '</ol>\n'
        return self._get_doc(title='sample_app', body=body)
    def render_GET(self, request):
        self.current_request = request
        posargs = request.postpath
        kwargs = request.args
        cmdf = 'cmd_'+self.name
        if not hasattr(self, cmdf):
            return "no such method %s" % (self.name)
        func = getattr(self, cmdf)
        kwargs2 = {}
        for (k,v) in kwargs.items():
            if len(v) == 1:
                v = v[0]
            kwargs2[k] = v
        val = func(*posargs, **kwargs2)
        if isinstance(val, defer.Deferred):
            def cb(data):
                request.write(data)
                request.finish()
            def eb(failure):
                request.write(failure)
                request.finish()
            val.addCallback(cb)
            return server.NOT_DONE_YET
        elif inspect.isgenerator(val):
            for produced in val:
                request.write(produced)
            request.finish()
        else:
            assert isinstance(val, str)
            return val

def add_cmds_on_port(static_dir, dir_cmdclass, port):
    def _get_resource(clazz):
        class _Resource(Resource):
            def getChild(self, name, request):
                name2 = name
                if name == '':
                    name2 = 'index'
                return clazz(name2)
        return _Resource()
    root = static.File(static_dir)
    for d, cmdclass in dir_cmdclass.iteritems():
        root.putChild( d, _get_resource( cmdclass ) )
    factory = Site(root)
    reactor.listenTCP(port, factory)

if __name__ == "__main__":
    class FooResource( HttpCmdBase ):
        def __init__( self, name ):
            HttpCmdBase.__init__( self, name )
        def cmd_foo(self, *args, **kwargs):
            return 'foo' + ' , args are ' + str(args) + ' , kwargs are ' + str(kwargs)
    class BarResource( HttpCmdBase ):
        def __init__( self, name ):
            HttpCmdBase.__init__( self, name )
        def cmd_bar(self, *args, **kwargs):
            return 'bar' + ' , args are ' + str(args) + ' , kwargs are ' + str(kwargs)
    def go():
        add_cmds_on_port( '/tmp/static', {'dir1': FooResource,
                                          'dir2': BarResource},
                          8080 )
        print( 'listening on 8080' )
    reactor.callWhenRunning(go)
    reactor.run()
