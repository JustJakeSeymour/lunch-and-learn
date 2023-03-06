class FavoriteSerializer
  def self.format(favorites)
    {
    "data": 
      favorites.map do |favorite|
        {
            "id": favorite.id.to_s,
            "type": "favorite",
            "attributes": {
                "recipe_title": favorite.recipe_title,
                "recipe_link": favorite.recipe_link,
                "country": favorite.country,
                "created_at": favorite.created_at
            }
        }
      end
    }    
  end
end