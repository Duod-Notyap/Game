
################
# DEPENDENCIES #
################
require 'gosu'
require '.\assets\classes.rb' # All common classes shared between different files will be stored in this Ruby file
#require '.\assets\game.rb' # Main Game File?
################



###########################
# LAUNCHER WINDOW DEFINED #
###########################
class GameWindow < Gosu::Window
  def initialize()
    super(1920, 1080, true, 1)
    @cursor = Cursor.new(self.mouse_x, self.mouse_y)
		self.caption = "Spaceship Game - 0.0.1 - Build 0005"
		@playerShip = PlayerShip.new(500, 500)
		@fps = Gosu::Font.new(20)
  end
  def update()
    @cursor.reposition(self.mouse_x, self.mouse_y)
		if button_down?(Gosu::KbW) && button_down?(Gosu::KbS)
		elsif button_down?(Gosu::KbW)
			@playerShip.moveForward
		elsif button_down?(Gosu::KbS)
			@playerShip.moveBack
		end
		if button_down?(Gosu::KbA) && button_down?(Gosu::KbD)
		elsif button_down?(Gosu::KbA)
			@playerShip.rotateLeft
		elsif button_down?(Gosu::KbD)
			@playerShip.rotateRight
		end
  end
  def draw()
    @cursor.draw
		@playerShip.draw_rot(x, y, z, rot)#replace x y z and rot
		@fps.draw(Gosu.fps, 0, 0, 1, 1.0, 1.0, 0xff_ffffff)
  end
end
###########################


window = GameWindow.new.show

