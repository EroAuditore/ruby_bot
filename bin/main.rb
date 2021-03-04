
require 'net/http'
require 'json'

require './lib/BotTelegram'
require './lib/Movie'

botTelegramInstance = BotTelegram.new
botTelegramInstance.startbot


movies = Movie.new
json_response =  movies.topMovies
sample = json_response['items'].to_a.sample(1)
puts sample[0]['title']
puts sample[0]['image']



       