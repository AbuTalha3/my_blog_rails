class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.includes(:comments, :author)
  end

  def show
    logger.debug(params)
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @comments = @post.comments
  end
end
