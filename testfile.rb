require 'gosu'
require '.\\assets\\classes.rb'

class TestWindow < Gosu::Window
	def initialize
		super(700, 500, false, 1)
		@cursor = Cursor.new(self.mouse_x, self.mouse_y)
		@fps = Gosu::Font.new(20)
	end
	def update
		@cursor.reposition(self.mouse_x, self.mouse_y)
	end
	def draw
		@cursor.draw
		@fps.draw(Gosu.fps, 0, 0, 1, 1.0, 1.0, 0x88_ffffff)
	end
end

test = TestWindow.new.show