# RUBY CLASSES FOR SPACESHIP PROGRAM

class Cursor
  #attr_reader: :x, :y, :width, :height, :highlighting
  def initialize(x, y)
		@color1 = 0xFF_0000FF
		@color2 = 0xFF_00FF00
    @x = x
    @y = y
    @z = 10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
    @width = 1
    @height = 1
    @imageTemp = Gosu::Image.load_tiles(".\\assets\\cursorBaseF.png", 23, 33)
    @imageTemp1 = Gosu::Image.load_tiles(".\\assets\\cursor2.png", 23, 33)
		@imageTemp2 = Gosu::Image.load_tiles(".\\assets\\cursorTop.png", 23, 33)
		@imageTemp3 = Gosu::Image.load_tiles(".\\assets\\cursorBaseT.png", 23, 33)
		@highlighting = true
  end
	
	def setColor(c, o, l)
		@color1 = c
		@color2 = o
		@color3 = l
	end
  
  def reposition(x, y)
    @x = x
    @y = y
  end
	
  def highlight
		@highlighting = true
	end
	
  def draw
	

	
		# SKIN ONE
		if @highlighting == true
			@imageTemp3.each do |tile, i|
				tile.draw(@x, @y, @z)
			end
			@image3 = @imageTemp3[(Gosu::milliseconds / 10 % @imageTemp3.size)]
			@image3.draw(@x, @y, @z + 0, 1, 1, Gosu::Color.argb(@color1))
		elsif @highlighting == false
			@imageTemp.each do |tile, i|
				tile.draw(@x, @y, @z)
			end
			@image = @imageTemp[(Gosu::milliseconds / 10 % @imageTemp.size)]
			@image.draw(@x, @y, @z + 0, 1, 1, Gosu::Color.argb(@color1))
		end
		
		# SKIN TWO
		@imageTemp1.each do |tile, i|
			tile.draw(@x, @y, @z)
		end
		@image1 = @imageTemp1[(Gosu::milliseconds / 10 % @imageTemp1.size)]
		@image1.draw(@x, @y, @z + 1, 1, 1, Gosu::Color.argb(@color2))
		
		# SKIN THREE
		@imageTemp2.each do |tile, i|
			tile.draw(@x, @y, @z)
		end
		@image2 = @imageTemp2[(Gosu::milliseconds / 10 % @imageTemp2.size)]
		@image2.draw(@x, @y, @z + 2)
		
		# SKIN FOUR
		#@imageTemp3.each do |tiles, i|
			#tiles.draw(@x, @y, @z)
		#end
		#@image3 = @imageTemp3[(Gosu::milliseconds / 10 % @imageTemp3.size)]
		#@image3.draw(@x, @y, @z + 3, 1, 1, Gosu::Color.argb(@color3))
	end
end

class PlayerShip
	def initialize(x, y)
		@color1 = 0xFF_0000FF
		@x = x
		@y = y
		@z = 100000000000000
		@height = 32
		@width = 28
		@imageTemp = Gosu::Image.load_tiles(".\\assets\\ship1BaseH.png", 28, 32)
    @imageTemp1 = Gosu::Image.load_tiles(".\\assets\\ship1Cockpit.png", 28, 32)
		@imageTemp2 = Gosu::Image.load_tiles(".\\assets\\ship1Thruster.png", 28, 40)
	end
	
	def moveForward
		@y -= 10
	end
	
	def moveBack
		@y += 5
	end
	
	def moveLeft
		@x -= 5
	end
	
	def moveRight
		@x += 5
	end
	
	def draw
	
		# BASE
		@imageTemp.each do |tile, i|
			tile.draw(@x, @y, @z)
		end
		@image = @imageTemp[(Gosu::milliseconds / 10 % @imageTemp.size)]
		@image.draw(@x, @y, @z + 0, 1, 1, Gosu::Color.argb(@color1))
		
		# COCKPIT
		@imageTemp.each do |tile, i|
			tile.draw(@x, @y, @z)
		end
		@image1 = @imageTemp1[(Gosu::milliseconds / 10 % @imageTemp1.size)]
		@image1.draw(@x, @y, @z + 1)
		
		# THRUSTER
		@imageTemp2.each do |tile, i|
			tile.draw(@x, @y, @z)
		end
		@image2 = @imageTemp2[(Gosu::milliseconds / 10 % @imageTemp2.size)]
		@image2.draw(@x, @y, @z)
	end
	
end	

