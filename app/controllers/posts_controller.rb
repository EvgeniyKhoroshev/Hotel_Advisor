class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def create
    @hotel = Hotel.find(params[:hotel_id])
    @post = Post.create(permitted_params)
    @post.hotel_id = @hotel.id
    @post.user_id = current_user.id
    if @post.save
      redirect_to @hotel
    else
      redirect_to @hotel
    end
  end

  private
  def permitted_params
    params.require(:post).permit(:title, :body, :hotel_id, :user_id)
  end
end
