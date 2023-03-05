class Api::V1::RecipesController < ApplicationController
  def index
    render json: RecipeSerializer.format(RecipesFacade.country_recipes(params[:country]), params[:country])
  end
end