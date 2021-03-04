require 'net/http'
require 'json'
require './lib/BotTelegram'
require './lib/Movie'

bot_telegram_instance = BotTelegram.new
bot_telegram_instance.startbot

movies = Movie.new
json_response = movies.soon

json_response['items'].each do |item|
  image = item['image'].sub! 'original', '192x264'
  puts " #{item['title']} : #{image}"
end
