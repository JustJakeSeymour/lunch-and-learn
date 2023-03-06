class TouristSightSerializer
  def self.format(tourist_sights)
    {
    "data": 
      tourist_sights.map do |tourist_sight| 
        {
          "id": nil,
          "type": "tourist_sight",
          "attributes": {
            "name": tourist_sight.name,
            "address": tourist_sight.address,
            "place_id": tourist_sight.place_id
          }
        } 
      end
    }
  end
end