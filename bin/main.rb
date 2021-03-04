
require 'net/http'
require 'json'

require './lib/BotTelegram'
require './lib/Movie'

botTelegramInstance = BotTelegram.new
botTelegramInstance.startbot


movies = Movie.new
json_response =  movies.inTheaters

json_response['items'].each do |item|
        image = item['image'].sub! 'original', '192x264'
        puts " #{item['title']} : #{image}"
end
       