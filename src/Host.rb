require 'src/Game.rb'
require 'src/Server.rb'

class Host < Game
  #include Server
  def initialize
      super
      
      @socket = TCPSocket.new("localhost", 28888)
      #188.222.55.241
      while @player.nil?
      @player = Player.new(@socket.recv(1024))
      @socket.write("TEST")
      #puts @player
      @player.warp(0, 0)
      end
  end
  
  Host.new.show
end