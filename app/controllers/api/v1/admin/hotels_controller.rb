class Api::V1::Admin::HotelsController < ApplicationController

  before_action :signed_in_admin, only: [:index, :destroy]

  def index
    hotels = Hotel.all
    render json: hotels, status: :ok
  end

  def destroy
    hotel = Hotel.find(params[:id]).destroy
    if hotel.destroy
      render nothing, status: :ok
    else
      render json: hotel.errors, status: :unprocessable_entity
    end
  end

  private

    def signed_in_admin
      if signed_in?
        if !current_user.admin?
          render nothing, status: :ok
        end
      else
        render nothing, status: :unprocessable_entity
      end
    end

end