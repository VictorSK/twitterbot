require './twitterbot'

module TwitterBot
  class Search < Base
    def search_twitter(term, quantity=1, options={})
      @client.search(term, options).take(quantity).each do |tweet|
        puts "\n#{tweet.user.screen_name}: #{tweet.text}"
        puts '=========================='
      end
    end
  end
end
