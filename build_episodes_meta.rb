require 'bundler/setup'

require 'mp3info'
require 'json'

data = {}
Dir['source/mp3/*'].each do |path|
  Mp3Info.open(path, :parse_tags => false) do |file|
    data[path] = {
      duration: Time.at(file.length).gmtime.strftime('%R:%S'),
      size: File.size(path)
    }
  end
end

puts data.to_json
