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
   unless @connections.nil?
   Thread.new{
       update
   }
   end
  end
 
  
  def run
    loop { 
      async.handle_connection @server.accept
    }
  end
  
  def update
    loop{ 
      
      #async.receiveFromPort
      @connections.each do |socket|
        msg = socket.recv(1024)
              puts msg
      end
    }
  end
  
  def handle_connection(socket)
    _, port, host = socket.peeraddr
    user = "#{host}:#{port}"
    puts "#{user} has joined the game"
    @playersConnected.push(Player.new(user))
    @connections.push(socket)
    socket.send "#{Player}|#{user}", 0
    socket.send "#{port}", 0
    puts "PLAYER LIST"
    @playersConnected.each do |player|
      puts player
    end
  end
  
  Server.new
  
  
end