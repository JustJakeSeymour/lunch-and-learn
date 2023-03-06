class Api::V1::TouristSightsController < ApplicationController
  def index
    render json: TouristSightSerializer.format(TouristSightsFacade.capital_sights(params['country']))
  end
end