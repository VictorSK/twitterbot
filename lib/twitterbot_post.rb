require './twitterbot'

module TwitterBot
  class Post < Base
    def tweet(message)
      @client.update(message)
      puts 'Sent'
    end
  end
end
