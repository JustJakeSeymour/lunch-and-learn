class RecipeSerializer
  def self.format(recipes, country)
    {
    "data": 
      recipes.map do |recipe| 
        {
          "id": nil,
          "type": "recipe",
          "attributes": {
            "title": recipe.title,
            "url": recipe.url,
            "country": country,
            "image": recipe.image
          }
        } 
      end
    }
  end
end