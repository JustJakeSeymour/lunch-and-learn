class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.create(name: body_json_read[:name], email: body_json_read[:email], api_key: api_gen)
    require 'pry'; binding.pry
    render json: UserSerializer.format(new_user)
  end

private
  def body_json_read
    require 'pry'; binding.pry
    JSON.parse(request.body.read, symbolize_names: true)
  end

  def api_gen
    Faker::Barcode.ean(13).to_s
  end
end