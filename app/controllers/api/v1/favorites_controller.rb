class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by_api_key(params['api_key'])
    if user
      render json: FavoriteSerializer.format(Favorite.where(api_key: user.api_key))
    else
      render json: ErrorSerializer.format(Error.new("No user found with the api key: #{params['api_key']}", 'NOT FOUND', 404)), status: :unprocessable_entity
    end
  end
  
  def create
    user = User.find_by_api_key(params['api_key'])
    if user
      favorite = Favorite.create(
          api_key: user.api_key, 
          country: params['country'], 
          recipe_link: params['recipe_link'], 
          recipe_title: params['recipe_title']
        )
      render json: success_message
    else
      render json: ErrorSerializer.format(Error.new("No user found with the api key: #{params['api_key']}", 'NOT FOUND', 404)), status: :unprocessable_entity
    end
  end

private
  def success_message
    {
      success: "Favorite added successfully"
    }
  end
end