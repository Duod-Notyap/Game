# RUBY CLASSES FOR SPACESHIP PROGRAM

class Cursor
  attr_reader :x, :y, :width, :height, :highlighting
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
	attr_reader :angle, :x, :y, :z
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
		@angle = 0
	end
	
	def moveForward
	    aAngle = @angle.to_f
        bAngle = 90 # Right Angle Constant
	    while true
    	  if aAngle - 90.0 < 0
            break
          end
          aAngle -= 90.0
        end
		cAngle = 180 - bAngle - aAngle
		if cAngle > 90 || aAngle > 90
			puts aAngle.to_s + ", " + cAngle.to_s + " angle" + angle.to_s
			exit
		end
		aSide = (Math.sin(aAngle * (Math::PI / 360))/0.1)
		cSide = (Math.sin(cAngle * (Math::PI / 360))/0.1)
		if aSide < 0 || cSide < 0
			puts aSide.to_s + ", " + cSide.to_s + " side" + angle.to_s
			exit
		end
		if @angle%360 < 90
		    @x += 1 * aSide
			@y += -1 * cSide
		elsif @angle%360 > 90 && @angle%360 < 180
			@x += 1 * cSide
			@y += 1 * aSide
		elsif @angle%360 > 180 && @angle%360 < 270
		    @x += -1 * aSide
			@y += 1 * cSide
		elsif @angle%360 > 270 && @angle%360 < 360
		    @x += -1 * cSide
			@y += -1 * aSide
		elsif @angle == 0
			@y -= 7.07
		elsif @angle == 90
		    @x += 7.07
		elsif @angle == 180
			@y += 7.07
		elsif @angle == 270
		    @x -= 7.07
		end
		return [aSide, cSide, @angle]
=begin	
		if @angle == 0
			@y -= 10
		elsif @angle == 5
			@x += 0.87
			@y -= 9.96
		elsif @angle == 10
			@x += 1.74
			@y -= 9.85
		elsif @angle == 15
			@x += 2.59
			@y -= 9.66
		elsif @angle == 20
			@x += 3.42
			@y -= 9.40
		elsif @angle == 25
			@x += 4.23
			@y -= 9.06
		elsif @angle == 30
			@x += 5.00
			@y -= 8.66
		elsif @angle == 35
			@x += 5.74
			@y -= 8.19
		elsif @angle == 40
			@x += 6.43
			@y -= 7.66
		elsif @angle == 45
			@x += 7.07
			@y -= 7.07
		elsif @angle == 50
			@x += 7.66
			@y -= 6.43
		elsif @angle == 90
			@x += 10
		end
=end
	end
	
	def moveBack
		if @angle == 0
			@y += 5
		elsif @angle == 5
			@x -= 6
			@y += 1
		elsif @angle == 10
			@x -= 1.74
			@y += 9.85
		elsif @angle == 15
			@x -= 2.59
			@y += 9.66
		elsif @angle == 20
			@x -= 3.42
			@y += 9.40
		elsif @angle == 25
			@x -= 4.23
			@y += 9.06
		elsif @angle == 30
			@x -= 5.00
			@y += 8.66
		elsif @angle == 35
			@x -= 5.74
			@y += 8.19
		elsif @angle == 40
			@x -= 6.43
			@y += 7.66
		elsif @angle == 45
			@x -= 7.07
			@y += 7.07
		elsif @angle == 50
			@x -= 7.66
			@y += 6.43
		elsif @angle == 90
			@x -= 5
		end
	end
	
	def moveLeft
		@angle += 355
		if @angle >= 25560
			@angle = 0
		end
		@angle -= 360 unless @angle - 360 < -1
	end
	
	def moveRight
		@angle += 5
		@angle = 0 if @angle >= 360
	end
	
	def draw
	
		# BASE
		@imageTemp.each do |tile, i|
			tile.draw_rot(@x, @y, @z, @angle)
		end
		@image = @imageTemp[(Gosu::milliseconds / 10 % @imageTemp.size)]
		@image.draw_rot(@x, @y, @z + 0, @angle, 1.0, 1.0, @color1)
		
		# COCKPIT
		@imageTemp.each do |tile, i|
			tile.draw_rot(@x, @y, @z, @angle)
		end
		@image1 = @imageTemp1[(Gosu::milliseconds / 10 % @imageTemp1.size)]
		@image1.draw_rot(@x, @y, @z + 1, @angle)
		
		# THRUSTER
		@imageTemp2.each do |tile, i|
			tile.draw_rot(@x, @y, @z, @angle)
		end
		@image2 = @imageTemp2[(Gosu::milliseconds / 10 % @imageTemp2.size)]
		@image2.draw_rot(@x, @y, @z, @angle)
	end
	
end	

class Planet
	def initialize(planetNumber)
		@x = 1
		@y = 1
		@z = 1
		@height = 10
		@width = 10
		@image = Gosu::Image.new(".\\lyfe.png")
	end
	
	def draw
		
	end
end