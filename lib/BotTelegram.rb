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
              when '/help'
                bot.api.send_message(chat_id: message.chat.id, text: "Hi #{message.from.first_name} I'm EroBot the master of the movies. Use /top10 to see the top movies of the year ")
                              
              when '/start'
                bot.api.send_message(chat_id: message.chat.id, text: "Hi #{message.from.first_name} I'm EroBot the master of the movies. Use /top10 to see the top movies of the year ")
              when '/stop'
                bot.api.send_message(chat_id: message.chat.id, text: "Bye ya no funciono :'(, #{message.from.first_name}")
              when '/analize'
                bot.api.send_message(chat_id: message.chat.id, text: "Hola #{message.from.first_name} voy analizar tus chats para determinar tu personalidad :D ")
                bot.api.send_message(chat_id: message.chat.id, text: "Analizando... ")
                bot.api.send_message(chat_id: message.chat.id, text: "Analizando...... ")
                bot.api.send_message(chat_id: message.chat.id, text: "Analizando........ ")
                bot.api.send_message(chat_id: message.chat.id, text: "Analizando.......... ")
                bot.api.send_message(chat_id: message.chat.id, text: "Analizando............ ")
                bot.api.send_message(chat_id: message.chat.id, text: "Hola #{message.from.first_name} termine de analizar y encontre tus pack los chats! y puedo determinar que eres una puta!! y eres tan puta que cuando te mueras tus piernas diran por fin juntas! ")
              when '/soon'
                json_response =  @movies.soon
                bot.api.send_message(chat_id: message.chat.id, text: "Coming soon in Theaters")
                json_response['items'].each do |item|
                  bot.api.send_message(chat_id: message.chat.id, text: " #{item['title']}")
                  image = item['image'].sub! 'original', '192x264'
                  bot.api.send_photo(chat_id: message.chat.id, photo: image)
                end
              when '/intheaters'
                json_response =  @movies.inTheaters
                bot.api.send_message(chat_id: message.chat.id, text: " Now on Theaters")
                json_response['items'].each do |item|
                  bot.api.send_message(chat_id: message.chat.id, text: " #{item['title']}")
                  image = item['image'].sub! 'original', '192x264'
                  bot.api.send_photo(chat_id: message.chat.id, photo: image)
                end
              when '/top10'
                json_response =  @movies.topMovies
                json_response['items'].to_a[0..9].each do |item|
                  bot.api.send_message(chat_id: message.chat.id, text: " #{item['title']}")
                  bot.api.send_photo(chat_id: message.chat.id, photo: item['image'])
              end
              when '/suggest'
                sample =  @movies.randMovie
                bot.api.send_message(chat_id: message.chat.id, text: "Suggested movie: #{sample[0]['title']}")
                bot.api.send_photo(chat_id: message.chat.id, photo: sample[0]['image'])
              end
            
            end
          end
    end
end