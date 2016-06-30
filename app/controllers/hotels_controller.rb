class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show
    @hotel = Hotel.find(params[:id])
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(permitted_params)
    if @hotel.save
      redirect_to hotels_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy
    hotel = Hotel.find(params[:id]).destroy
    redirect_to hotels_path
  end

  private
  def permitted_params
    params.require(:hotel).permit(:title,:rating,:breakfast_included,:room_description,:photo, :price, :address)
  end
end