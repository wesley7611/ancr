require 'gosu'

class Tutorial < Gosu::Window
  def initialize
    super 640, 480
    self.caption = "Tutorial Game"
  end
  
  def update
    # ...
  end
  
  def draw
    # ...
  end
end

Tutorial.new.show