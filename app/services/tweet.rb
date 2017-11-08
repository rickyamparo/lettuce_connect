class Tweet

  attr_accessor :text, :date, :likes, :attributes

  def initialize(attributes = {})
    @attributes = attributes
    @text = attributes[:text]
    @date = Time.parse(attributes[:created_at]).to_date.to_s
    @likes = attributes[:favorite_count]
  end

end
