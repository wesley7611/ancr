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
    @server = TCPServer.new("0.0.0.0", 28888)
    #@server.open(8088)
    puts @server
    async.run

  end

  def run
    loop {
      async.handle_connection @server.accept

    }
  end

  def readMessage(socket, player)
    msg = socket.recv(30)
    data = msg.split"|"

    @playersConnected.each do |p|
      if p.getUser() == player
        p.setX(data[1])
        p.setY(data[2])
      end
      #puts "END"
    end
  end

  def handle_connection(socket)
    _, port, host = socket.peeraddr
    user = "#{host}:#{port}"
    puts "#{user} has joined the game"
    @playersConnected.push(Player.new(user))
    socket.send "#{user}", 0
    #socket.send "#{Player}|#{user}", 0
    #socket.send "#{port}", 0
    puts "PLAYER LIST"
    @playersConnected.each do |player|
      puts player
    end
    Thread.new{
      loop{
        readMessage(socket, user)
        #divide message
        #find array index
        #update character position in array
      }
    }
    Thread.new{
      loop{
        @playersConnected.each do |p|
          msg = p.getUser() + "|" + "#{p.getX}" + "|" + "#{p.getY}" 
          socket.send(msg, 0)
        end
      }
    }
  end

  Server.new

end