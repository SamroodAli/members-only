class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new,:create]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(user_params)
  end

  def index
  end

  private
  def user_params
    params.require(:post).permit(:title,:body)
  end
end
