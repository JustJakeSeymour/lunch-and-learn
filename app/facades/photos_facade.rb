class PhotosFacade
  def self.country_photos(country)
    json = PhotosService.country_photos(country)
    photos_array(json)
  end

  def self.photos_array(json)
    json.map do |data|
      Photo.new(data)
    end
  end
end