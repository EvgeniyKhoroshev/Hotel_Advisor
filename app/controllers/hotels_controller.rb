class HotelsController < ApplicationController

  def index
    @hotels = Hotel.paginate(page: params[:page], :per_page => 6)
  end

  def show
    @hotel = Hotel.find(params[:id])
    if @hotel.posts.to_a != []
      @posts = @hotel.posts.to_a.paginate(page: params[:page], :per_page => 10)
      @post = Post.new
    else
      @posts = []
      @post = Post.new

    end
  end

  def new
    @hotel = Hotel.new
  end

  def create
    @hotel = Hotel.new(permitted_params)
    @hotel.user_id = current_user.id
    if @hotel.save
      redirect_to current_user
    else
      render :new
    end
  end

  def edit
    @hotel = Hotel.find(params[:id])
  end

  def update
    @hotel = Hotel.find(params[:id])
    if @hotel.update permitted_params
      redirect_to current_user
    else
      render :edit
    end
  end

  def destroy
    hotel = Hotel.find(params[:id]).destroy
    redirect_to current_user
  end

  private
  def permitted_params
    params.require(:hotel).permit(:title, :rating, :breakfast_included, :room_description, :photo, :price, :address)
  end
end
