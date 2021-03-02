
require './lib/BotTelegram'
require './lib/Movie'

#botTelegramInstance = BotTelegram.new

#botTelegramInstance.startbot

movies = Movie.new

json_response =  movies.searchMovie('insidius')

