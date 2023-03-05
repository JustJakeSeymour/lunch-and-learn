class Api::V1::UsersController < ApplicationController
  def create
    new_user = User.create(name: params['name'], email: params['email'], api_key: api_gen)
    render json: UserSerializer.format(new_user)
  end

private

  def api_gen
    Faker::Barcode.ean(13)
  end
end