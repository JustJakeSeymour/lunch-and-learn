class Api::V1::FavoritesController < ApplicationController
  def index
    render json: FavoriteSerializer.format(Favorite.where(api_key: params['api_key']))
  end

  def create
    Favorite.create(
      api_key: params['api_key'], 
      country: params['country'], 
      recipe_link: params['recipe_link'], 
      recipe_title: params['recipe_title']
    )
    render json: success_message
  end

private
  def success_message
    {
      success: "Favorite added successfully"
    }
  end
end