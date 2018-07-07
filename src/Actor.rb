class Actor
  def initialize(name, image)
    @image = Gosu::Image.new(image)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
  end

  def warp(x, y)
    @x, @y = x, y
  end
  
  def moveleft
    @x = @x-32
  end
  
  def moveright
    @x += 32
  end
  
  def moveup
    @y -= 32
  end
  
  def movedown
    @y += 32
  end
  
 

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end