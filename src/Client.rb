require 'src/Game.rb'

class Client < Game
  #finalizer :shutdown
  def initialize
    super
    @socket = TCPSocket.new("localhost", 28888)
    #188.222.55.241
    
    while 
      @player.nil?
      @player = Player.new(@socket.recv(1024))
      puts @player
      @player.warp(0, 0)
    end
  end
  Client.new.show
  
end