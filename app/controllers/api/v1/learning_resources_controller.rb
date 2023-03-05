class Api::V1::LearningResourcesController < ApplicationController
  def index
    render json: LearningResourceSerializer.format(get_country_video, get_country_photos, country)
  end

  private
  def get_country_video
    VideosFacade.search_videos(country)
  end

  def get_country_photos
    PhotosFacade.country_photos(country)
  end

  def country
    if params[:country]
      params[:country]
    else
      CountriesFacade.random_country.name
    end
  end
end