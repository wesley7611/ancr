require 'src/Game.rb'
require 'src/World.rb'
require 'src/ConnectionManager.rb'
class Server < Game
  finalizer:shutdown
  
  def initialize
   super
   @server = TCPServer.new("188.222.55.241", 8088)
   puts @server
   async.run
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