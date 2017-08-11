require "socket"
server = TCPServer.new 5678

while (session = server.accept)
  request = session.gets
  puts request

  session.print "HTTP/1.1 200\r\n"
  session.print "Content-Type: img/png\r\n"
  session.print "\r\n"
  session.print "Not actually an image but doesn't matter #{Time.now}"

  session.close
end
