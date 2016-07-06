class Api::V1::Showhotels::UsersController < ApplicationController

  def show
    hotels = find_hotels
    render json: hotels, status: :ok
  end

  private
  def find_hotels
    user = User.find_by_id(params[:id])
    user.hotel
  end
end