require 'open-uri'
puts "Please specify an install location:"
$INSTALL_DIR = gets.chomp

urls = [
  ""
  ]

paths = [
  "C:\#{$INSTALL_DIR}"
  ]

urls.zip(paths).each do |url, path|
  open(url) do |l|
    f = File.new(path)
    f = File.open(path, "w+")
    content = l.read
    f.puts content
    f.close
  end
end


