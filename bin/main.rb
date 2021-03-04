

require 'net/http'
require 'json'
require './lib/bot_telegram'
require './lib/movie'

#bot_telegram_instance = BotTelegram.new
#bot_telegram_instance.startbot

movies = Movie.new
json_response = movies.soon

#json_response['items'].each do |item|
#  image = item['image'].sub! 'original', '192x264'
#  puts " #{item['title']} : #{image}"
#end
