# rubocop: disable Metrics/MethodLength, Metrics/BlockLength, Metrics/AbcSize
# rubocop: disable Metrics/CyclomaticComplexity, Layout/LineLength

require 'telegram/bot'

class BotTelegram
  attr_accessor :token, :movies

  def initialize(token_b = '1686908381:AAE8H94uvBh8jvpWesz4Mrlmt3AL1gWZ50s', token_api = 'k_28o0a0zk')
    @token = token_b
    @movies = Movie.new(token_api)
  end

  def startbot
    Telegram::Bot::Client.run(@token) do |bot|
      puts "Telegram bot running..."
      bot.listen do |message|
        case message.text
        when '/help'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hi #{message.from.first_name} I'm Moviebot here are the Commands avialable to use: \n
                               /top10 The top 10 movies of the year \n
                               /soon Comming soon movies \n
                               /intheaters Movies that now are in the theaters \n
                               /suggest Suggested movie for today \n
                               /help Commands avialables
                               ")

        when '/start'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hi #{message.from.first_name} I'm Movie bot guru of the movies. Use /help the see what I can do for you ;) ")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Bye #{message.from.first_name}")
        when '/analize'
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hola #{message.from.first_name} voy analizar tus chats para determinar tu personalidad :D ")
          bot.api.send_message(chat_id: message.chat.id, text: 'Analizando... ')
          bot.api.send_message(chat_id: message.chat.id, text: 'Analizando...... ')
          bot.api.send_message(chat_id: message.chat.id, text: 'Analizando........ ')
          bot.api.send_message(chat_id: message.chat.id, text: 'Analizando.......... ')
          bot.api.send_message(chat_id: message.chat.id, text: 'Analizando............ ')
          bot.api.send_message(chat_id: message.chat.id,
                               text: "Hola #{message.from.first_name} termine de analizar y encontre tus pack los chats! y puedo determinar que eres una puta!! y eres tan puta que cuando te mueras tus piernas diran por fin juntas! ")
        when '/soon'
          json_response = @movies.soon
          bot.api.send_message(chat_id: message.chat.id, text: 'Coming soon in Theaters')
          json_response['items'].each do |item|
            bot.api.send_message(chat_id: message.chat.id, text: " #{item['title']}")
            image = item['image'].sub! 'original', '192x264'
            bot.api.send_photo(chat_id: message.chat.id, photo: image)
          end
        when '/intheaters'
          json_response = @movies.in_theaters
          bot.api.send_message(chat_id: message.chat.id, text: ' Now on Theaters')
          json_response['items'].each do |item|
            bot.api.send_message(chat_id: message.chat.id, text: " #{item['title']}")
            image = item['image'].sub! 'original', '192x264'
            bot.api.send_photo(chat_id: message.chat.id, photo: image)
          end
        when '/top10'
          json_response = @movies.top_movies
          json_response['items'].to_a[0..9].each do |item|
            bot.api.send_message(chat_id: message.chat.id, text: " #{item['title']}")
            bot.api.send_photo(chat_id: message.chat.id, photo: item['image'])
          end
        when '/suggest'
          sample = @movies.rand_movie
          bot.api.send_message(chat_id: message.chat.id, text: "Suggested movie: #{sample[0]['title']}")
          bot.api.send_photo(chat_id: message.chat.id, photo: sample[0]['image'])
        end
      end
    end
    puts "Telegram bot ended"
  end
end

# rubocop: enable Metrics/MethodLength, Metrics/BlockLength, Metrics/AbcSize
# rubocop: enable Metrics/CyclomaticComplexity, Layout/LineLength
