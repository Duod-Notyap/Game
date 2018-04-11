
################
# DEPENDENCIES #
################
require 'gosu'
require '.\assets\classes.rb' # All common classes shared between different files will be stored in this Ruby file
require '.\assets\funcs.rb' # Main Game File? - THIS IS THE MAIN FILE
require '.\assets\colls.rb'
################

​

​

###########################
# LAUNCHER WINDOW DEFINED #
###########################
class LauncherWindow < Gosu::Window
  def initialize()
    self.caption = "Launcher Window"
    super(500, 200, false, 1)
    @cursor = Cursor.new(self.mouse_x, self.mouse_y)
  end
  def update()
    @cursor.reposition(self.mouse_x, self.mouse_y)
  end
  def draw()
    @cursor.draw
  end
end
###########################

​

​


