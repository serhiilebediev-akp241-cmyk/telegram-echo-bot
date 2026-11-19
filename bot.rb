require 'telegram/bot'

TOKEN = 8673335440:AAFmoM99OE8ZEK0UApINgxVbi7LngXBsZRY

puts 'Бот запущений і чекає на повідомлення...'

Telegram::Bot::Client.run(TOKEN) do |bot|
  bot.listen do |message|
    if message.is_a?(Telegram::Bot::Types::Message) && message.text
      case message.text
      when '/start'
        bot.api.send_message(
          chat_id: message.chat.id,
          text: "Привіт, #{message.from.first_name}! Я простий Ехо-бот. Напиши мені будь-що, і я повторю це."
        )
      else
        bot.api.send_message(
          chat_id: message.chat.id,
          text: message.text
        )
      end
    elsif message.is_a?(Telegram::Bot::Types::Message)
      bot.api.send_message(
        chat_id: message.chat.id,
        text: 'Я вмію повторювати лише текстові повідомлення!'
      )
    end
  end
end
