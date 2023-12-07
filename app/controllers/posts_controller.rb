class PostsController < ApplicationController
  def index
    @user = User.find_by_id(params[:user_id])
    @post = @user.posts
  end

  def show
    logger.debug(params)
    @user = User.find(params[:user_id])
    @post = @user.posts.find_by_id(params[:id])
    @comments = @post.comments
  end
end
