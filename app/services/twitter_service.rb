class TwitterService

  attr_accessor :conn

  def initialize
    @conn = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER-CONSUMER-KEY"]
      config.consumer_secret     = ENV["TWITTER-CONSUMER-SECRET"]
      config.access_token        = ENV["TWITTER-ACCESS-TOKEN"]
      config.access_token_secret = ENV["TWITTER-ACCESS-SECRET"]
    end
  end

  def recent_tweet(connection)
    response = @conn.user_timeline(connection.twitter_handle.name)[0].to_json
    parsed_response = JSON.parse(response, symbolize_names: true)
  end

  def self.recent_tweet(connection)
    new.recent_tweet(connection)
  end

end
