require 'gosu'
require 'celluloid/io'
require 'src/Room.rb'
require 'src/Player.rb'
#require 'src/Client.rb'
#require 'src/Host.rb'

class Game < Gosu::Window
  #include Celluloid::IO
  
  def initialize()
    super 640, 480
    self.caption = "ANCR"
    @room = Room.new("background/test.jpg")
    @players = Array.new
    #@player
    
  end
  
  def update
    def button_down(id)
      case id
       when Gosu::KB_LEFT
        @player.moveleft()
        
      when Gosu::KB_RIGHT
        @player.moveright()
      
      when Gosu::KB_UP
        @player.moveup()
      
      when Gosu::KB_DOWN
        @player.movedown()
      end
    end
  end
  
  def draw
   @room.getBackground().draw(0,0, 0)
   @players.each do |p|
     p.draw()
   end
   @player.draw()
   
  end
  
end



