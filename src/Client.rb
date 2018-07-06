require 'src/Game.rb'

class Client < Game
  finalizer :shutdown
  def initialize
    super
    @socket = TCPSocket.new "188.222.55.241", 8088
    
  end
  Client.new.show
  
end