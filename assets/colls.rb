# Collision Code

require 'chunky_png'

#ALL COLLIDING CLASSES REQUIRE @path, @width, @height, @x, @y, and @boundpixsarr TO BE ACCESSIBLE VIA attr_accessor
class Collision
  def initialize
  end
  
  def generate(objs)
    @endobjhas = {}
    boundpixs = []
    objs.w.times do |x|
      objs.h.times do |y|
        img = ChunkyPNG::Image.new(objs.path)
        if img[x, y].alpha == 0
        elsif img[x, y].alpha > 0
          if img[x+1, y].alpha > 0
          elsif img[x+1, y].alpha > 0
          elsif img[x-1, y].alpha > 0
          elsif img[x, y+1].alpha > 0
          elsif img[x, y-1].alpha > 0
          else
            boundpixs.push({x: x, y: y})
          end
        end
      end
    end
    @endobjhas.merge({bounds: boundpixs})
    findfarthestpixels()
    return @endobjhas
  end
  
    
  def findfarthestpixels()
      obj = @obarr
      max = 0
      cx = obj.width/2
      cy = obj.height/2
      obj[:boundpixs].each do |pix|
        x = pix[:x]
        y = pix[:y]
        dist = Math.sqrt((cx - x)**2 + (cy - y)**2)
        if dist > max
          max = dist
        end
      end
      obj.merge({r: max.to_i, center: [cx, cy]})
  end
  
  
  def collides?(obj1, obj2)
    obj1bounds = obj1.boundpixshas
    obj2bounds = obj2.boundpixshas
    cdist = Math.sqrt((obj1bounds[:center][0] - obj2bounds[:center][0])**2 + (obj1bounds[:center][1] - obj2bounds[:center][1])**2)
    if cdist < obj1bounds[:r] + obj2bounds[:r]
      obj1bounds[:bounds].each do |ob1p|
        obj2bounds[:bounds].each do |ob2p|
          if (ob1p[0] + obj1.x) == (ob2p[0] + obj2.x) && (ob1p[1] + ob1.y) == (ob2p[1] = obj2.y)
						puts "COLLIDES #{obj1} #{obj2}"
          end
        end
      end
    end
  end
end

      
    
    
    
    
    
    
    
    
    
=begin
  ---Docs---

#to generate collision 
EACH CLASS REQUIRES THESE CALLS
def initialize
	...
	@coll = Collision.new   x is an array of all objects(not necessary if y is used), y is an optional num of arguments to define objects one-by-one(still requires x to be a non-Array value sych as 1)(not required if x is used) 
	@boundpixshas = @coll.generate(self)     generate method defines the borders of the image(s) ONLY CALL ONCE PER CLASS
	...
end

def update
	...
	@coll.collides?(obj1, obj2)  obj1, obj2 are the two objects, returns TRUE if colliding
	...
end

=end




    