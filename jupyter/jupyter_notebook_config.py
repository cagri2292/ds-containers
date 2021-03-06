# Set options for certfile, ip, password, and toggle off
# browser auto-opening
c.NotebookApp.certfile = u'/home/jpy3/.ssl/mycert.pem'
c.NotebookApp.keyfile = u'/home/jpy3/.ssl/mykey.key'
# Set ip to '*' to bind on all interfaces (ips) for the public server
c.NotebookApp.ip = '*'
c.NotebookApp.password = u'sha1:c2b4768e9f2f:ae829e1c0b143757ef3cea54e7b6749087164158'
c.NotebookApp.open_browser = False

# It is a good idea to set a known, fixed port for server access
c.NotebookApp.port = 8888
