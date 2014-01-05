files = Dir["./lib/**/*.rb"]
files.each { |file| require file }

run URLShortener.new
