
 ShareJobsSign UpLog In

, 1
1
​
2
################
3
# DEPENDENCIES #
4
################
5
require 'gosu'
6
require '.\assets\classes.rb' # All common classes shared between different files will be stored in this Ruby file
7
require '.\assets\funcs.rb' # Main Game File? - THIS IS THE MAIN FILE
8
require '.\assets\colls.rb'
9
################
10
​
11
​
12
###########################
13
# LAUNCHER WINDOW DEFINED #
14
###########################
15
class LauncherWindow < Gosu::Window
16
  def initialize()
17
    self.caption = "Launcher Window"
18
    super(500, 200, false, 1)
19
    @cursor = Cursor.new(self.mouse_x, self.mouse_y)
20
  end
21
  def update()
22
    @cursor.reposition(self.mouse_x, self.mouse_y)
23
  end
24
  def draw()
25
    @cursor.draw
26
  end
27
end
28
###########################
29
​
30
​


