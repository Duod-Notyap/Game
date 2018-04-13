

def rgb(r, g, b)
	print "#"
	playerColor = "#{to_hex r}#{to_hex g}#{to_hex b}"
end
def to_hex(n)
  print n.to_s(16).rjust(2, '0').upcase
end

0xA_RGB
0xFF_FFFF

curse = "0x00_00FF00"

argb(curse.to_i)
# Cursor - or + e = Curse