require 'src/Game.rb'

class Client < Game
  finalizer :shutdown
  def initialize
    super
    
  end
  Client.new.show
  
end