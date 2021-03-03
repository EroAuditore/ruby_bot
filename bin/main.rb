
require 'net/http'
require 'json'

require './lib/BotTelegram'
require './lib/Movie'

botTelegramInstance = BotTelegram.new

botTelegramInstance.startbot



#json_response =  movies.topMovies

#json_response['items'].each do |item|
#        puts "#{item['id']}: #{item['title']}"
#end
       