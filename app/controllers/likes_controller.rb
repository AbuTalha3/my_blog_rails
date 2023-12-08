class LikesController < ApplicationController
  def create
    logger.debug(params)
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @like = @post.likes.build
    @like.user_id = current_user

    flash[:notice] = if @like.save
                       'Liked the post'
                     else
                       'Error Liking the post'
                     end

    redirect_to user_post_path(@user, @post)
  end
end
