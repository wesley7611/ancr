require 'src/Game.rb'
require 'celluloid/io'
class Server
  include Celluloid::IO
  finalizer:shutdown
  
  def initialize
    puts ("server init")
   #super
   @playersConnected = Array.new
   @actors = Array.new
   @connections = Array.new
    @server = TCPServer.new("0.0.0.0", 28888)
   #@server.open(8088)
   puts @server
   async.run
  end
 
  
  def run
    loop { 
      async.handle_connection @server.accept
      @connections.each do |player|
        msg = player.recv(1024)
        puts msg
      end
    }
  end
  
  def handle_connection(socket)
    _, port, host = socket.peeraddr
    user = "#{host}:#{port}"
    puts "#{user} has joined the game"
    @playersConnected.push(Player.new(user))
    @connections.push(port)
    socket.send "#{Player}|#{user}", 0
    socket.send "#{port}", 0
    
    @playersConnected.each do |player|
      puts "A"
      puts player
    end
    puts "b"
  end
  
  Server.new
  
  
end