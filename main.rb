
################
# DEPENDENCIES #
################
require 'gosu'
require '.\assets\classes.rb' # All common classes shared between different files will be stored in this Ruby file
require 'chunky_png'
#require '.\assets\game.rb' # Main Game File?
################
puts "Please give the R, G, B, and A vales of the color separated by spaces"
$rgb = gets.chomp.split " "


###########################
# LAUNCHER WINDOW DEFINED #
###########################
class GameWindow < Gosu::Window
  def initialize()
    super(1920, 1080, true, 1)
	@pixel = ChunkyPNG::Image.new(10, 10, ChunkyPNG::Color.rgba($rgb[0].to_i, $rgb[1].to_i, $rgb[2].to_i, $rgb[3].to_i)).save("image.png")
    @cursor = Cursor.new(self.mouse_x, self.mouse_y)
		self.caption = "Spaceship Game - 0.0.1 - Build 0005"
		@playerShip = PlayerShip.new(500, 500)
		@fps = Gosu::Font.new(20)
		@sides = 0
  end
  def update()
    @cursor.reposition(self.mouse_x, self.mouse_y)
		if button_down?(Gosu::KbW) && button_down?(Gosu::KbS)
		elsif button_down?(Gosu::KbW)
			@sides = @playerShip.moveForward
		elsif button_down?(Gosu::KbS)
			@playerShip.moveBack
		end
		if button_down?(Gosu::KbA) && button_down?(Gosu::KbD)
		elsif button_down?(Gosu::KbA)
			@playerShip.moveLeft
		elsif button_down?(Gosu::KbD)
			@playerShip.moveRight
		end
		if button_down?(Gosu::KbEscape)
			File.delete("image.png")
			exit
		end
  end
  def draw()
    @cursor.draw
		@playerShip.draw
		@fps.draw(Gosu.fps.to_s + " " + @sides.to_s + " " + @playerShip.angle.to_s, 0, 0, 1, 1.0, 1.0, 0xff_ffffff)
  end
end
###########################


window = GameWindow.new.show

