class Api::V1::FavoritesController < ApplicationController
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