class LikesController < ApplicationController
  def create
    @post = Post.find_by(id: params[:post_id])
    @user = User.find_by(id: params[:user_id])
    @like = @post.likes.create!(user: current_user, post: @post)
    redirect_to user_post_path(@user, @post)
  end
end
