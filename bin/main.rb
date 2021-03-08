require 'net/http'
require 'json'
require_relative '../lib/bot_telegram'
require_relative '../lib/movie'

bot_telegram_instance = BotTelegram.new('1686908381:AAE8H94uvBh8jvpWesz4Mrlmt3AL1gWZ50s', 'k_28o0a0zk')
bot_telegram_instance.startbot
