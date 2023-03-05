class Photo
  attr_reader :alt_tag,
              :url
              
  def initialize(data)
    @alt_tag = alt_description(data[:alt_description])
    @url = data[:urls][:raw]
  end

  def alt_description(data)
    if data
      data
    else
      ""
    end
  end
end