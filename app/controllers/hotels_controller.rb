class HotelsController < ApplicationController
  def index
    @hotels = Hotel.all
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy
    hotel = Hotel.find(params[:id]).destroy
    redirect_to hotels_path
  end
end