class Api::V1::PostsController < ApplicationController

  before_action :signed_user, only: :destroy

  def new
    post = Post.new
  end

  def index
    hotel = Hotel.find(params[:hotel_id])
    posts = hotel.posts
    render json: posts, status: :ok
  end

  def create
    hotel = Hotel.find(params[:hotel_id])
    post = Post.create(permitted_params)
    post.hotel_id = hotel.id
    post.user_id = current_user.id
    if post.save
      render json: post, status: :created
    else
      render json: post.errors, status: :unprocessable_entity
    end
  end

  def destroy
    hotel = Hotel.find(params[:hotel_id])
    post = hotel.posts.find(params[:id])
    if post.destroy
      render nothing, status: :ok
    else
      render nothing, status: :unprocessable_entity
    end
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :body, :hotel_id, :user_id)
  end

  def signed_user
    if signed_in?
      if current_user.admin? || Hotel.find(params[:hotel_id]).posts.find(params[:id]).user_id == current_user.id
        render nothing, status: :ok
      else
        render nothing, status: :unauthorized
      end
    else
      render nothing, status: :unauthorized
    end
  end

end
