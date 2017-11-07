class GithubService

  attr_accessor :conn

  def initialize
    @conn = Faraday.new(:url => "https://api.github.com/") do |faraday|
      faraday.adapter Faraday.default_adapter
    end
  end

  def recent_events(connection)
    response = @conn.get("/users/#{connection.github_handle.name}/events/public")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end

  def self.recent_events(connection)
    new.recent_events(connection)
  end

end
