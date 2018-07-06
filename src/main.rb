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
    if Gosu.button_down? Gosu::KB_LEFT or Gosu::button_down? Gosu::GP_LEFT
          @player.moveleft
    end
    if Gosu.button_down? Gosu::KB_RIGHT or Gosu::button_down? Gosu::GP_RIGHT
          @player.moveright
    end
    if Gosu.button_down? Gosu::KB_UP or Gosu::button_down? Gosu::GP_UP
          @player.moveup
    end
    if Gosu.button_down? Gosu::KB_DOWN or Gosu::button_down? Gosu::GP_DOWN
          @player.movedown
    end
    
    #@player.move
  end
  
  def draw
   @room.getBackground().draw(0,0, 0)
   @player.draw()
   
  end
  
end


Main.new.show

