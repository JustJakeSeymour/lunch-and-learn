class RecipesFacade
  def self.country_recipes(country)
    json = RecipesService.country_recipes(country)[:hits]
    recipes_array(json)
  end

  def self.recipes_array(json)
    json.map do |data|
      Recipe.new(data)
    end
  end
end