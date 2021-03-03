require 'telegram/bot'

class BotTelegram
    attr_accessor :token , :movies 
    def initialize
       @token = '1686908381:AAE8H94uvBh8jvpWesz4Mrlmt3AL1gWZ50s'
       @movies = Movie.new
    end

    def startbot
        Telegram::Bot::Client.run(@token) do |bot|
            bot.listen do |message|
              case message.text
              when '/topmovies'
                json_response =  @movies.topMovies
                json_response['items'].each do |item|
                  bot.api.send_message(chat_id: message.chat.id, text: "#{item['id']}: #{item['title']}")
                end                
              when '/start'
                bot.api.send_message(chat_id: message.chat.id, text: "Hi #{message.from.first_name} I'm EroBot the master of the movies. Use /topmovies to see the top movies of the year ")
              when '/stop'
                bot.api.send_message(chat_id: message.chat.id, text: "Bye ya no funciono :'(, #{message.from.first_name}")
              when '/quesoy'
                bot.api.send_message(chat_id: message.chat.id, text: "Hola #{message.from.first_name} eres una puta!!. Eres tan puta que cuando te mueras tus piernas diran por fin juntas! ")
  
              end
            
            end
          end
    end
end