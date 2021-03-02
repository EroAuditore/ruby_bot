require 'telegram/bot'

class BotTelegram
    attr_accessor :token 
    def initialize
       @token = '1686908381:AAE8H94uvBh8jvpWesz4Mrlmt3AL1gWZ50s'
    end

    def startbot
        Telegram::Bot::Client.run(@token) do |bot|
            bot.listen do |message|
              case message.text
              when '/insidius'
                bot.api.send_message(chat_id: message.chat.id, text: "Text from movies Appi, #{message.from.first_name}")
              when '/start'
                bot.api.send_message(chat_id: message.chat.id, text: "Hello ya funciono!!, #{message.from.first_name}")
              when '/stop'
                bot.api.send_message(chat_id: message.chat.id, text: "Bye ya no funciono :'(, #{message.from.first_name}")
              end
            end
          end
    end
end