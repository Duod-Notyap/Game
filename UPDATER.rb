require 'mechanize'
a = Mechanize.new
a.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE
puts "Please specify an install location:"
$INSTALL_DIR = gets.chomp

urls = [
  "https://raw.githubusercontent.com/Duod-Notyap/Game/master/main.rb"
  ]

paths = [
  "\main.rb"
  ]

urls.zip(paths).each do |url, path|
  f = File.new(path)
  f = File.open(path, "w+")
  content = a.new url, nil, ''
  f.puts content
  f.close
end


