require 'gosu'

class Room 
  
  def initialize(background)
    @background = Gosu::Image.new(background)
  end
  
  def getBackground()
    return @background
  end
end