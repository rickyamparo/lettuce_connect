class Tweet

  attr_accessor :text, :date, :likes, :attributes

  def initialize(attributes = {})
    binding.pry
    @attributes = valid_attributes(attributes)
    @text = @attributes[:text]
    @date = Time.parse(@attributes[:created_at]).to_date.to_s
    @likes = @attributes[:favorite_count]
  end

  def valid_attributes(attributes)
    if attributes.nil?
      attributes = {}
      attributes[:text] = "Not Found"
      attributes[:created_at] = Time.now.to_s
      attributes[:favorite_count] = "Not Found"
    end
    attributes
  end

end
