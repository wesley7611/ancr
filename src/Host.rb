require 'src/Game.rb'
require 'src/Server.rb'

class Host < Game
  #include Server
  def initialize
      super
      
      @socket = TCPSocket.new("localhost", 28888)
      #188.222.55.241
      puts @socket
      while @player.nil?
      @player = Player.new(@socket.recv(1024))
     puts @socket
      @socket.send("TEST", 0)
      #puts @player
      @player.warp(0, 0)
      end
  end
  
  Host.new.show
end