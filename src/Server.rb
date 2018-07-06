require 'src/Game.rb'
class Server < Game
  finalizer:shutdown
  
  def initialize
   super
   @server = TCPServer.new("192.168.0.12", 8088)
   #@server.open(8088)
   puts @server
   run
  end
  
  def run
    loop { async.handle_connection @server.accept}
  end
  
  def handle_connection(socket)
    _, port, host = socket.peeraddr
    user = "#{host}:#{port}"
    puts "#{user} has joined the game"
  end
  
  Server.new.show
  
end