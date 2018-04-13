require 'mechanize'
a = Mechanize.new
a.agent.http.verify_mode = OpenSSL::SSL::VERIFY_NONE

urls = [
  "https://raw.githubusercontent.com/Duod-Notyap/Game/master/main.rb"
  ]

paths = [
  "main.rb"
  ]

urls.zip(paths).each do |url, path|
  content = a.get_file(url).save(path)
end


