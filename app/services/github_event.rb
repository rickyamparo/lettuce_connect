class GithubEvent

  attr_accessor :attributes, :type, :repo, :date

  def initialize(attributes = {})
    @attributes = valid_attributes(attributes)

    @type = @attributes[:type]
    @repo = @attributes[:repo][:name]
    @date = Time.parse(@attributes[:created_at]).to_date.to_s
  end

  def self.recent_events(raw_events)
    events = raw_events.map do |event|
      GithubEvent.new(event)
    end
  end

  def valid_attributes(attributes)
    if attributes.nil?
      attributes[:type] = "Not Found"
      attributes[:repo][:name] = Time.now.to_s
      attributes[:created_at] = "Not Found"
    end
    attributes
  end
end
