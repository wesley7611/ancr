require 'gosu'
require 'src/Room.rb'
require 'src/Player.rb'

class Main < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "ANCR"
    @room = Room.new("background/test.jpg")
    @player = Player.new
    @player.warp(0, 0)
    
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
   @player.draw()
   
  end
  
end


Main.new.show

