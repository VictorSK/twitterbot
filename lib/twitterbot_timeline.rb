require './twitterbot'

module TwitterBot
  class TimeLine < Base
    def get_all_tweets(user)
      collect_with_max_id do |max_id|
        options = {count: 200, include_rts: true}
        options[:max_id] = max_id unless max_id.nil?
        user_timeline(user, options)
      end
    end

    def get_recent_tweets(user)
      @client.user_timeline(user, :include_rts).each do |tweet|
        puts "\n#{tweet.text}"
        puts '=========================='
      end
    end

    private
    def collect_with_max_id(collection=[], max_id=nil, &block)
      response = yield(max_id)
      collection += response
      response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
    end
  end
end
