require 'gosu'



class Room 
  
  def initialize()
    @background = Gosu::Image.new("background/test.jpg")
    
  end
  
  def getBackground()
    return @background
  end

end


class Main < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "ANCR"
    @room = Room.new()
    
  end
  
  def update
    # ...
  end
  
  def draw
   @room.getBackground().draw(0,0, 0)
  end
  
end

Main.new.show

