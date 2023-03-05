class Api::V1::LearningResourcesController < ApplicationController
  def index
    render json: LearningResourceSerializer.format(VideosFacade.search_videos(params[:country]), PhotosFacade.country_photos(params[:country]), params[:country])
  end

  private
  def get_country_video
    VideosFacade.search_videos(params[:country])
  end

  def get_country_photos
    PhotosFacade.country_photos(params[:country])
  end
end