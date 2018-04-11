# RUBY CLASSES FOR SPACESHIP PROGRAM

# Can you see changes Payton?
# Y/N
#I need ...Pills? NO

class Cursor
  attr_reader: :x, :y, :width, :height
  def initialize(x, y, c)
    @x = x
    @y = y
    @z = 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    @width = 1
    @height = 1
    @image = Gosu::Image.new("cursor.png")
    @path = "C:\\cursorimage.png"
  end
  
  def reposition(x, y)
    @x = x
    @y = y
  end
  
  def reskin(skin)
    if skin == 1
      @image = Gosu::Image.new("cursor.png")
    elsif skin == 2
      @image = Gosu::Image.new("cursor.png")
    elsif skin == 3
      @image = Gosu::Image.net("cursor.png")
    end
  end
  
  def draw
    @image.draw(@x, @y, @z)
  end
end

