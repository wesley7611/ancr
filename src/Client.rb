require 'src/Game.rb'

class Client < Game
  finalizer :shutdown
  def initialize
    super
    @socket = TCPSocket.open("127.0.0.1", 8088)
  end
  Client.new.show
  
end