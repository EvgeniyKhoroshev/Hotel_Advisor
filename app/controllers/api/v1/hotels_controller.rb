class Api::V1::HotelsController < ApplicationController
  
  def index
    hotels = Hotel.all
    render json: hotels, status: :ok
  end

  def show
    hotel = Hotel.find(params[:id])
    render json: hotel, status: :ok
  end

  def new
    hotel = Hotel.new
  end

  def create
    hotel = Hotel.new(permitted_params)
    hotel.user_id = current_user.id
    if hotel.save
      render json: hotel, status: :created
    else
      render json: hotel.errors, status: :unprocessable_entity
    end
  end

  def edit
    hotel = Hotel.find(params[:id])
  end

  def update
    hotel = Hotel.find(params[:id])
    if @hotel.update permitted_params
      render nothing, status: :ok
    else
      render json: hotel.errors, status: :unprocessable_entity
    end
  end

  def destroy
    hotel = Hotel.find(params[:id])
    if hotel.destroy
      render nothing, status: :ok
    else
      render json: hotel.errors, status: :unprocessable_entity
    end
  end

  private
  def permitted_params
    params.require(:hotel).permit(:title, :rating, :breakfast_included, :room_description, :photo, :price, :address)
  end
end