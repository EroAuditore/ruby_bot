require './lib/bot_telegram'

describe BotTelegram do
  let(:bot) { BotTelegram.new }

  describe '#initialize' do
    it 'initialize bot_telegram with token' do
      expect(bot.token).not_to eq ''
    end
  end
end
