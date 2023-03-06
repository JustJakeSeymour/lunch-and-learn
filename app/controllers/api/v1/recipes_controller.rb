class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipeSerializer.format(RecipesFacade.country_recipes(country), country)
  end

private
  def country
    if params[:country]
      params[:country]
    else
      CountriesFacade.random_country.name
    end
  end
end